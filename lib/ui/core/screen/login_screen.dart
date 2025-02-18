import "dart:io";

import "package:flutter/material.dart";
import "package:gap/gap.dart";
import "package:path_provider/path_provider.dart";
import "package:provider/provider.dart";
import "package:vault/context_extension.dart";
import "package:vault/data/repository/vault_repository.dart";
import "package:vault/data/service/vault_datasource.dart";
import "package:vault/ui/core/promo_drawer.dart";
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
      backgroundColor: const Color.fromARGB(255, 8, 26, 40),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      drawer: PromoDrawer(),
      body: Builder(
        builder: (context) {
          return Center(
            child: Column(
              children: [
                Gap(32),
                Image.asset(
                  "assets/logo.png",
                  height: 200,
                ),
                Gap(64),
                SizedBox(
                  width: 320,
                  child: TextField(
                    controller: _controller,
                    obscureText: true,
                    onSubmitted: (_) => _openVault(),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      filled: true,
                      hintText: "Enter Vault Secret",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Gap(16),
                SizedBox(
                  width: 320,
                  child: OutlinedButton(
                    onPressed: _openVault,
                    child: Text("Open Vault"),
                    style: ButtonStyle(
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
                        side: WidgetStatePropertyAll(BorderSide(color: Colors.white))),
                  ),
                ),
                Gap(8),
                SizedBox(
                  width: 320,
                  child: TextButton(
                    onPressed: () {
                      showBottomSheet(
                        context: context,
                        builder: (context) {
                          return BottomSheet(
                            onClosing: () {},
                            builder: (context) {
                              return Container(height: 500, color: Colors.white, child: Text("Help"));
                            },
                          );
                        },
                      );
                    },
                    child: Text("How To?"),
                  ),
                ),
              ],
            ),
          );
        },
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
        )
          ..loadSettings()
          ..loadVaultContent(),
        child: VaultScreen(),
      ),
    );
    _controller.clear();
  }
}
