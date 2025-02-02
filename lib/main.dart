import "package:flutter/material.dart";
import "package:vault/ui/core/screen/login_screen.dart";

void main() {
  runApp(const VaultApp());
}

class VaultApp extends StatelessWidget {
  const VaultApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      home: LoginScreen(),
    );
  }
}
