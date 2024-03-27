import 'localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Code Base';

  @override
  String get invalidEmail => 'Email không hợp lệ';

  @override
  String get invalidPhone => 'Số điện thoại không hợp lệ';

  @override
  String get emailNotFound => 'Email không đúng';

  @override
  String get phoneNotFound => 'Số điện thoại không đúng';

  @override
  String get or => 'hoặc';
}
