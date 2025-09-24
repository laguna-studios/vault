import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:vault/ui/viewmodel/vault_viewmodel.dart";

class VaultSettingsScreen extends StatelessWidget {
  const VaultSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final VaultViewModel vaultViewModel = context.watch();

    return Scaffold(
      appBar: AppBar(title: Text("Vault Settings")),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 0, 0),
            child: Text(
              "Appearance",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Divider(
            indent: 8,
            endIndent: 8,
          ),
          SwitchListTile.adaptive(
            secondary: Icon(Icons.visibility),
            title: Text("Show files in a list instead of a grid"),
            value: vaultViewModel.isListViewMode,
            onChanged: (value) => vaultViewModel.updateSettings(listViewMode: value),
          ),
          SwitchListTile.adaptive(
            secondary: Icon(Icons.abc),
            title: Text("Scroll vertical"),
            value: vaultViewModel.isVerticalScroll,
            onChanged: (value) => vaultViewModel.updateSettings(verticalScroll: value),
          ),
          ListTile(
            leading: Icon(Icons.grid_3x3),
            title: Text("Column Count"),
            subtitle: Text("Set the number of columns in grid view"),
            onTap: () => showDialog(
              context: context,
              builder: (_) => ChangeNotifierProvider<VaultViewModel>.value(
                value: vaultViewModel,
                child: ColumnDialog(initialValue: vaultViewModel.columnCount),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 0, 0),
            child: Text(
              "Danger Zone",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Divider(
            indent: 8,
            endIndent: 8,
          ),
          ListTile(
            textColor: Colors.redAccent.shade100,
            iconColor: Colors.redAccent.shade100,
            leading: Icon(Icons.delete_forever),
            title: Text("Delete Vault"),
            subtitle: Text("Removes all files from this vault"),
            onTap: () => showDialog(
              context: context,
              builder: (dialogContext) {
                return AlertDialog(
                  title: Text("Are you sure?"),
                  content: Text("All files will be deleted. You can't recover them."),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(dialogContext);
                      },
                      child: Text("Cancel"),
                    ),
                    TextButton(
                      onPressed: () {
                        bool success = context.read<VaultViewModel>().deleteVault();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(success ? "The vault has been deleted!" : "An error occured")),
                        );

                        if (success) {
                          Navigator.of(context)
                            ..pop()
                            ..pop()
                            ..pop();
                        }
                      },
                      style: ButtonStyle(foregroundColor: WidgetStatePropertyAll(Colors.redAccent)),
                      child: Text("Yes, delete all files!"),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ColumnDialog extends StatefulWidget {
  const ColumnDialog({super.key, required this.initialValue});

  final int initialValue;

  @override
  State<ColumnDialog> createState() => _ColumnDialogState();
}

class _ColumnDialogState extends State<ColumnDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  late final TextEditingController _textEditingController = TextEditingController(text: widget.initialValue.toString());

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Set Column Count"),
      content: Form(
        key: _formKey,
        child: TextFormField(controller: _textEditingController, validator: _validateValue),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: Text("Cancel")),
        TextButton(onPressed: () => _onSaveClicked(context), child: Text("Save")),
      ],
    );
  }

  void _onSaveClicked(BuildContext context) {
    final VaultViewModel viewModel = context.read();
    if (_formKey.currentState?.validate() == false) return;
    viewModel.updateSettings(columnCount: int.parse(_textEditingController.text));
    Navigator.pop(context);
  }

  String? _validateValue(value) {
    if (value == null) return "Invalid Value";
    int? result = int.tryParse(value);
    if (result == null || result < 1) return "Invalid Value";
    return null;
  }
}
