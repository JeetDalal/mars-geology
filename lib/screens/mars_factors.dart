import 'dart:developer';

import 'package:beautiful_soup_dart/beautiful_soup.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:lottie/lottie.dart';
import 'package:html/parser.dart' as parser;

import 'factor screens/techtonics.dart';
import 'factor screens/volcano.dart';
import 'factor screens/windnwater.dart';

class MarsFactors extends StatefulWidget {
  MarsFactors({Key? key}) : super(key: key);

  @override
  State<MarsFactors> createState() => _MarsFactorsState();
}

class _MarsFactorsState extends State<MarsFactors> {
  List<String> titles = [];
  List<String> description = [];
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    getData();
    // run('https://mars.nasa.gov/msl/mission/science/research-papers/');
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
    final volcanismTitle = document
        .querySelectorAll('#current-subview > div:nth-child(1) > article > h2')
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
      body: PageView(
        children: [
          Volcanism(),
          TechTonics(),
          WindNWater(),
        ],
      ),
    );
  }
}
