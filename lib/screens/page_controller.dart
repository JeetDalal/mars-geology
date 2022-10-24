import 'package:flutter/material.dart';
import 'package:marsgeology/screens/research.dart';

import 'home.dart';

class PageControllerScreen extends StatelessWidget {
  PageControllerScreen({Key? key}) : super(key: key);

  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        controller: _pageController,
        children: [
          HomePage(),
          ResearchPapersScreen(),
        ],
      ),
    );
  }
}
