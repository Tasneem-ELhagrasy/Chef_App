class MealModel {
  final String name;
  final String description;
  final int price;
  final String howToSell;
  final List<String> images;
  final String category;
  final String chefId;
  final String status;
  final String id;
  final String createdAt;
  final String updatedAt;

  MealModel({
    required this.name,
    required this.description,
    required this.price,
    required this.howToSell,
    required this.images,
    required this.category,
    required this.chefId,
    required this.status,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
  });

  factory MealModel.fromJson(Map<String, dynamic> json) {
    return MealModel(
      name: json['name'],
      description: json['description'],
      price: json['price'],
      howToSell: json['howToSell'],
      images: List<String>.from(json['images']),
      category: json['category'],
      chefId: json['chefId'],
      status: json['status'],
      id: json['_id'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}

class GetAllMealsModel {
  final String message;
  final List<MealModel> meals;

  GetAllMealsModel({required this.message, required this.meals});

  factory GetAllMealsModel.fromJson(Map<String, dynamic> jsonData) {
    return GetAllMealsModel(
      message: jsonData['message'],
      meals: jsonData['meals'].map<MealModel>((i) => MealModel.fromJson(i)).toList(),
    );
  }
}
