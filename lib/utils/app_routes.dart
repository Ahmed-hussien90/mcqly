import 'package:get/get.dart';
import 'package:mcqly/view/screens/certificate/certificate_screen.dart';
import 'package:mcqly/view/screens/home/home_screen.dart';
import 'package:mcqly/view/screens/questions/questions_screen.dart';
import 'package:mcqly/view/screens/quizzes/QuizScreen.dart';
import 'package:mcqly/view/screens/splash/splash_screen.dart';

final appRoutes = [
  GetPage(name: "/splash", page: () => const SplashScreen()),
  GetPage(name: "/home", page: () => const HomeScreen()),
  GetPage(
      name: "/questions",
      page: () => QuestionsScreen(questions: Get.arguments[0],field: Get.arguments[1],)),
  GetPage(
      name: "/quizzes",
      page: () => QuizScreen(
            questions: Get.arguments[0],
        field: Get.arguments[1],
          )),
  GetPage(
      name: "/certificate",
      page: () => CertificateScreen(
            name: Get.arguments[0],
            field: Get.arguments[1],
          )),
];
