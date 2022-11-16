import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marsgeology/modals/board.dart';

class BoardingScreen1 extends StatefulWidget {
  // final String imageUrl;
  // final String title;
  // final String description;
  BoardingScreen1({
    super.key,
    // required this.description,
    // required this.title,
    // required this.imageUrl,
  });

  @override
  State<BoardingScreen1> createState() => _BoardingScreen1State();
}

class _BoardingScreen1State extends State<BoardingScreen1> {
  int index = 0;
  bool _isNextEnabled = true;
  bool _isSkipEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.black,
                child: Image.asset(
                  'images/mars.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.35,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.yellow.withOpacity(0.5),
                          Colors.yellow.withOpacity(0.3),
                          Colors.yellow.withOpacity(0.1),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                            MediaQuery.of(context).size.width / 2),
                        topRight: Radius.circular(
                            MediaQuery.of(context).size.width / 2),
                      ),

                      // border: const Border(
                      //   bottom: BorderSide(
                      //     color: Colors.yellow,
                      //     width: 2,
                      //   ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 60,
                        ),
                        Text(
                          boardScreens[index].title1,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 42,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          boardScreens[index].title2,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.kumarOne(
                            color: Colors.yellow,
                            fontSize: 40,
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Text(
                          boardScreens[index].description,
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.yellow.withOpacity(0.3),
                          Colors.yellow.withOpacity(0.2),
                          Colors.yellow.withOpacity(0.1),
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              index = 2;
                              _isNextEnabled = false;
                              _isSkipEnabled = false;
                            });
                          },
                          child: Container(
                            height: 30,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: const Text(
                                'Skip',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        _isNextEnabled
                            ? TextButton(
                                onPressed: () {
                                  setState(() {
                                    index++;
                                    if (index == 2) {
                                      _isNextEnabled = false;
                                    }
                                  });
                                },
                                child: Container(
                                  height: 30,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.yellow,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Next',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : TextButton(
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                      context, '/login-screen');
                                },
                                child: Container(
                                  height: 30,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.yellow,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Done',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
