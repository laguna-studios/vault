import "package:flutter/material.dart";
import "package:in_app_review/in_app_review.dart";
import "package:shared_preferences/shared_preferences.dart";
import "package:vault/ui/core/screen/login_screen.dart";
import "l10n/app_localizations.dart";

void main() {
  runApp(const VaultApp());
}

class VaultApp extends StatefulWidget {
  const VaultApp({super.key});

  @override
  State<VaultApp> createState() => _VaultAppState();
}

class _VaultAppState extends State<VaultApp> {
  @override
  void initState() {
    super.initState();
    askForReview();
  }

  Future<void> askForReview() async {
    try {
      final String key = "appStarts";
      final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      int appStarts = sharedPreferences.getInt(key) ?? 0;

      if (appStarts == 7) {
        final bool available = await InAppReview.instance.isAvailable();
        if (available) InAppReview.instance.requestReview();
      }
      if (appStarts < 8) {
        sharedPreferences.setInt(key, ++appStarts);
      }
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData.dark(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      home: LoginScreen(),
    );
  }
}
