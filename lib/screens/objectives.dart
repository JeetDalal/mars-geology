import 'package:flutter/material.dart';

class Objectives extends StatelessWidget {
  const Objectives({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          'This is Goals Page',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
