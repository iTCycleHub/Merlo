// Copyright 2025 iTCycle. All rights reserved.
// Developed by iTCycle
// Project: Merlo

import 'package:formz/formz.dart';
import 'package:merlo/l10n/l10n.dart';

enum PasswordConfirmationValidationError { mismatch }

class PasswordConfirmationInput
    extends FormzInput<String, PasswordConfirmationValidationError> {
  const PasswordConfirmationInput.pure([super.value = '', this._password = ''])
      : super.pure();
  const PasswordConfirmationInput.dirty(this._password, [super.value = ''])
      : super.dirty();

  final String _password;
  @override
  PasswordConfirmationValidationError? validator(String value) {
    if (_password != value) {
      return PasswordConfirmationValidationError.mismatch;
    }
    return null;
  }
}

extension on PasswordConfirmationValidationError {
  // ignore: unused_element
  String errorMessage(AppLocalizations i10n) {
    switch (this) {
      case PasswordConfirmationValidationError.mismatch:
        return i10n.confirmPasswordMismatch;
    }
  }
}
