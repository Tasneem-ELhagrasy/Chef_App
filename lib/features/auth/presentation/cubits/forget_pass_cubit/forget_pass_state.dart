class ForgetPassState {}

final class ForgetPassInitial extends ForgetPassState {}

final class SendCodeLoadingState extends ForgetPassState {}

final class ChangedNewPassSuffixSccessState extends ForgetPassState {}

final class ChangedConfirmPassSuffixSccessState extends ForgetPassState {}

final class SendCodeSuccessState extends ForgetPassState {
  final String email;

  SendCodeSuccessState(this.email);
}

final class SendCodeErrorState extends ForgetPassState {
  final String message;

  SendCodeErrorState(this.message);
}

final class ChangePassLoading extends ForgetPassState {}

final class ChangePassSuccess extends ForgetPassState {
  final String message;

  ChangePassSuccess(this.message);
}

final class ChangePassError extends ForgetPassState {
  final String message;

  ChangePassError(this.message);
}
