import 'package:hucel_core/hucel_core.dart';

mixin TextFormFieldMixin {
  EmailValidationEnum emailValidation({required String email}) {
    if (!email.isValidEmail) return EmailValidationEnum.notValid;
    if (email.length > 100) return EmailValidationEnum.longEmail;
    return EmailValidationEnum.valid;
  }

  PasswordValidationEnum passwordValidation({required String password}) {
    if (password.length < 8) return PasswordValidationEnum.shortPassword;
    if (password.length > 24) return PasswordValidationEnum.longPassword;
    if (!password.isValidLowPassword) return PasswordValidationEnum.notValid;
    return PasswordValidationEnum.valid;
  }
}
