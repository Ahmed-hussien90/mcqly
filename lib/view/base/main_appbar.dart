import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mcqly/controller/theme_controller.dart';

class MainAppbar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppbar({super.key, this.bottom, this.title});

  final PreferredSizeWidget? bottom;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottom: bottom,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(40),
      )),
      iconTheme: const IconThemeData(),
      centerTitle: true,
      title: Text(
        title ?? 'MCQly',
        maxLines: 2,
        textAlign: TextAlign.center,
        style: const TextStyle(
            fontWeight: FontWeight.bold,  fontSize: 20),
      ),
      actions: [
        GetBuilder(
            init: ThemeController(),
            builder: (theme) {
              return IconButton(
                  onPressed: () {
                    theme.changeTheme();
                  },
                  icon:
                      Icon(theme.isDark ? Icons.light_mode : Icons.dark_mode));
            })
      ],
      elevation: 20,
      // Remove shadow to match the AppBar background color
      backgroundColor: Colors.transparent, // Set custom background color
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(bottom == null ? 55 : 100);
}
