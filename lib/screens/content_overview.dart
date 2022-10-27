import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:marsgeology/modals/content.dart';

class ContentOverview extends StatelessWidget {
  const ContentOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 150,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Container(
                        width: 70,
                        height: 75,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 214, 97, 46),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                          ),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.grid_view_rounded,
                            color: Colors.black,
                            size: 35,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Text(
              'E X P L O R E    M A R S',
              style: TextStyle(
                color: Color.fromARGB(255, 214, 97, 46),
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(content_items.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        switch (index) {
                          case 0:
                            Navigator.of(context)
                                .pushReplacementNamed('/page-controller');
                            break;
                          case 1:
                            Navigator.of(context)
                                .pushReplacementNamed('/goals-screen');
                            break;
                          case 2:
                            Navigator.of(context)
                                .pushReplacementNamed('/objectives-screen');
                            break;
                          case 3:
                            Navigator.of(context)
                                .pushReplacementNamed('/research-screen');
                            break;
                          case 4:
                            Navigator.of(context)
                                .pushReplacementNamed('/gallery-screen');
                            break;
                          case 5:
                            Navigator.of(context)
                                .pushReplacementNamed('/about-us-screen');
                            break;
                          case 6:
                            Navigator.of(context)
                                .pushReplacementNamed('/mars-factors-screen');
                            break;
                        }
                      },
                      child: Text(
                        content_items[index].toUpperCase(),
                        style: const TextStyle(
                          color: Color.fromARGB(255, 214, 97, 46),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
