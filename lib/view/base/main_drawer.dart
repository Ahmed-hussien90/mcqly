import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mcqly/controller/theme_controller.dart';
import 'package:mcqly/utils/constant.dart';
import 'package:url_launcher/url_launcher.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(child: Image.asset(appLogo)),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Home"),
            onTap: () {
              Get.offAllNamed("/home");
            },
          ),
          ListTile(
            leading: const Icon(Icons.star_rate_rounded),
            title: const Text("Rate us"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.help),
            title: const Text("Help"),
            onTap: () {},
          ),
          GetBuilder(
              init: ThemeController(),
              builder: (theme) {
                return ListTile(
                  leading: CupertinoSwitch(
                    value: !theme.isDark,
                    onChanged: (v) {
                      theme.changeTheme();
                    },
                  ),
                  title: const Text("Dark Mode"),
                );
              }),
          ListTile(
            leading: const Icon(Icons.apps),
            title: const Text("More Apps"),
            onTap: () {
              launchUrl(Uri.parse(moreAppsLink));
            },
          ),
          ListTile(
            leading: const Icon(Icons.call),
            title: const Text("Contact Us"),
            onTap: () {
              launchUrl(Uri.parse(moreAppsLink));
            },
          ),
        ],
      ),
    ).paddingOnly(bottom: 40);
  }
}
