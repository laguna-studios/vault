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
}
