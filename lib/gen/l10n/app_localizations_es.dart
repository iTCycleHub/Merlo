// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Merlo';

  @override
  String get counterAppBarTitle => 'Contador';

  @override
  String get counterButtonText => 'Incrementar';

  @override
  String get home => 'Inicio';

  @override
  String get welcome => 'Bienvenido a Merlo';

  @override
  String get description =>
      'Plataforma digital para gestión comercial integral';

  @override
  String get invalidEmail => 'Dirección de correo electrónico inválida';

  @override
  String get invalidPassword =>
      'La contraseña debe tener al menos 8 caracteres y contener al menos una letra y un número';

  @override
  String get confirmPasswordMismatch =>
      'La confirmación de contraseña no coincide';
}
