import 'dart:developer';

import 'package:beautiful_soup_dart/beautiful_soup.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:lottie/lottie.dart';
import 'package:html/parser.dart' as parser;

class WindNWater extends StatefulWidget {
  WindNWater({Key? key}) : super(key: key);

  @override
  State<WindNWater> createState() => _WindNWaterState();
}

class _WindNWaterState extends State<WindNWater> {
  // List<String> titles = [];
  List<String> description = [];
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    final uri = Uri.parse(
        'https://www.esa.int/Science_Exploration/Space_Science/Mars_Express/Shaping_the_surface_of_Mars_with_water_wind_and_ice');
    final response = await http.get(uri);
    dom.Document document = dom.Document.html(response.body);
    final description = document
        .querySelectorAll('body > div > article > div > p ')
        .map((e) => e.text)
        .toList();
    // final
    // final titles = document
    //     .querySelectorAll('#primary_column > div > h2 > b')
    //     .map((e) => e.innerHtml.trim())
    //     .toList();

    setState(() {
      // this.titles = titles;
      this.description = description;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushReplacementNamed('/page-controller');
        },
        backgroundColor: Colors.orange,
        child: const Icon(
          Icons.arrow_circle_up,
          size: 50,
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.black,
      body: _isLoading
          ? Center(
              child: Lottie.network(
                'https://assets4.lottiefiles.com/packages/lf20_i6y9iyqv.json',
              ),
            )
          : SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                      child: Text(
                        textAlign: TextAlign.center,
                        'R O L E   O F   W I N D   A N D  W A T E R   I N   S H A P I N G   M A R T I A N\n   S U R F A C E ',
                        style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(description.length, (index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 30),
                            child: Expanded(
                              child: SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        description[index],
                                        style: const TextStyle(
                                          color: Colors.orange,
                                          fontSize: 17,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
