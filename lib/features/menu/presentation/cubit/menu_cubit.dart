import 'package:chef_app/features/menu/data/menu_reopsitory/menu_repo.dart';
import 'package:chef_app/features/menu/data/model/meal_model.dart';
import 'package:chef_app/features/menu/presentation/cubit/menu_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class MenuCubit extends Cubit<MenuState> {
  MenuCubit(this.menuRepo) : super(MenuInitial());

  TextEditingController mealNameController = TextEditingController();
  TextEditingController mealPriceController = TextEditingController();
  TextEditingController mealDescController = TextEditingController();
  GlobalKey<FormState> addMealKey = GlobalKey<FormState>();
  XFile? image;
  final MenuRepo menuRepo;

  List categoryList = [
    'Beef',
    'Chicken',
    "Fish",
    "Seafood",
    "Pork",
    "Lamb",
    "Vegetarian",
    "Vegan",
    "Gluten-free",
  ];
  var selectedItem = 'Beef';
  void changeItem(item) {
    selectedItem = item;
    emit(ChangeItemState());
  }

  String groupval = 'quantity';
  void changeGroupVal(value) {
    groupval = value;
    emit(ChangeGroupValState());
  }

  //! Take Photo Method
  void takePhoto(value) {
    image = value;
    emit(TakePhotoSuccessState());
  }

  //! Add Meal Method
  void addMeal() async {
    emit(AddMealLoadingState());
    final response = await menuRepo.addMeal(
      image: image!,
      mealName: mealNameController.text,
      mealPrice: double.parse(mealPriceController.text),
      mealDesc: mealDescController.text,
      mealCategory: selectedItem,
      howToSell: groupval,
    );
    response.fold(
      (l) => emit(AddMealErrorState()),
      (r) => emit(AddMealSeccessState()),
    );
  }

  //! Delete Meal Method
  void deleteMeal(id) async {
    emit(DeleteMealLoadingState());
    final response = await menuRepo.deleteMeal(id: id);
    response.fold(
      (l) => emit(DeleteMealErrorState()),
      (r) => emit(DeleteMealSuccessState()),
    );
  }

  //! Get All Meals Method
  List<MealModel> meals = [];
  void getAllMeals() async {
    emit(GetAllMealsLoadingState());
    final response = await menuRepo.getALlMeals();
    response.fold(
      (l) => emit(GetAllMealsErrorState()),
      (r) {
        meals = r.meals;
        emit(GetAllMealsSuccessState());
      },
    );
  }
}
