// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get openVault => 'Tresor öffnen';

  @override
  String get howToCreateAVault => 'Wie erstelle ich einen Tresor?';

  @override
  String get findASecretThatOnlyYouKnow =>
      '1. Denke dir ein geheimes Passwort aus.';

  @override
  String get enterItAsYourVaultSecret => '2. Tippe es als dein Passwort ein.';

  @override
  String get clickOpenVault => '3. Drücke \'Tresor öffnen\'.';

  @override
  String get congratsYoureDoneYouCreatedAVault =>
      '4. Herzlichen Glückwunsch! Du hast einen Tresor erstellt.';

  @override
  String get gotIt => 'Verstanden';

  @override
  String get howTo => 'Anleitung';

  @override
  String get thisFileCantBeOpen => 'Die Datei kann nicht geöffnet werden.';

  @override
  String get openFile => 'Datei öffnen';

  @override
  String get myVault => 'Mein Tresor';

  @override
  String get goToParentDirectory => 'Ein Ordner zurück';

  @override
  String get noItemsYet => 'Keine Dateien vorhanden';

  @override
  String get delete => 'Löschen';

  @override
  String get addFile => 'Datei hinzufügen';

  @override
  String get downloadFile => 'Datei downloaden';

  @override
  String get newFolder => 'Neuer Ordner';

  @override
  String get createNewFolder => 'Neuer Ordner';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get ok => 'OK';

  @override
  String get url => 'URL';

  @override
  String get optionalFileName => '(Optional) Dateiname';

  @override
  String get download => 'Download';

  @override
  String downloadFailed(Object message) {
    return 'Download fehlgeschlagen: $message';
  }

  @override
  String get downloadHasBeenSuccessful => 'Download war erfolgreich';

  @override
  String xFilesSelected(Object count) {
    return '$count Dateien ausgewählt';
  }
}
