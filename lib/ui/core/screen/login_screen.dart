import "dart:io";

import "package:flutter/material.dart";
import "package:flutter_animate/flutter_animate.dart";
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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  final TextEditingController _controller = TextEditingController();

  final Duration logoDuration = Duration(milliseconds: 600);
  final Duration inputDuration = Duration(milliseconds: 500);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color.fromARGB(255, 8, 26, 40),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      drawer: PromoDrawer(),
      body: Builder(
        builder: (context) {
          return Center(
            child: Column(
              children: [
                Expanded(
                  child: Center(
                    child: Animate(
                      effects: [
                        FadeEffect(duration: logoDuration),
                        SlideEffect(duration: logoDuration, curve: Curves.easeInOut)
                      ],
                      child: Image.asset(
                        "assets/logo.png",
                        height: 200,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Animate(
                        delay: logoDuration * 2,
                        effects: [
                          FadeEffect(),
                          SlideEffect(duration: inputDuration, begin: Offset(0, 1), curve: Curves.easeInOut)
                        ],
                        child: SizedBox(
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
                      ),
                      Gap(4),
                      Animate(
                        delay: logoDuration * 2 + inputDuration * 0.5,
                        effects: [
                          FadeEffect(),
                          SlideEffect(duration: inputDuration, begin: Offset(0, 1), curve: Curves.easeInOut)
                        ],
                        child: SizedBox(
                          width: 320,
                          child: OutlinedButton(
                            onPressed: _openVault,
                            child: Text("Open Vault"),
                            style: ButtonStyle(
                                shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
                                side: WidgetStatePropertyAll(BorderSide(color: Colors.white))),
                          ),
                        ),
                      ),
                      Gap(4),
                      Animate(
                        delay: logoDuration * 2 + inputDuration,
                        effects: [
                          FadeEffect(),
                          SlideEffect(duration: inputDuration, begin: Offset(0, 1), curve: Curves.easeInOut)
                        ],
                        child: SizedBox(
                          width: 320,
                          child: TextButton(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return BottomSheet(
                                    showDragHandle: true,
                                    enableDrag: true,
                                    onClosing: () {},
                                    builder: (context) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 16),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Align(
                                              child: Text(
                                                "How To Create A Vault",
                                                style: Theme.of(context).textTheme.headlineMedium,
                                              ),
                                            ),
                                            Gap(16),
                                            Text(
                                              "1. Find a secret that only you know.",
                                              style: Theme.of(context).textTheme.bodyLarge,
                                            ),
                                            Gap(4),
                                            Text(
                                              "2. Enter it as your vault secret.",
                                              style: Theme.of(context).textTheme.bodyLarge,
                                            ),
                                            Gap(4),
                                            Text(
                                              "3. Click 'Open Vault'.",
                                              style: Theme.of(context).textTheme.bodyLarge,
                                            ),
                                            Gap(4),
                                            Text(
                                              "4. Congrats! You' re done. You created a vault.",
                                              style: Theme.of(context).textTheme.bodyLarge,
                                            ),
                                            Gap(8),
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text("Got It")),
                                            ),
                                            Gap(MediaQuery.of(context).padding.bottom)
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                              );
                            },
                            child: Text("How To?"),
                          ),
                        ),
                      ),
                    ],
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
