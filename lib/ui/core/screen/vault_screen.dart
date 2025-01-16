import "dart:io";

import "package:dartx/dartx_io.dart";
import "package:flutter/material.dart";
import "package:gap/gap.dart";
import "package:provider/provider.dart";
import "package:vault/context_extension.dart";
import "package:vault/data/model/vault_item.dart";
import "package:vault/ui/core/screen/file_viewer_screen.dart";
import "package:vault/ui/core/screen/vault_settings_screen.dart";
import "package:vault/ui/viewmodel/vault_viewmodel.dart";

class VaultScreen extends StatelessWidget {
  const VaultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final VaultViewModel viewModel = context.watch<VaultViewModel>();

    return PopScope(
      canPop: viewModel.location.isEmpty,
      onPopInvokedWithResult: (didPop, result) => viewModel.goUp(),
      child: Scaffold(
        appBar: viewModel.isSelectionActive
            ? AppBar(
                leading: IconButton(onPressed: viewModel.cancelSelection, icon: Icon(Icons.cancel)),
                title: Text("${viewModel.selectedFiles.length} Files Selected"),
                actions: [IconButton(onPressed: viewModel.selectAll, icon: Icon(Icons.select_all))],
              )
            : AppBar(
                title: Text("My Vault"),
                centerTitle: true,
                bottom: PreferredSize(preferredSize: Size.zero, child: Text(viewModel.location)),
                actions: [
                  IconButton(
                    onPressed: viewModel.toggleViewMode,
                    icon: Icon(viewModel.isListViewMode ? Icons.grid_view : Icons.list),
                  ),
                  IconButton(
                    onPressed: () => context.go(
                      ChangeNotifierProvider<VaultViewModel>.value(value: context.read(), child: VaultSettingsScreen()),
                    ),
                    icon: Icon(Icons.settings),
                  ),
                ],
              ),
        body: Builder(
          builder: (context) {
            if (viewModel.loading) return Center(child: CircularProgressIndicator());

            return Column(
              children: [
                if (viewModel.location.isNotEmpty)
                  ListTile(
                    leading: Icon(Icons.arrow_upward),
                    title: Text("Go To Parent Directory"),
                    onTap: viewModel.goUp,
                  ),
                if (viewModel.items.isEmpty)
                  Expanded(
                    child: Center(
                      child: Text("No Items Yet"),
                    ),
                  ),
                if (viewModel.items.isNotEmpty)
                  Expanded(
                    child: viewModel.isListViewMode
                        ? _ListViewVault(
                            items: viewModel.items,
                            selectedItems: viewModel.selectedFiles,
                            onTap: (index) => _onTap(context, index),
                            onLongPress: (index) => _onLongPress(context, index),
                          )
                        : _GridViewVault(
                            items: viewModel.items,
                            selectedItems: viewModel.selectedFiles,
                            onTap: (index) => _onTap(context, index),
                            onLongPress: (index) => _onLongPress(context, index),
                          ),
                  ),
              ],
            );
          },
        ),
        floatingActionButton: viewModel.isSelectionActive
            ? FloatingActionButton.extended(
                onPressed: viewModel.deleteSelection,
                label: Text("Delete"),
                icon: Icon(Icons.delete),
              )
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FloatingActionButton.extended(
                    heroTag: 0,
                    onPressed: viewModel.addFiles,
                    label: Text("Add File"),
                    icon: Icon(Icons.add),
                  ),
                  Gap(8),
                  FloatingActionButton.extended(
                    heroTag: 1,
                    onPressed: () => _openCreateFolderDialog(context),
                    label: Text("Create Folder"),
                    icon: Icon(Icons.folder),
                  ),
                ],
              ),
      ),
    );
  }

  void _openCreateFolderDialog(BuildContext context) {
    final VaultViewModel viewModel = context.read();
    final TextEditingController controller = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Create New Folder"),
          content: TextField(controller: controller),
          actions: [
            TextButton(onPressed: Navigator.of(context).pop, child: Text("Cancel")),
            TextButton(
              onPressed: () {
                viewModel.createDirectory(controller.text);
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  void _onTap(BuildContext context, int index) {
    final VaultViewModel viewModel = context.read();

    if (viewModel.isSelectionActive) {
      viewModel.toggleItem(index);
      return;
    }

    final VaultItem item = viewModel.items.elementAt(index);
    if (item.item is Directory) {
      viewModel.enterDirectory(item.item as Directory);
      return;
    }

    context.go(ChangeNotifierProvider.value(value: viewModel, child: FileViewerScreen(index: index)));
  }

  void _onLongPress(BuildContext context, int index) {
    final VaultViewModel viewModel = context.read();
    viewModel.toggleItem(index);
  }
}

class _GridViewVault extends StatelessWidget {
  final Iterable<VaultItem> items;
  final Set<VaultItem> selectedItems;
  final Function(int index) onTap;
  final Function(int index) onLongPress;

  const _GridViewVault({
    required this.items,
    required this.selectedItems,
    required this.onTap,
    required this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    final int columnCount = context.select<VaultViewModel, int>((viewModel) => viewModel.columnCount);

    return GridView.builder(
      itemCount: items.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: columnCount, crossAxisSpacing: 8, mainAxisSpacing: 8),
      itemBuilder: (context, index) {
        final VaultItem item = items.elementAt(index);

        return GestureDetector(
          onTap: () => onTap(index),
          onLongPress: () => onLongPress(index),
          child: Container(
            decoration: BoxDecoration(
              border: selectedItems.contains(item) ? Border.all(color: Colors.blue, width: 8) : null,
            ),
            child: switch (item.item) {
              File() => Image.file(
                  item.thumbnail as File,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => _GridItem(icon: Icons.file_copy, name: item.item.name),
                ),
              Directory() => _GridItem(icon: Icons.folder, name: item.item.name),
              _ => _GridItem(icon: Icons.question_mark, name: item.item.name),
            },
          ),
        );
      },
    );
  }
}

class _GridItem extends StatelessWidget {
  final IconData icon;
  final String name;

  const _GridItem({required this.icon, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Center(child: Icon(icon, size: 64))),
        Text(name, maxLines: 1),
      ],
    );
  }
}

class _ListViewVault extends StatelessWidget {
  final Iterable<VaultItem> items;
  final Set<VaultItem> selectedItems;
  final Function(int index) onTap;
  final Function(int index) onLongPress;

  const _ListViewVault({
    required this.items,
    required this.selectedItems,
    required this.onTap,
    required this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (_, __) => Divider(),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final VaultItem item = items.elementAt(index);

        return ListTile(
          leading: Icon(item is Directory ? Icons.folder : Icons.file_open),
          title: Text(item.item.name),
          onTap: () => onTap(index),
          selected: selectedItems.contains(item),
          onLongPress: () => onLongPress(index),
        );
      },
    );
  }
}
