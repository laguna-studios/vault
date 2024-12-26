import "package:flutter/material.dart";

class VaultScreen extends StatelessWidget {
  const VaultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemBuilder: (context, index) => ListTile(
          title: Text("$index"),
        ),
      ),
    );
  }
}
