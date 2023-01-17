import 'dart:developer';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodwifi/logic/fetchdata/cubit/fetchdatabloc_cubit.dart';
import 'package:foodwifi/model/model.dart';
import 'package:foodwifi/refactor/skeleton.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CarouselController carouselController = CarouselController();
  var currencyformat =
      NumberFormat.currency(locale: 'en_IN', symbol: '₹', decimalDigits: 0);
  int current = 0;
  List<List<Item?>> firstlistitems = [];
  final bool _pinned = true;
  final bool _snap = false;
  final bool _floating = false;
  var isloading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Timer(const Duration(seconds: 3), () {
    //   if (firstlistitems.isNotEmpty) {
    //     setState(() {
    //       isloading = true;
    //     });
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    final data = context.watch<FetchdatablocCubit>().state;

    firstlistitems = data.firstlistitems;
    List<Foodwifimodel> alldata = data.alldata;
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
            SliverLayoutBuilder(builder: (context, constraints) {
              var scrollvalue = constraints.scrollOffset;
              return SliverAppBar(
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
                                            displayFullTextOnTap: true,
                                            repeatForever: true,
                                            animatedTexts: [
                                              TyperAnimatedText('Momo',
                                                  speed: const Duration(
                                                      milliseconds: 110),
                                                  textStyle: GoogleFonts.kreon(
                                                    fontSize: 15,
                                                  )),
                                              TyperAnimatedText('Pizza',
                                                  speed: const Duration(
                                                      milliseconds: 110),
                                                  textStyle: GoogleFonts.kreon(
                                                    fontSize: 15,
                                                  )),
                                              TyperAnimatedText('Birayani',
                                                  speed: const Duration(
                                                      milliseconds: 110),
                                                  textStyle: GoogleFonts.kreon(
                                                    fontSize: 15,
                                                  )),
                                              TyperAnimatedText('Chou',
                                                  speed: const Duration(
                                                      milliseconds: 110),
                                                  textStyle: GoogleFonts.kreon(
                                                    fontSize: 15,
                                                  )),
                                              TyperAnimatedText('Donut',
                                                  speed: const Duration(
                                                      milliseconds: 110),
                                                  textStyle: GoogleFonts.kreon(
                                                    fontSize: 15,
                                                  )),
                                              TyperAnimatedText('Burger',
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
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: SizedBox(
                      height: 237,
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              color: Colors.white,
                              width: double.maxFinite,
                              height: 280,
                              child: firstlistitems.isEmpty
                                  ? const Skeleton(
                                      height: 237,
                                    )
                                  : ListView.builder(
                                      controller: PageController(
                                          viewportFraction: 0.73),
                                      scrollDirection: Axis.horizontal,
                                      physics: const PageScrollPhysics()
                                          .applyTo(
                                              const BouncingScrollPhysics()),
                                      itemCount: firstlistitems[0].length,
                                      itemBuilder: ((
                                        context,
                                        index,
                                      ) {
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, left: 24),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(
                                                height: 12,
                                              ),
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                child: SizedBox(
                                                  width: 320,
                                                  child: CachedNetworkImage(
                                                    fadeInDuration:
                                                        const Duration(
                                                            seconds: 1),
                                                    imageUrl:
                                                        'https://globizs.sgp1.cdn.digitaloceanspaces.com/foodwifi/${firstlistitems[0][index]!.img!}',
                                                    fit: BoxFit.cover,
                                                    progressIndicatorBuilder:
                                                        (context, url,
                                                                downloadProgress) =>
                                                            const Skeleton(
                                                      height: 181,
                                                    ),
                                                    errorWidget: (context, url,
                                                            error) =>
                                                        const Icon(Icons.error),
                                                  ),
                                                  // Image.network(
                                                  //  ,
                                                  //   fit: BoxFit.cover,
                                                  //   loadingBuilder: (BuildContext
                                                  //           context,
                                                  //       Widget child,
                                                  //       ImageChunkEvent?
                                                  //           loadingProgress) {
                                                  //     if (loadingProgress ==
                                                  //         null) {
                                                  //       return child;
                                                  //     }
                                                  //     return const
                                                  //   },
                                                  // )),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(3),
                                                child: Text(firstlistitems[0]
                                                        [index]!
                                                    .title!),
                                              )
                                            ],
                                          ),
                                        );
                                      }),
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: SizedBox(
                      height: 130,
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              color: Colors.white,
                              width: double.maxFinite,
                              height: 300,
                              child: firstlistitems.isEmpty
                                  ? const Skeleton(
                                      height: 130,
                                    )
                                  : ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      physics: const PageScrollPhysics()
                                          .applyTo(
                                              const BouncingScrollPhysics()),
                                      itemCount: firstlistitems[1].length,
                                      itemBuilder: ((
                                        context,
                                        index,
                                      ) {
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, left: 24),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                child: SizedBox(
                                                  width: 75,
                                                  child: CachedNetworkImage(
                                                    fadeInDuration:
                                                        const Duration(
                                                            seconds: 1),
                                                    imageUrl:
                                                        'https://globizs.sgp1.cdn.digitaloceanspaces.com/foodwifi/${firstlistitems[1][index]!.img!}',
                                                    fit: BoxFit.cover,
                                                    progressIndicatorBuilder:
                                                        (context, url,
                                                                downloadProgress) =>
                                                            const Skeleton(
                                                      height: 75,
                                                    ),
                                                    errorWidget: (context, url,
                                                            error) =>
                                                        const Icon(Icons.error),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 7),
                                                child: Text(
                                                  firstlistitems[1][index]!
                                                      .title!,
                                                  style: GoogleFonts.kreon(
                                                      fontSize: 12),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }),
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: SizedBox(
                      height: 280,
                      child: Column(
                        children: [
                          Container(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15, top: 25),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 3),
                                    child: Text(
                                      'Offers For You',
                                      style: GoogleFonts.kreon(fontSize: 20),
                                    ),
                                  ),
                                  const Icon(
                                    FontAwesomeIcons.circleArrowRight,
                                    size: 17,
                                    color: Color.fromARGB(255, 195, 193, 193),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              color: Colors.white,
                              width: double.maxFinite,
                              height: 280,
                              child: firstlistitems.isEmpty
                                  ? const Skeleton(
                                      height: 280,
                                    )
                                  : ListView.builder(
                                      controller: PageController(
                                          viewportFraction: 0.67),
                                      scrollDirection: Axis.horizontal,
                                      physics: const PageScrollPhysics()
                                          .applyTo(
                                              const BouncingScrollPhysics()),
                                      itemCount: firstlistitems[2].length,
                                      itemBuilder: ((
                                        context,
                                        index,
                                      ) {
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, left: 20),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(
                                                height: 12,
                                              ),
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                child: SizedBox(
                                                    width: 240,
                                                    height: 130,
                                                    child: Stack(
                                                      fit: StackFit.expand,
                                                      children: [
                                                        CachedNetworkImage(
                                                          fadeInDuration:
                                                              const Duration(
                                                                  seconds: 1),
                                                          imageUrl:
                                                              'https://globizs.sgp1.cdn.digitaloceanspaces.com/foodwifi/${firstlistitems[2][index]!.img!}',
                                                          fit: BoxFit.cover,
                                                          progressIndicatorBuilder:
                                                              (context, url,
                                                                      downloadProgress) =>
                                                                  const Skeleton(
                                                            height: 130,
                                                          ),
                                                          errorWidget: (context,
                                                                  url, error) =>
                                                              const Icon(
                                                                  Icons.error),
                                                        ),
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(10),
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            2),
                                                                child:
                                                                    Container(
                                                                  width: 135,
                                                                  height: 24,
                                                                  color: const Color
                                                                          .fromARGB(
                                                                      255,
                                                                      17,
                                                                      149,
                                                                      138),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .all(2),
                                                                    child: Row(
                                                                      children: [
                                                                        Transform(
                                                                          alignment:
                                                                              Alignment.center,
                                                                          transform:
                                                                              Matrix4.rotationY(math.pi),
                                                                          child:
                                                                              const FaIcon(
                                                                            FontAwesomeIcons.tag,
                                                                            color:
                                                                                Colors.white,
                                                                            size:
                                                                                14,
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding:
                                                                              const EdgeInsets.only(left: 5),
                                                                          child:
                                                                              Text(
                                                                            '${firstlistitems[2][index]!.offer!.toString().toLowerCase()} upto ₹${firstlistitems[2][index]!.offerUpto!}',
                                                                            style:
                                                                                GoogleFonts.kreon(color: Colors.white),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    )),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 7),
                                                child: Text(
                                                  firstlistitems[2][index]!
                                                      .title!,
                                                  style: GoogleFonts.kreon(
                                                      fontSize: 12),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 5),
                                                child: Text(
                                                  firstlistitems[2][index]!
                                                      .description!,
                                                  style: GoogleFonts.kreon(
                                                      fontSize: 12,
                                                      color:
                                                          const Color.fromARGB(
                                                              255,
                                                              148,
                                                              144,
                                                              144)),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 5),
                                                child: Row(
                                                  children: [
                                                    const Icon(
                                                      Icons.star,
                                                      size: 11,
                                                      color: Color.fromARGB(
                                                          255, 220, 204, 52),
                                                    ),
                                                    Text(
                                                      firstlistitems[2][index]!
                                                          .rating!,
                                                      style: GoogleFonts.kreon(
                                                          fontSize: 12,
                                                          color: const Color
                                                                  .fromARGB(
                                                              221, 60, 60, 60)),
                                                    ),
                                                    const Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 3),
                                                      child: Icon(
                                                        Icons.circle,
                                                        size: 2,
                                                      ),
                                                    ),
                                                    Text(
                                                      firstlistitems[2][index]!
                                                          .time!,
                                                      style: GoogleFonts.kreon(
                                                          fontSize: 12,
                                                          color: const Color
                                                                  .fromARGB(
                                                              221, 60, 60, 60)),
                                                    ),
                                                    const Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 3),
                                                      child: Icon(
                                                        Icons.circle,
                                                        size: 2,
                                                      ),
                                                    ),
                                                    Text(
                                                      firstlistitems[2][index]!
                                                          .distance!,
                                                      style: GoogleFonts.kreon(
                                                          fontSize: 12,
                                                          color: const Color
                                                                  .fromARGB(
                                                              221, 60, 60, 60)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }),
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: SizedBox(
                      height: 350,
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 15,
                                top: 25,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(right: 3),
                                child: Text(
                                  'Choose From cuisines',
                                  style: GoogleFonts.kreon(fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              color: Colors.white,
                              width: double.maxFinite,
                              height: 280,
                              child: firstlistitems.isEmpty
                                  ? const Skeleton(
                                      height: 350,
                                    )
                                  : GridView.builder(
                                      scrollDirection: Axis.horizontal,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        childAspectRatio: 1 / 0.71,
                                        crossAxisCount: 2,
                                      ),
                                      physics: const BouncingScrollPhysics(),
                                      itemCount: firstlistitems[3].length,
                                      itemBuilder: ((
                                        context,
                                        index,
                                      ) {
                                        return Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              width: 84,
                                              child: CachedNetworkImage(
                                                fadeInDuration:
                                                    const Duration(seconds: 1),
                                                imageUrl:
                                                    'https://globizs.sgp1.cdn.digitaloceanspaces.com/foodwifi/${firstlistitems[3][index]!.img!}',
                                                fit: BoxFit.cover,
                                                progressIndicatorBuilder:
                                                    (context, url,
                                                            downloadProgress) =>
                                                        const Skeleton(
                                                  radius: 50,
                                                  height: 75,
                                                ),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        const Icon(Icons.error),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 7),
                                              child: Text(
                                                firstlistitems[3][index]!
                                                    .title!,
                                                style: GoogleFonts.kreon(
                                                    fontSize: 12),
                                              ),
                                            ),
                                          ],
                                        );
                                      }),
                                    ),
                            ),
                          ),
                          Container(
                            height: 17,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: SizedBox(
                      height: 300,
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15, top: 25),
                              child: Padding(
                                padding: const EdgeInsets.only(right: 3),
                                child: Text(
                                  'New on Foodwifi',
                                  style: GoogleFonts.kreon(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              color: Colors.white,
                              width: double.maxFinite,
                              height: 280,
                              child: firstlistitems.isEmpty
                                  ? const Skeleton(
                                      height: 300,
                                    )
                                  : ListView.builder(
                                      controller:
                                          PageController(viewportFraction: 0.4),
                                      scrollDirection: Axis.horizontal,
                                      physics: const PageScrollPhysics()
                                          .applyTo(
                                              const BouncingScrollPhysics()),
                                      itemCount: firstlistitems[4].length,
                                      itemBuilder: ((
                                        context,
                                        index,
                                      ) {
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, left: 20),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(
                                                height: 12,
                                              ),
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                child: SizedBox(
                                                  width: 135,
                                                  child: CachedNetworkImage(
                                                    fadeInDuration:
                                                        const Duration(
                                                            seconds: 1),
                                                    imageUrl:
                                                        'https://globizs.sgp1.cdn.digitaloceanspaces.com/foodwifi/${firstlistitems[4][index]!.img!}',
                                                    fit: BoxFit.cover,
                                                    progressIndicatorBuilder:
                                                        (context, url,
                                                                downloadProgress) =>
                                                            const Skeleton(
                                                      height: 135,
                                                    ),
                                                    errorWidget: (context, url,
                                                            error) =>
                                                        const Icon(Icons.error),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 7),
                                                child: Text(
                                                  firstlistitems[4][index]!
                                                      .title!,
                                                  style: GoogleFonts.kreon(
                                                      fontSize: 15),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 5),
                                                child: Text(
                                                  firstlistitems[4][index]!
                                                      .title!,
                                                  style: GoogleFonts.kreon(
                                                      fontSize: 11,
                                                      color:
                                                          const Color.fromARGB(
                                                              255,
                                                              148,
                                                              144,
                                                              144)),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 5),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      firstlistitems[4][index]!
                                                          .time!,
                                                      style: GoogleFonts.kreon(
                                                          fontSize: 12,
                                                          color: const Color
                                                                  .fromARGB(
                                                              221, 60, 60, 60)),
                                                    ),
                                                    const Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 3),
                                                      child: Icon(
                                                        Icons.circle,
                                                        size: 2,
                                                      ),
                                                    ),
                                                    Text(
                                                      firstlistitems[4][index]!
                                                          .distance!,
                                                      style: GoogleFonts.kreon(
                                                          fontSize: 12,
                                                          color: const Color
                                                                  .fromARGB(
                                                              221, 60, 60, 60)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }),
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: SizedBox(
                      height: 320,
                      child: Column(
                        children: [
                          Container(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15, top: 25),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 3),
                                        child: Text(
                                          'Imphal\'s Most Favorites',
                                          style:
                                              GoogleFonts.kreon(fontSize: 20),
                                        ),
                                      ),
                                      const Icon(
                                        FontAwesomeIcons.circleArrowRight,
                                        size: 17,
                                        color:
                                            Color.fromARGB(255, 195, 193, 193),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      'City Favotites',
                                      style:
                                          GoogleFonts.kreon(color: Colors.grey),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              color: Colors.white,
                              width: double.maxFinite,
                              height: 280,
                              child: firstlistitems.isEmpty
                                  ? const Skeleton(
                                      height: 320,
                                    )
                                  : ListView.builder(
                                      controller: PageController(
                                          viewportFraction: 0.67),
                                      scrollDirection: Axis.horizontal,
                                      physics: const PageScrollPhysics()
                                          .applyTo(
                                              const BouncingScrollPhysics()),
                                      itemCount: firstlistitems[5].length,
                                      itemBuilder: ((
                                        context,
                                        index,
                                      ) {
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, left: 20),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(
                                                height: 12,
                                              ),
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                child: SizedBox(
                                                  width: 240,
                                                  height: 130,
                                                  child: CachedNetworkImage(
                                                    fadeInDuration:
                                                        const Duration(
                                                            seconds: 1),
                                                    imageUrl:
                                                        'https://globizs.sgp1.cdn.digitaloceanspaces.com/foodwifi/${firstlistitems[5][index]!.img!}',
                                                    fit: BoxFit.cover,
                                                    progressIndicatorBuilder:
                                                        (context, url,
                                                                downloadProgress) =>
                                                            const Skeleton(
                                                      height: 130,
                                                    ),
                                                    errorWidget: (context, url,
                                                            error) =>
                                                        const Icon(Icons.error),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 7),
                                                child: SizedBox(
                                                  width: 240,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        firstlistitems[5]
                                                                [index]!
                                                            .title!,
                                                        style:
                                                            GoogleFonts.kreon(
                                                                fontSize: 12),
                                                      ),
                                                      const Icon(Icons
                                                          .favorite_border_outlined)
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              firstlistitems[5][index]!
                                                          .description !=
                                                      null
                                                  ? Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 5),
                                                      child: Text(
                                                        firstlistitems[5]
                                                                [index]!
                                                            .description!,
                                                        style: GoogleFonts.kreon(
                                                            fontSize: 12,
                                                            color: const Color
                                                                    .fromARGB(
                                                                255,
                                                                148,
                                                                144,
                                                                144)),
                                                      ),
                                                    )
                                                  : const SizedBox(),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 5),
                                                child: Row(
                                                  children: [
                                                    const Icon(
                                                      Icons.star,
                                                      size: 11,
                                                      color: Color.fromARGB(
                                                          255, 220, 204, 52),
                                                    ),
                                                    Text(
                                                      firstlistitems[5][index]!
                                                          .rating!,
                                                      style: GoogleFonts.kreon(
                                                          fontSize: 12,
                                                          color: const Color
                                                                  .fromARGB(
                                                              221, 60, 60, 60)),
                                                    ),
                                                    const Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 3),
                                                      child: Icon(
                                                        Icons.circle,
                                                        size: 2,
                                                      ),
                                                    ),
                                                    Text(
                                                      firstlistitems[5][index]!
                                                          .time!,
                                                      style: GoogleFonts.kreon(
                                                          fontSize: 12,
                                                          color: const Color
                                                                  .fromARGB(
                                                              221, 60, 60, 60)),
                                                    ),
                                                    const Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 3),
                                                      child: Icon(
                                                        Icons.circle,
                                                        size: 2,
                                                      ),
                                                    ),
                                                    Text(
                                                      firstlistitems[5][index]!
                                                          .distance!,
                                                      style: GoogleFonts.kreon(
                                                          fontSize: 12,
                                                          color: const Color
                                                                  .fromARGB(
                                                              221, 60, 60, 60)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }),
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: SizedBox(
                      height: 290,
                      child: Column(
                        children: [
                          Container(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15, top: 25),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 3),
                                    child: Text(
                                      'Popular for Breakfast',
                                      style: GoogleFonts.kreon(fontSize: 20),
                                    ),
                                  ),
                                  const Icon(
                                    FontAwesomeIcons.circleArrowRight,
                                    size: 17,
                                    color: Color.fromARGB(255, 195, 193, 193),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              color: Colors.white,
                              width: double.maxFinite,
                              height: 280,
                              child: firstlistitems.isEmpty
                                  ? const Skeleton(
                                      height: 290,
                                    )
                                  : ListView.builder(
                                      controller: PageController(
                                          viewportFraction: 0.67),
                                      scrollDirection: Axis.horizontal,
                                      physics: const PageScrollPhysics()
                                          .applyTo(
                                              const BouncingScrollPhysics()),
                                      itemCount: firstlistitems[6].length,
                                      itemBuilder: ((
                                        context,
                                        index,
                                      ) {
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, left: 20),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(
                                                height: 12,
                                              ),
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                child: SizedBox(
                                                  width: 240,
                                                  height: 130,
                                                  child: CachedNetworkImage(
                                                    fadeInDuration:
                                                        const Duration(
                                                            seconds: 1),
                                                    imageUrl:
                                                        'https://globizs.sgp1.cdn.digitaloceanspaces.com/foodwifi/${firstlistitems[6][index]!.img!}',
                                                    fit: BoxFit.cover,
                                                    progressIndicatorBuilder:
                                                        (context, url,
                                                                downloadProgress) =>
                                                            const Skeleton(
                                                      height: 130,
                                                    ),
                                                    errorWidget: (context, url,
                                                            error) =>
                                                        const Icon(Icons.error),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 7),
                                                child: SizedBox(
                                                  width: 240,
                                                  child: Text(
                                                    firstlistitems[6][index]!
                                                        .title!,
                                                    style: GoogleFonts.kreon(
                                                        fontSize: 12),
                                                  ),
                                                ),
                                              ),
                                              firstlistitems[6][index]!
                                                          .description !=
                                                      null
                                                  ? Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 5),
                                                      child: Text(
                                                        firstlistitems[6]
                                                                [index]!
                                                            .description!,
                                                        style: GoogleFonts.kreon(
                                                            fontSize: 12,
                                                            color: const Color
                                                                    .fromARGB(
                                                                255,
                                                                148,
                                                                144,
                                                                144)),
                                                      ),
                                                    )
                                                  : const SizedBox(),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 5),
                                                child: Row(
                                                  children: [
                                                    const Icon(
                                                      Icons.star,
                                                      size: 11,
                                                      color: Color.fromARGB(
                                                          255, 220, 204, 52),
                                                    ),
                                                    Text(
                                                      firstlistitems[6][index]!
                                                          .rating!,
                                                      style: GoogleFonts.kreon(
                                                          fontSize: 12,
                                                          color: const Color
                                                                  .fromARGB(
                                                              221, 60, 60, 60)),
                                                    ),
                                                    const Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 3),
                                                      child: Icon(
                                                        Icons.circle,
                                                        size: 2,
                                                      ),
                                                    ),
                                                    Text(
                                                      firstlistitems[6][index]!
                                                          .time!,
                                                      style: GoogleFonts.kreon(
                                                          fontSize: 12,
                                                          color: const Color
                                                                  .fromARGB(
                                                              221, 60, 60, 60)),
                                                    ),
                                                    const Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 3),
                                                      child: Icon(
                                                        Icons.circle,
                                                        size: 2,
                                                      ),
                                                    ),
                                                    Text(
                                                      firstlistitems[6][index]!
                                                          .distance!,
                                                      style: GoogleFonts.kreon(
                                                          fontSize: 12,
                                                          color: const Color
                                                                  .fromARGB(
                                                              221, 60, 60, 60)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }),
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: SizedBox(
                      height: 320,
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15, top: 25),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 3),
                                    child: Text(
                                      'Best of Local',
                                      style: GoogleFonts.kreon(fontSize: 20),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      'Lets support the unique taste of our locals',
                                      style:
                                          GoogleFonts.kreon(color: Colors.grey),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              color: Colors.white,
                              width: double.maxFinite,
                              height: 280,
                              child: firstlistitems.isEmpty
                                  ? const Skeleton(
                                      height: 320,
                                    )
                                  : ListView.builder(
                                      controller: PageController(
                                          viewportFraction: 0.88),
                                      scrollDirection: Axis.horizontal,
                                      physics: const PageScrollPhysics()
                                          .applyTo(
                                              const BouncingScrollPhysics()),
                                      itemCount: firstlistitems[7].length,
                                      itemBuilder: ((
                                        context,
                                        index,
                                      ) {
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, left: 20),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(
                                                height: 12,
                                              ),
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                child: SizedBox(
                                                    width: 320,
                                                    height: 183,
                                                    child: Stack(
                                                      fit: StackFit.expand,
                                                      children: [
                                                        CachedNetworkImage(
                                                          fadeInDuration:
                                                              const Duration(
                                                                  seconds: 1),
                                                          imageUrl:
                                                              'https://globizs.sgp1.cdn.digitaloceanspaces.com/foodwifi/${firstlistitems[7][index]!.img!}',
                                                          fit: BoxFit.cover,
                                                          progressIndicatorBuilder:
                                                              (context, url,
                                                                      downloadProgress) =>
                                                                  const Skeleton(
                                                            height: 180,
                                                          ),
                                                          errorWidget: (context,
                                                                  url, error) =>
                                                              const Icon(
                                                                  Icons.error),
                                                        ),
                                                        Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      bottom:
                                                                          4),
                                                              child: Container(
                                                                decoration: BoxDecoration(
                                                                    gradient: const LinearGradient(
                                                                        colors: [
                                                                          Colors
                                                                              .white10,
                                                                          Colors
                                                                              .black26,
                                                                          Colors
                                                                              .black54,
                                                                          Color.fromARGB(
                                                                              221,
                                                                              19,
                                                                              19,
                                                                              19)
                                                                        ],
                                                                        begin: Alignment
                                                                            .topCenter,
                                                                        end: Alignment
                                                                            .bottomCenter),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10)),
                                                                child: Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      left: 15,
                                                                      bottom:
                                                                          15),
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      Padding(
                                                                        padding:
                                                                            const EdgeInsets.only(top: 7),
                                                                        child:
                                                                            Text(
                                                                          firstlistitems[7][index]!
                                                                              .title!,
                                                                          style: GoogleFonts.kreon(
                                                                              fontSize: 22,
                                                                              color: Colors.white,
                                                                              fontWeight: FontWeight.bold),
                                                                        ),
                                                                      ),
                                                                      firstlistitems[7][index]!.description !=
                                                                              null
                                                                          ? Padding(
                                                                              padding: const EdgeInsets.only(top: 5),
                                                                              child: Text(
                                                                                firstlistitems[7][index]!.description!,
                                                                                style: GoogleFonts.kreon(fontSize: 13, color: Colors.white),
                                                                              ),
                                                                            )
                                                                          : const SizedBox(),
                                                                      Padding(
                                                                        padding:
                                                                            const EdgeInsets.only(top: 5),
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            Text(
                                                                              firstlistitems[7][index]!.distance!,
                                                                              style: GoogleFonts.kreon(fontSize: 12, color: Colors.white),
                                                                            ),
                                                                            const Padding(
                                                                              padding: EdgeInsets.symmetric(horizontal: 3),
                                                                              child: Icon(
                                                                                Icons.circle,
                                                                                size: 2,
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              firstlistitems[7][index]!.time!,
                                                                              style: GoogleFonts.kreon(fontSize: 12, color: Colors.white),
                                                                            ),
                                                                            const Padding(
                                                                              padding: EdgeInsets.symmetric(horizontal: 3),
                                                                              child: Icon(
                                                                                Icons.circle,
                                                                                size: 2,
                                                                              ),
                                                                            ),
                                                                            const Icon(
                                                                              Icons.star,
                                                                              size: 11,
                                                                              color: Color.fromARGB(255, 220, 204, 52),
                                                                            ),
                                                                            Text(
                                                                              firstlistitems[7][index]!.rating!,
                                                                              style: GoogleFonts.kreon(fontSize: 12, color: Colors.white),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    )),
                                              ),
                                            ],
                                          ),
                                        );
                                      }),
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: SizedBox(
                      height: 320,
                      child: Column(
                        children: [
                          Container(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15, top: 25),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 3),
                                        child: Text(
                                          'People\'s Pick For Dinner',
                                          style:
                                              GoogleFonts.kreon(fontSize: 20),
                                        ),
                                      ),
                                      const Icon(
                                        FontAwesomeIcons.circleArrowRight,
                                        size: 17,
                                        color:
                                            Color.fromARGB(255, 195, 193, 193),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      'What\'s your pick?',
                                      style:
                                          GoogleFonts.kreon(color: Colors.grey),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              color: Colors.white,
                              width: double.maxFinite,
                              height: 280,
                              child: firstlistitems.isEmpty
                                  ? const Skeleton(
                                      height: 320,
                                    )
                                  : ListView.builder(
                                      controller: PageController(
                                          viewportFraction: 0.70),
                                      scrollDirection: Axis.horizontal,
                                      physics: const PageScrollPhysics()
                                          .applyTo(
                                              const BouncingScrollPhysics()),
                                      itemCount: firstlistitems[8].length,
                                      itemBuilder: ((
                                        context,
                                        index,
                                      ) {
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, left: 20),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(
                                                height: 12,
                                              ),
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                child: SizedBox(
                                                  width: 255,
                                                  height: 140,
                                                  child: CachedNetworkImage(
                                                    fadeInDuration:
                                                        const Duration(
                                                            seconds: 1),
                                                    imageUrl:
                                                        'https://globizs.sgp1.cdn.digitaloceanspaces.com/foodwifi/${firstlistitems[8][index]!.img!}',
                                                    fit: BoxFit.fitWidth,
                                                    progressIndicatorBuilder:
                                                        (context, url,
                                                                downloadProgress) =>
                                                            const Skeleton(
                                                      height: 140,
                                                    ),
                                                    errorWidget: (context, url,
                                                            error) =>
                                                        const Icon(Icons.error),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 7),
                                                child: SizedBox(
                                                  width: 240,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        firstlistitems[8]
                                                                [index]!
                                                            .title!,
                                                        style:
                                                            GoogleFonts.kreon(
                                                                fontSize: 12),
                                                      ),
                                                      const Icon(Icons
                                                          .favorite_border_outlined)
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              firstlistitems[8][index]!
                                                          .description !=
                                                      null
                                                  ? Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 5),
                                                      child: Text(
                                                        firstlistitems[8]
                                                                [index]!
                                                            .description!,
                                                        style: GoogleFonts.kreon(
                                                            fontSize: 12,
                                                            color: const Color
                                                                    .fromARGB(
                                                                255,
                                                                148,
                                                                144,
                                                                144)),
                                                      ),
                                                    )
                                                  : const SizedBox(),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 5),
                                                child: Row(
                                                  children: [
                                                    const Icon(
                                                      Icons.star,
                                                      size: 11,
                                                      color: Color.fromARGB(
                                                          255, 220, 204, 52),
                                                    ),
                                                    Text(
                                                      firstlistitems[8][index]!
                                                          .rating!,
                                                      style: GoogleFonts.kreon(
                                                          fontSize: 12,
                                                          color: const Color
                                                                  .fromARGB(
                                                              221, 60, 60, 60)),
                                                    ),
                                                    const Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 3),
                                                      child: Icon(
                                                        Icons.circle,
                                                        size: 2,
                                                      ),
                                                    ),
                                                    Text(
                                                      firstlistitems[8][index]!
                                                          .time!,
                                                      style: GoogleFonts.kreon(
                                                          fontSize: 12,
                                                          color: const Color
                                                                  .fromARGB(
                                                              221, 60, 60, 60)),
                                                    ),
                                                    const Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 3),
                                                      child: Icon(
                                                        Icons.circle,
                                                        size: 2,
                                                      ),
                                                    ),
                                                    Text(
                                                      firstlistitems[8][index]!
                                                          .distance!,
                                                      style: GoogleFonts.kreon(
                                                          fontSize: 12,
                                                          color: const Color
                                                                  .fromARGB(
                                                              221, 60, 60, 60)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }),
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
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
