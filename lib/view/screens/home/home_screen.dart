import 'package:flutter/material.dart';
import 'package:mcqly/view/base/main_appbar.dart';
import 'package:mcqly/view/base/main_drawer.dart';
import 'package:mcqly/view/tabs/questions_tab.dart';
import 'package:mcqly/view/tabs/quizes_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Tab> tabs = [
    Tab(title: "Questions", child: const QuestionsTab()),
    Tab(title: "Quizzes", child: const QuizzesTab())
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: const MainDrawer(),
        appBar: MainAppbar(
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(45),
                child: SizedBox(
                    height: 45,
                    child: TabBar(
                        dividerColor: Colors.transparent,
                        tabs: tabs.map((e) => Text(e.title)).toList())))),
        body: TabBarView(children: tabs.map((e) => e.child).toList()),
      ),
    );
  }
}

class Tab {
  final String title;
  final Widget child;

  Tab({required this.title, required this.child});
}
