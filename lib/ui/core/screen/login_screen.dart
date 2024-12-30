import "dart:io";

import "package:flutter/material.dart";
import "package:gap/gap.dart";
import "package:path_provider/path_provider.dart";
import "package:provider/provider.dart";
import "package:vault/context_extension.dart";
import "package:vault/data/repository/vault_repository.dart";
import "package:vault/data/service/vault_datasource.dart";
import "package:vault/ui/core/screen/create_vault_screen.dart";
import "package:vault/ui/core/screen/vault_screen.dart";
import "package:vault/ui/viewmodel/vault_viewmodel.dart";

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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.fingerprint, size: 224),
          TextField(
            controller: _controller,
            obscureText: true,
            onSubmitted: (_) => _openVault(),
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

  Future<void> _openVault() async {
    final Directory appDirectory = await getApplicationDocumentsDirectory();
    if (!mounted) return;

    await context.go(
      ChangeNotifierProvider(
        create: (_) => VaultViewModel(
          vaultRepository: VaultRepository(
            vaultDatasource: VaultDatasource(
              rootDirectory: appDirectory,
            ),
            vault: _controller.value.text,
          )..createVault(),
        )..loadVaultContent(),
        child: VaultScreen(),
      ),
    );
    _controller.clear();
  }

  void _createNewVault() {
    context.go(CreateVaultScreen());
  }
}
