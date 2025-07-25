import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en')
  ];

  /// No description provided for @openVault.
  ///
  /// In en, this message translates to:
  /// **'Open Vault'**
  String get openVault;

  /// No description provided for @howToCreateAVault.
  ///
  /// In en, this message translates to:
  /// **'How To Create A Vault'**
  String get howToCreateAVault;

  /// No description provided for @findASecretThatOnlyYouKnow.
  ///
  /// In en, this message translates to:
  /// **'1. Find a secret that only you know.'**
  String get findASecretThatOnlyYouKnow;

  /// No description provided for @enterItAsYourVaultSecret.
  ///
  /// In en, this message translates to:
  /// **'2. Enter it as your vault secret.'**
  String get enterItAsYourVaultSecret;

  /// No description provided for @clickOpenVault.
  ///
  /// In en, this message translates to:
  /// **'3. Click \'Open Vault\'.'**
  String get clickOpenVault;

  /// No description provided for @congratsYoureDoneYouCreatedAVault.
  ///
  /// In en, this message translates to:
  /// **'4. Congrats! You\' re done. You created a vault.'**
  String get congratsYoureDoneYouCreatedAVault;

  /// No description provided for @gotIt.
  ///
  /// In en, this message translates to:
  /// **'Got It'**
  String get gotIt;

  /// No description provided for @howTo.
  ///
  /// In en, this message translates to:
  /// **'How To?'**
  String get howTo;

  /// No description provided for @thisFileCantBeOpen.
  ///
  /// In en, this message translates to:
  /// **'This file can\'t be open'**
  String get thisFileCantBeOpen;

  /// No description provided for @openFile.
  ///
  /// In en, this message translates to:
  /// **'Open File'**
  String get openFile;

  /// No description provided for @myVault.
  ///
  /// In en, this message translates to:
  /// **'My Vault'**
  String get myVault;

  /// No description provided for @goToParentDirectory.
  ///
  /// In en, this message translates to:
  /// **'Go To Parent Directory'**
  String get goToParentDirectory;

  /// No description provided for @noItemsYet.
  ///
  /// In en, this message translates to:
  /// **'No Items Yet'**
  String get noItemsYet;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @addFile.
  ///
  /// In en, this message translates to:
  /// **'Add File'**
  String get addFile;

  /// No description provided for @downloadFile.
  ///
  /// In en, this message translates to:
  /// **'Download File'**
  String get downloadFile;

  /// No description provided for @newFolder.
  ///
  /// In en, this message translates to:
  /// **'New Folder'**
  String get newFolder;

  /// No description provided for @createNewFolder.
  ///
  /// In en, this message translates to:
  /// **'Create New Folder'**
  String get createNewFolder;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @url.
  ///
  /// In en, this message translates to:
  /// **'URL'**
  String get url;

  /// No description provided for @optionalFileName.
  ///
  /// In en, this message translates to:
  /// **'(Optional) File Name'**
  String get optionalFileName;

  /// No description provided for @download.
  ///
  /// In en, this message translates to:
  /// **'Download'**
  String get download;

  /// No description provided for @downloadFailed.
  ///
  /// In en, this message translates to:
  /// **'Download failed: {message}'**
  String downloadFailed(Object message);

  /// No description provided for @downloadHasBeenSuccessful.
  ///
  /// In en, this message translates to:
  /// **'Download has been successful'**
  String get downloadHasBeenSuccessful;

  /// No description provided for @xFilesSelected.
  ///
  /// In en, this message translates to:
  /// **'{count} Files Selected'**
  String xFilesSelected(Object count);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['de', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
