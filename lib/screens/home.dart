import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 100),
  );
  @override
  void initState() {
    super.initState();
    animationController.forward();
    animationController.addListener(() {
      setState(() {
        if (animationController.status == AnimationStatus.completed) {
          animationController.repeat();
        }
      });
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 214, 97, 46),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(200),
                  bottomRight: Radius.circular(200),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed('/content-overview');
                      },
                      child: Container(
                        width: 70,
                        height: 75,
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                          ),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.grid_view_rounded,
                            color: Color.fromARGB(255, 214, 97, 46),
                            size: 35,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'M A R S',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const Text(
                            'THE RED PLANET',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          AnimatedBuilder(
                            animation: animationController,
                            child: SizedBox(
                              height: 300.0,
                              width: 300.0,
                              child: Image.asset('images/main.png'),
                            ),
                            builder: (context, widget) {
                              return Transform.rotate(
                                angle: animationController.value * 180 / 3.14,
                                child: widget,
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    child: Row(
                      children: const [
                        Text(
                          'Radius : ',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          '3,389.5 Km',
                          style: TextStyle(
                            color: Color.fromARGB(255, 214, 97, 46),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    child: Row(
                      children: const [
                        Text(
                          'Gravity : ',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          '3.711 m/s',
                          style: TextStyle(
                            color: Color.fromARGB(255, 214, 97, 46),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    child: Row(
                      children: const [
                        Text(
                          'Length Of Year : ',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          '687 Earth Days',
                          style: TextStyle(
                            color: Color.fromARGB(255, 214, 97, 46),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    child: Row(
                      children: const [
                        Text(
                          'Distance From Sun : ',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          '227.9 mln Km',
                          style: TextStyle(
                            color: Color.fromARGB(255, 214, 97, 46),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    child: Row(
                      children: const [
                        Text(
                          'Temperature : ',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          'Average -62.78',
                          style: TextStyle(
                            color: Color.fromARGB(255, 214, 97, 46),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Row(
            //   children: [
            //     Container(
            //       color: Colors.orange,
            //       height: 30,
            //       width: MediaQuery.of(context).size.width,
            //       child: const Center(
            //         child: Text(
            //           'Swipe Up',
            //           style: TextStyle(color: Colors.black),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
