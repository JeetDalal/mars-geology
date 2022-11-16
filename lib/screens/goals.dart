import 'dart:developer';

import 'package:beautiful_soup_dart/beautiful_soup.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:lottie/lottie.dart';
import 'package:html/parser.dart' as parser;

class Goals extends StatefulWidget {
  Goals({Key? key}) : super(key: key);

  @override
  State<Goals> createState() => _GoalsState();
}

class _GoalsState extends State<Goals> {
  List<String> titles = [];
  List<String> description = [];
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    final uri = Uri.parse('https://mars.nasa.gov/msl/mission/science/goals/');
    final response = await http.get(uri);
    dom.Document document = dom.Document.html(response.body);
    final description = document
        .querySelectorAll('#primary_column > div > p ')
        .map((e) => e.text)
        .toList();
    // final
    final titles = document
        .querySelectorAll('#primary_column > div > h2 > b')
        .map((e) => e.innerHtml.trim())
        .toList();

    setState(() {
      this.titles = titles;
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
                      padding: EdgeInsets.symmetric(vertical: 30),
                      child: Text(
                        'G  O  A  L  S ',
                        style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(titles.length, (index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 30),
                            child: Expanded(
                              child: SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                  ),
                                  child: index > 1
                                      ? null
                                      : Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              titles[index],
                                              style: const TextStyle(
                                                color: Colors.orange,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                              ),
                                            ),
                                            Text(
                                              description[index + 1],
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
