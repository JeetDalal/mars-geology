import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:marsgeology/modals/content.dart';

class ContentOverview extends StatelessWidget {
  const ContentOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color.fromARGB(255, 214, 97, 46),
      ),
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
                    child: Text(
                      content_items[index].toUpperCase(),
                      style: const TextStyle(
                        color: Color.fromARGB(255, 214, 97, 46),
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
