import 'dart:developer';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodwifi/logic/fetchdata/cubit/fetchdatabloc_cubit.dart';
import 'package:foodwifi/model/model.dart';
import 'package:foodwifi/refactor/eightlist.dart';
import 'package:foodwifi/refactor/fifthlist.dart';
import 'package:foodwifi/refactor/firstlist.dart';
import 'package:foodwifi/refactor/forthlist.dart';
import 'package:foodwifi/refactor/ninthlist.dart';
import 'package:foodwifi/refactor/secondlist.dart';
import 'package:foodwifi/refactor/sevenlist.dart';
import 'package:foodwifi/refactor/sixlist.dart';
import 'package:foodwifi/refactor/thirdlist.dart';
import 'package:foodwifi/router/router.gr.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CarouselController carouselController = CarouselController();

  int current = 0;
  List<List<Item?>> firstlistitems = [];
  final bool _pinned = true;
  final bool _snap = false;
  final bool _floating = false;

  String anitext = '';

  List<String> allnames = [
    'Momo',
    'Chow',
    'Pizza',
    'Burger',
    'Biryani',
    'Donut'
  ];

  @override
  Widget build(BuildContext context) {
    final data = context.watch<FetchdatablocCubit>().state;

    firstlistitems = data.firstlistitems;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 246, 246),
      body: SafeArea(
        child: CustomScrollView(
          shrinkWrap: true,
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hi, USER',
                            style: GoogleFonts.kreon(
                                color: const Color.fromARGB(255, 240, 17, 65)),
                          ),
                          Text(
                            'Welcome back!',
                            style: GoogleFonts.kreon(
                                color: const Color.fromARGB(255, 247, 37, 22)),
                          ),
                        ],
                      ),
                      const CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.red,
                        child: Icon(
                          Icons.favorite,
                          color: Colors.white,
                          size: 18,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SliverLayoutBuilder(builder: (context, constraints) {
              var scrollvalue = constraints.scrollOffset;
              return SliverAppBar(
                  stretch: true,
                  toolbarHeight: 105,
                  backgroundColor: Colors.white,
                  expandedHeight: 100,
                  elevation: 5,
                  pinned: _pinned,
                  snap: _snap,
                  floating: _floating,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                        right: 15,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const FaIcon(
                                      FontAwesomeIcons.locationDot,
                                      color: Color.fromARGB(255, 103, 101, 101),
                                      size: 20,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'DELIVER TO',
                                          style: GoogleFonts.kreon(
                                              color: Colors.black),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          ' Globizs Web Solutions Pvt,Konung Mamag, Imphal',
                                          style: GoogleFonts.kreon(
                                              color: Colors.black45,
                                              fontSize: 12),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const Icon(Icons.arrow_drop_down)
                              ],
                            ),
                          ),
                          Container(
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: const Color.fromARGB(255, 246, 242, 242),
                            ),
                            child: Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 15),
                                  child: FaIcon(
                                    FontAwesomeIcons.magnifyingGlass,
                                    size: 17,
                                  ),
                                ),
                                scrollvalue > 0
                                    ? const SizedBox(
                                        width: 20,
                                      )
                                    : Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Center(
                                          child: AnimatedTextKit(
                                            onNext: (p0, p1) {
                                              setState(() {
                                                anitext = allnames[p0];
                                              });
                                            },
                                            displayFullTextOnTap: true,
                                            repeatForever: true,
                                            animatedTexts: [
                                              TyperAnimatedText(anitext,
                                                  speed: const Duration(
                                                      milliseconds: 110),
                                                  textStyle: GoogleFonts.kreon(
                                                    fontSize: 15,
                                                  )),
                                              TyperAnimatedText(anitext,
                                                  speed: const Duration(
                                                      milliseconds: 110),
                                                  textStyle: GoogleFonts.kreon(
                                                    fontSize: 15,
                                                  )),
                                              TyperAnimatedText(anitext,
                                                  speed: const Duration(
                                                      milliseconds: 110),
                                                  textStyle: GoogleFonts.kreon(
                                                    fontSize: 15,
                                                  )),
                                              TyperAnimatedText(anitext,
                                                  speed: const Duration(
                                                      milliseconds: 110),
                                                  textStyle: GoogleFonts.kreon(
                                                    fontSize: 15,
                                                  )),
                                              TyperAnimatedText(anitext,
                                                  speed: const Duration(
                                                      milliseconds: 110),
                                                  textStyle: GoogleFonts.kreon(
                                                    fontSize: 15,
                                                  )),
                                              TyperAnimatedText(anitext,
                                                  speed: const Duration(
                                                      milliseconds: 110),
                                                  textStyle: GoogleFonts.kreon(
                                                    fontSize: 15,
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ),
                                Flexible(
                                  child: Container(
                                    child: TextFormField(
                                      readOnly: true,
                                      onTap: () {
                                        // FocusScopeNode currentFocus =
                                        //     FocusScope.of(context);

                                        // currentFocus.unfocus();
                                        var ind = allnames.indexOf(anitext);
                                        log('index : $ind');

                                        context.router.push(TopsearchRoute(
                                            searchname: allnames[
                                                ind >= 1 ? ind - 1 : 5]));
                                      },
                                      decoration: InputDecoration.collapsed(
                                          hintText: scrollvalue > 0
                                              ? "What are you craving?"
                                              : ''),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ));
            }),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    color: Colors.white,
                    height: 7,
                  ),
                  FirstRowList(firstlistitems: firstlistitems),
                  SecondRowList(firstlistitems: firstlistitems),
                  ThirdRowList(firstlistitems: firstlistitems),
                  ForthRowList(firstlistitems: firstlistitems),
                  FifthRowList(firstlistitems: firstlistitems),
                  SixRowList(firstlistitems: firstlistitems),
                  SevenRowList(firstlistitems: firstlistitems),
                  EightRowList(firstlistitems: firstlistitems),
                  NinthRowList(firstlistitems: firstlistitems),
                ],
              ),
            )

            // Place sliver widgets here
          ],
        ),
      ),
    );
  }
}
