import "package:flutter/material.dart";
import "package:in_app_review/in_app_review.dart";
import "package:package_info_plus/package_info_plus.dart";
import "package:vault/ui/core/screen/webbrowser_screen.dart";

class PromoDrawer extends StatelessWidget {
  const PromoDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Drawer(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: ClipOval(child: Image.asset("assets/lagunastudios.jpg", height: 124, width: 124)),
          ),
          Text("Laguna Studios", style: textTheme.headlineMedium),
          Text("Apps made with 💜", style: textTheme.bodyMedium),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0),
            child: Divider(height: 1, endIndent: 64, indent: 64),
          ),
          ListTile(
            title: Text("Like"),
            leading: const Icon(Icons.favorite),
            onTap: likeApp,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 4.0),
            child: Divider(height: 1, endIndent: 64, indent: 64),
          ),
          ListTile(
            title: Text("Contact"),
            leading: const Icon(Icons.person),
            onTap: () => WebbrowserScreen.open(context, "https://lagunastudios.de/github/vault/refs/heads/main/html/privacy.html"),
          ),
          ListTile(
            title: Text("Terms Of Use"),
            leading: const Icon(Icons.casino),
            onTap: () => WebbrowserScreen.open(context, "https://lagunastudios.de/github/vault/refs/heads/main/html/privacy.html"),
          ),
          ListTile(
            title: Text("Privacy Policy"),
            leading: const Icon(Icons.lock),
            onTap: () => WebbrowserScreen.open(context, "https://lagunastudios.de/github/vault/refs/heads/main/html/privacy.html"),
          ),
          ListTile(
            title: Text("About"),
            leading: const Icon(Icons.people),
            onTap: () async {
              final PackageInfo info = await PackageInfo.fromPlatform();
              if (!context.mounted) return;
              showAboutDialog(context: context, applicationVersion: "Version: ${info.version}+${info.buildNumber}");
            },
          ),
        ],
      ),
    );
  }

  void likeApp() => InAppReview.instance.openStoreListing();
}
