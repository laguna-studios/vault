// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get openVault => 'Open Vault';

  @override
  String get howToCreateAVault => 'How To Create A Vault';

  @override
  String get findASecretThatOnlyYouKnow =>
      '1. Find a secret that only you know.';

  @override
  String get enterItAsYourVaultSecret => '2. Enter it as your vault secret.';

  @override
  String get clickOpenVault => '3. Click \'Open Vault\'.';

  @override
  String get congratsYoureDoneYouCreatedAVault =>
      '4. Congrats! You\' re done. You created a vault.';

  @override
  String get gotIt => 'Got It';

  @override
  String get howTo => 'How To?';

  @override
  String get thisFileCantBeOpen => 'This file can\'t be open';

  @override
  String get openFile => 'Open File';
}
