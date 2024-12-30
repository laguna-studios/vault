import "dart:io";

import "package:dartx/dartx_io.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:vault/context_extension.dart";
import "package:vault/ui/core/screen/file_viewer_screen.dart";
import "package:vault/ui/core/screen/vault_settings_screen.dart";
import "package:vault/ui/viewmodel/vault_viewmodel.dart";

class VaultScreen extends StatelessWidget {
  const VaultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final VaultViewModel viewModel = context.watch<VaultViewModel>();

    return Scaffold(
      appBar: viewModel.isSelectionActive
          ? AppBar(
              leading: IconButton(onPressed: viewModel.cancelSelection, icon: Icon(Icons.cancel)),
              title: Text("${viewModel.selectedFiles.length} Files Selected"),
              actions: [IconButton(onPressed: viewModel.selectAll, icon: Icon(Icons.select_all))],
            )
          : AppBar(
              title: Text("Vault Name"),
              actions: [
                IconButton(
                    onPressed: viewModel.toggleViewMode,
                    icon: Icon(viewModel.isListViewMode ? Icons.list : Icons.grid_3x3)),
                IconButton(
                  onPressed: () => context.go(VaultSettingsScreen()),
                  icon: Icon(Icons.settings),
                ),
              ],
            ),
      body: Builder(
        builder: (context) {
          if (viewModel.items.isEmpty)
            return Center(
              child: Text("No Items Yet"),
            );

          return viewModel.isListViewMode
              ? _ListViewVault(items: viewModel.items)
              : _GridViewVault(items: viewModel.items);
        },
      ),
      floatingActionButton: viewModel.isSelectionActive
          ? FloatingActionButton.extended(
              onPressed: viewModel.deleteSelection, label: Text("Delete"), icon: Icon(Icons.delete))
          : FloatingActionButton.extended(
              onPressed: viewModel.addFiles,
              label: Text("Add"),
              icon: Icon(Icons.add),
            ),
    );
  }
}

class _GridViewVault extends StatelessWidget {
  final Iterable<FileSystemEntity> items;

  const _GridViewVault({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final VaultViewModel viewModel = context.read();

    return GridView.builder(
      itemCount: items.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 8, mainAxisSpacing: 8),
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          if (viewModel.isSelectionActive) {
            viewModel.toggleFile(index);
            return;
          }

          context.go(
            ChangeNotifierProvider.value(value: context.read<VaultViewModel>(), child: FileViewerScreen(index: index)),
          );
        },
        onLongPress: () => viewModel.toggleFile(index),
        child: Container(
          decoration: BoxDecoration(
            border: viewModel.isSelectionActive ? Border.all(color: Colors.blue, width: 8) : null,
          ),
          child: Image.file(
            items.elementAt(index) as File,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class _ListViewVault extends StatelessWidget {
  final Iterable<FileSystemEntity> items;

  const _ListViewVault({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final VaultViewModel viewModel = context.read();

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(items.elementAt(index).name),
        onTap: () {
          if (viewModel.isSelectionActive) {
            viewModel.toggleFile(index);
            return;
          }

          context.go(ChangeNotifierProvider.value(
            value: context.read<VaultViewModel>(),
            child: FileViewerScreen(
              index: index,
            ),
          ));
        },
        selected: viewModel.selectedFiles.contains(items.elementAt(index)),
        onLongPress: () => viewModel.toggleFile(index),
      ),
    );
  }
}
