import 'dart:developer';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodwifi/logic/fetchdata/cubit/fetchdatabloc_cubit.dart';
import 'package:foodwifi/model/model.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CarouselController carouselController = CarouselController();
  int current = 0;
  final bool _pinned = true;
  final bool _snap = false;
  final bool _floating = false;
  @override
  Widget build(BuildContext context) {
    final data = context.watch<FetchdatablocCubit>().state;
    List<Foodwifimodel> alldata = data.alldata;
    List<List<Item?>> firstlistitems = data.firstlistitems;
    log(firstlistitems.toString());
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 246, 246),
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
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
            SliverAppBar(
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                          color: Colors.black45, fontSize: 12),
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
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Center(
                                child: AnimatedTextKit(
                                  repeatForever: true,
                                  animatedTexts: [
                                    TyperAnimatedText('Momo',
                                        speed:
                                            const Duration(milliseconds: 110),
                                        textStyle: GoogleFonts.kreon(
                                          fontSize: 15,
                                        )),
                                    TyperAnimatedText('Pizza',
                                        speed:
                                            const Duration(milliseconds: 110),
                                        textStyle: GoogleFonts.kreon(
                                          fontSize: 15,
                                        )),
                                    TyperAnimatedText('Birayani',
                                        speed:
                                            const Duration(milliseconds: 110),
                                        textStyle: GoogleFonts.kreon(
                                          fontSize: 15,
                                        )),
                                    TyperAnimatedText('Chou',
                                        speed:
                                            const Duration(milliseconds: 110),
                                        textStyle: GoogleFonts.kreon(
                                          fontSize: 15,
                                        )),
                                    TyperAnimatedText('Donut',
                                        speed:
                                            const Duration(milliseconds: 110),
                                        textStyle: GoogleFonts.kreon(
                                          fontSize: 15,
                                        )),
                                    TyperAnimatedText('Burger',
                                        speed:
                                            const Duration(milliseconds: 110),
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
                                  decoration: const InputDecoration.collapsed(
                                      hintText: ''),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(
                    height: 200,
                    child: Column(
                      children: [
                        Expanded(
                          child: SizedBox(
                            width: double.maxFinite,
                            height: 280,
                            child: firstlistitems.isEmpty
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : ListView.builder(
                                    controller:
                                        PageController(viewportFraction: 0.73),
                                    scrollDirection: Axis.horizontal,
                                    physics: const PageScrollPhysics()
                                        .applyTo(const BouncingScrollPhysics()),
                                    itemCount: firstlistitems[0].length,
                                    itemBuilder: ((
                                      context,
                                      index,
                                    ) {
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, left: 24),
                                        child: Container(
                                            width: 320,
                                            color: Colors.white,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Image.network(
                                                'https://globizs.sgp1.cdn.digitaloceanspaces.com/foodwifi/${firstlistitems[0][index]!.img!}',
                                                height: 280,
                                                width: 500,
                                                fit: BoxFit.cover,
                                              ),
                                            )),
                                      );
                                    }),
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: 15,
                      itemBuilder: ((context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              color: Colors.white,
                              height: 280,
                              width: 350,
                            ),
                          ),
                        );
                      })),
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
