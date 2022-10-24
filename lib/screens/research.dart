import 'dart:developer';

import 'package:beautiful_soup_dart/beautiful_soup.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:lottie/lottie.dart';
import 'package:html/parser.dart' as parser;

class ResearchPapersScreen extends StatefulWidget {
  ResearchPapersScreen({Key? key}) : super(key: key);

  @override
  State<ResearchPapersScreen> createState() => _ResearchPapersScreenState();
}

class _ResearchPapersScreenState extends State<ResearchPapersScreen> {
  List<String> titles = [];
  List<String?> links = [];
  @override
  void initState() {
    super.initState();
    getData();
    // run('https://mars.nasa.gov/msl/mission/science/research-papers/');
  }

  void getData() async {
    final uri =
        Uri.parse('https://mars.nasa.gov/msl/mission/science/research-papers/');
    final response = await http.get(uri);
    dom.Document document = dom.Document.html(response.body);
    final links = document
        .querySelectorAll('#primary_column > div > ul > li > a')
        .map((e) => e.attributes['href'])
        .toList();
    // final
    final titles = document
        .querySelectorAll('#primary_column > div > h3')
        .map((e) => e.innerHtml.trim())
        .toList();

    setState(() {
      this.titles = titles;
      this.links = links;
    });
  }

  // final List<String> title = [];
  // Future<void> connect() async {
  //   final uri =
  //       Uri.parse('https://mars.nasa.gov/msl/mission/science/research-papers/');
  //   final response = await http.get(uri);
  //   dom.Document document = dom.Document.html(response.body);
  //   titles = document
  //       .querySelectorAll('#primary_column > div > h3')
  //       .map((e) => e.innerHtml.trim())
  //       .toList();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(titles.length, (index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                child: Expanded(
                  child: SingleChildScrollView(
                    child: Column(
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
                          links[index] ?? " ",
                          style: const TextStyle(
                            color: Colors.orange,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
