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
  List<String> description = [];
  List<String?> links = [];
  bool _isLoading = true;
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
    final description = document
        .querySelectorAll('#primary_column > div > ul > li ')
        .map((e) => e.text)
        .toList();
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
                        'R E S E A R C H   P A P E R S ',
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
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        index == 0
                                            ? "Mars Science Laboratory Science Team Papers:"
                                            : titles[index - 1],
                                        style: const TextStyle(
                                          color: Colors.orange,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        description[index],
                                        style: const TextStyle(
                                          color: Colors.orange,
                                          fontSize: 17,
                                        ),
                                      ),
                                      Text(
                                        links[index] ?? " ",
                                        style: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 214, 97, 46),
                                          fontSize: 16,
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
