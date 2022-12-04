// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HeroPage extends StatefulWidget {
  const HeroPage({super.key});

  @override
  State<HeroPage> createState() => _HeroPageState();
}

class _HeroPageState extends State<HeroPage> {
  @override
  Widget build(BuildContext context) {
    final List carouselItems = [
      {'title': 'Признаки беременности', 'color': Colors.grey.shade200},
      {
        'title': 'Диета при беремености',
        'color': Color.fromRGBO(255, 192, 207, 0.6)
      },
      {
        'title': 'Что приготовить в роддом?',
        'color': Color.fromRGBO(53, 123, 248, 0.6),
      }
    ];

    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                child: Container(
                  color: Color.fromRGBO(235, 242, 253, 1),
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Добрый день,',
                              style: GoogleFonts.roboto(
                                fontSize: 23,
                                color: Color.fromRGBO(49, 26, 37, 1),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Дарига',
                              style: GoogleFonts.roboto(
                                fontSize: 23,
                                color: Color.fromRGBO(49, 26, 37, 1),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SvgPicture.asset(
                          'assets/women_art.svg',
                          width: 200,
                          height: 200,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromRGBO(238, 108, 132, 1),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Неделя: 7',
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Узнать подробнее',
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll<Color>(Colors.white),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                width: double.infinity,
                height: 250,
              ),
              SizedBox(height: 30),
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Полезные статьи',
                        style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  CarouselSlider(
                    options: CarouselOptions(height: 250.0),
                    items: carouselItems.map((object) {
                      return Container(
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(color: object['color']),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                object['title'],
                                style: TextStyle(
                                  fontSize: 21,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              ElevatedButton(
                                  onPressed: () {},
                                  child: Text('Узнать подробнее'))
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
