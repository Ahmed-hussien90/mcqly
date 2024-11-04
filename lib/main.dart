import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mcqly/controller/theme_controller.dart';
import 'package:mcqly/firebase_options.dart';
import 'package:mcqly/utils/app_routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.put(ThemeController());
    return GetMaterialApp(
      title: 'MCQly',
      debugShowCheckedModeBanner: false,
      initialRoute: "/splash",
      getPages: appRoutes,
      darkTheme: ThemeData(
        useMaterial3: true,
        cardTheme: const CardTheme(
          color: Colors.brown,
          elevation: 5,
          shadowColor: Colors.brown,
          surfaceTintColor: Colors.black12
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.brown,
          primary: Colors.brown,
          secondary: Colors.brown,
          brightness: Brightness.light,
        ),

        textTheme: TextTheme(
          displayLarge: const TextStyle(
            fontSize: 72,
            fontWeight: FontWeight.bold,
          ),
          titleLarge: GoogleFonts.delius(
            fontSize: 30,
          ),
          bodyMedium: GoogleFonts.delius(),
          displaySmall: GoogleFonts.delius(),
        ),
      ),
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.deepOrangeAccent,
        cardTheme: const CardTheme(color: Colors.white12,)
      ),
      themeMode: themeController.isDark ? ThemeMode.dark : ThemeMode.light,
    );
  }
}
