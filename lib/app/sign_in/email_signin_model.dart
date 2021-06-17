import 'package:time_tracker_flutter_course/app/sign_in/StringValidator.dart';

enum EmailSignInFormType {
  signIn,
  register,
}

class EmailSignInModel with EmailAndPasswordValidator {
  EmailSignInModel({
    this.email = '',
    this.password = '',
    this.formType = EmailSignInFormType.signIn,
    this.isLoading = false,
    this.submitted = false,
  });

  final String email;
  final String password;
  final EmailSignInFormType formType;
  final bool isLoading;
  final bool submitted;

  String get primaryButtonText {
    return formType == EmailSignInFormType.signIn ? 'Sign in' : 'Create an account';
  }

  String get secondaryButtonText {
    return formType == EmailSignInFormType.signIn ? 'Need an account? Register' : 'Have an account? Sign in';
  }

  bool get canSubmit {
    return emailValidator.isValid(email) && passwordValidator.isValid(password) && !isLoading;
  }

  String get passwordErrorText {
    bool showErrorText = submitted && !passwordValidator.isValid(password);
    return showErrorText ? invalidPasswordErroText : null;
  }

  String get emailErrorText {
    bool showErrorText = submitted && !emailValidator.isValid(email);
    return showErrorText ? invalidEmailErroText : null;
  }

  EmailSignInModel copyWith({
    String email,
    String password,
    EmailSignInFormType formType,
    bool isLoading,
    bool submitted,
  }) {
    return EmailSignInModel(
      email: email ?? this.email,
      password: email ?? this.password,
      formType: email ?? this.formType,
      isLoading: email ?? this.isLoading,
      submitted: email ?? this.submitted,
    );
  }
}
