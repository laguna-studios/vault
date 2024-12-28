import "package:flutter/material.dart";
import "package:vault/context_extension.dart";
import "package:vault/ui/core/screen/file_viewer_screen.dart";
import "package:vault/ui/core/screen/vault_settings_screen.dart";

class VaultScreen extends StatefulWidget {
  const VaultScreen({super.key});

  @override
  State<VaultScreen> createState() => _VaultScreenState();
}

class _VaultScreenState extends State<VaultScreen> with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vault Name"),
        actions: [
          IconButton(onPressed: _toggleViewMode, icon: Icon(Icons.list)),
          IconButton(
            onPressed: () => context.go(VaultSettingsScreen()),
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 8, mainAxisSpacing: 8),
        itemBuilder: (context, index) => Placeholder(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text("Add"),
        icon: Icon(Icons.add),
      ),
    );
  }

  void _toggleViewMode() {
          print(1);
        }
}

class _ListViewVault extends StatelessWidget {
  const _ListViewVault({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        title: Text("$index"),
        onTap: () => context.go(FileViewerScreen()),
      ),
    );
  }
}
