import "package:flutter/material.dart";
import "package:gap/gap.dart";
import "package:vault/context_extension.dart";
import "package:vault/ui/core/screen/vault_screen.dart";

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Icon(Icons.fingerprint, size: 224),
          TextField(
            controller: _controller,
            obscureText: true,
          ),
          OutlinedButton(
            onPressed: _openVault,
            child: Text("Open Vault"),
          ),
          Row(
            children: [
              Expanded(child: Divider()),
              Gap(8),
              Text("OR"),
              Gap(8),
              Expanded(child: Divider()),
            ],
          ),
          TextButton(
            onPressed: _createNewVault,
            child: Text("Create New Vault"),
          ),
        ],
      ),
    );
  }

  void _openVault() {
    context.go(VaultScreen());
    _controller.clear();
  }

  void _createNewVault() {}
}
