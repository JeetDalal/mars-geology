import 'dart:developer';

import 'package:beautiful_soup_dart/beautiful_soup.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:lottie/lottie.dart';
import 'package:html/parser.dart' as parser;

class Volcanism extends StatefulWidget {
  Volcanism({Key? key}) : super(key: key);

  @override
  State<Volcanism> createState() => _VolcanismState();
}

class _VolcanismState extends State<Volcanism> {
  String title = " ";
  // List<String> description = [];
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    final uri = Uri.parse(
        'https://ui.adsabs.harvard.edu/abs/2015AGUFM.P31F..03B/abstract');
    final response = await http.get(uri);
    dom.Document document = dom.Document.html(response.body);
    // final description = document
    //     .querySelectorAll('#primary_column > div > p ')
    //     .map((e) => e.text)
    //     .toList();
    // final
    final title = document
        .querySelector('#current-subview > div > article > h2.s-abstract-title')
        .toString();

    setState(() {
      this.title = title;
      // this.description = description;
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'V O L C A N I S M ',
                            style: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        'The Volcanic History of Mars and Influences on Carbon Outgassing',
                        style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        'Exploration of Mars has revealed some of the most impressive volcanic landforms found throughout the solar system. Volatiles outgassed from volcanoes were likely to have strongly influenced atmospheric chemistry and affected the martian climate. On Earth the role of carbon involved in volcanic outgassing is strongly influenced by tectonic setting, with the greatest weight percent contributions coming from partial mantle melts associated with hot spot volcanism. Most martian volcanic centers appear to represent this style of volcanism. Thus, one important factor in understanding the martian carbon cycle through time is understanding this volatile\'s link to the planet\'s volcanic history. The identified volcanic constructs on Mars are not unlike those of the Earth suggesting similar magmatic and eruptive processes. However, the dimensions of many martian volcanic features are significantly larger. The distribution of volcanoes and volcanic deposits on Mars are not spatially or temporally uniform. Large volcanoes (> 100 km diameter) are spatially concentrated in volcanic provinces that likely represent focused upwellings or zones of crustal weakness that enabled magma ascension. Smaller (10s km diameters) volcanoes such as cones, low shields and fissures are often grouped into fields and their lava flows coalesce to produce low slope plains. In some cases plains lava fields are quite extensive with little to no evidence for the volcanic constructs. Although martian volcanism appears to have been dominated by effusive eruptions with likely contributions from passive degassing from the interior, explosive volcanic centers and deposits are known to exist. After the development of a martian crust the planet\'s volcanic style appears to have evolved from early explosive activity to effusive activity centered at major volcanoes to effusive distributed activity in fields. However, questions remain as to whether or not these styles significantly overlapped in time and if so, why? As scientists continue to learn more about carbon\'s role in terrestrial volcanism, it is reasonable to question how and how much carbon was involved in different styles of martian volcanic activity and how carbon and other volatiles have affected the martian atmosphere and climate through time.',
                        style: TextStyle(
                          color: Colors.orange,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
