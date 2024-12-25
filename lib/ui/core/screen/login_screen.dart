import "package:flutter/material.dart";

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Icon(Icons.fingerprint, size: 224),
          TextField(),
          OutlinedButton(
            onPressed: () => _openVault(context),
            child: Text("Open Vault"),
          ),
          Row(
            children: [
              Divider(),
              Text("OR"),
              Divider(),
            ],
          ),
          TextButton(
            onPressed: () => _createNewVault(context),
            child: Text("Create New Vault"),
          ),
        ],
      ),
    );
  }

  void _openVault(BuildContext context) {}

  void _createNewVault(BuildContext context) {}
}
