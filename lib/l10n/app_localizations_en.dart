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

  @override
  String get myVault => 'My Vault';

  @override
  String get goToParentDirectory => 'Go To Parent Directory';

  @override
  String get noItemsYet => 'No Items Yet';

  @override
  String get delete => 'Delete';

  @override
  String get addFile => 'Add File';

  @override
  String get downloadFile => 'Download File';

  @override
  String get newFolder => 'New Folder';

  @override
  String get createNewFolder => 'Create New Folder';

  @override
  String get cancel => 'Cancel';

  @override
  String get ok => 'OK';

  @override
  String get url => 'URL';

  @override
  String get optionalFileName => '(Optional) File Name';

  @override
  String get download => 'Download';

  @override
  String downloadFailed(Object message) {
    return 'Download failed: $message';
  }

  @override
  String get downloadHasBeenSuccessful => 'Download has been successful';

  @override
  String xFilesSelected(Object count) {
    return '$count Files Selected';
  }
}
