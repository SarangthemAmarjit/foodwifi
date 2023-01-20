import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodwifi/logic/belowproduct/cubit/below_product_cubit_cubit.dart';
import 'package:foodwifi/logic/upperproduct/cubit/upperproduct_cubit_cubit.dart';
import 'package:foodwifi/model/belowproductmodel.dart';
import 'package:foodwifi/model/upperproductmodel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'dart:math' as math;

class ProductPage extends StatefulWidget {
  final String id;
  final String itemname;
  const ProductPage({
    super.key,
    required this.id,
    required this.itemname,
  });

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  Productuppermodel? allupperdata;
  List<Productbelowmodel?>? allbelowdata;
  ScrollController controller = ScrollController();
  double scrolloffset = 0;
  bool showappbar = false;

  @override
  void initState() {
    super.initState();
    getdata();

    controller.addListener(() {
      if (controller.hasClients && controller.offset > 555) {
        setState(() {
          showappbar = true;
        });
      } else {
        setState(() {
          showappbar = false;
        });
      }
      scrolloffset = controller.offset;
      log(scrolloffset.toString());
    });
  }

  getdata() async {
    var allproductupperdata = await context
        .read<UpperproductCubit>()
        .getupperproductdata(id: widget.id);
    var allproductbelowdata = await context
        .read<BelowProductCubitCubit>()
        .getbelowproductdata(id: widget.id);

    setState(() {
      allupperdata = allproductupperdata;
      allbelowdata = allproductbelowdata;
    });
  }

  bool isSwitched = false;

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitched = false;
      });
      print('Switch Button is OFF');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: allupperdata == null
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(6),
                      child: Text(
                        'Serving You is our pleasure',
                        style: GoogleFonts.kreon(
                            fontSize: 20,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    LoadingAnimationWidget.prograssiveDots(
                      color: Colors.black,
                      size: 30,
                    ),
                  ],
                ),
              )
            : Stack(
                children: [
                  Column(
                    children: [
                      Image.network(
                          'https://globizs.sgp1.cdn.digitaloceanspaces.com/foodwifi/${allupperdata!.img}'),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 35, left: 15, right: 15),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () => context.router.pop(),
                            child: const CircleAvatar(
                                backgroundColor: Colors.black45,
                                radius: 23,
                                child: Icon(Icons.arrow_back_ios_new)),
                          ),
                          const CircleAvatar(
                              backgroundColor: Colors.black45,
                              radius: 23,
                              child: Icon(Icons.favorite_border_outlined))
                        ]),
                  ),
                  Positioned(
                    top: 170,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: SingleChildScrollView(
                      clipBehavior: Clip.none,
                      controller: controller,
                      physics: const BouncingScrollPhysics(),
                      child: SizedBox(
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                elevation: 10,
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15, top: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          allupperdata!.title!,
                                          style:
                                              GoogleFonts.kreon(fontSize: 25),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5),
                                          child: Text(
                                            allupperdata!.description!,
                                            style: GoogleFonts.kreon(
                                                fontSize: 16,
                                                color: const Color.fromARGB(
                                                    255, 119, 118, 118)),
                                          ),
                                        ),
                                        Text(
                                          allupperdata!.address!,
                                          style: GoogleFonts.kreon(
                                              fontSize: 16,
                                              color: const Color.fromARGB(
                                                  255, 119, 118, 118)),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: Row(
                                            children: [
                                              const Icon(
                                                Icons.star,
                                                size: 15,
                                                color: Color.fromARGB(
                                                    255, 220, 204, 52),
                                              ),
                                              Text(
                                                (allupperdata!.rating!
                                                    .toString()),
                                                style: GoogleFonts.kreon(
                                                    fontSize: 15,
                                                    color: const Color.fromARGB(
                                                        221, 60, 60, 60)),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5),
                                                child: Text(
                                                  '(${allupperdata!.ratingCount}+ ratings)',
                                                  style: GoogleFonts.kreon(
                                                      fontSize: 15,
                                                      color:
                                                          const Color.fromARGB(
                                                              255,
                                                              119,
                                                              118,
                                                              118)),
                                                ),
                                              ),
                                              const Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 3),
                                                child: Icon(
                                                  Icons.circle,
                                                  size: 2,
                                                ),
                                              ),
                                              Text(
                                                allupperdata!.time!,
                                                style: GoogleFonts.kreon(
                                                    fontSize: 15,
                                                    color: const Color.fromARGB(
                                                        255, 119, 118, 118)),
                                              ),
                                              const Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 3),
                                                child: Icon(
                                                  Icons.circle,
                                                  size: 2,
                                                ),
                                              ),
                                              Text(
                                                allupperdata!.distance!,
                                                style: GoogleFonts.kreon(
                                                    fontSize: 15,
                                                    color: const Color.fromARGB(
                                                        255, 119, 118, 118)),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Row(
                                              children: [
                                                Image.asset(
                                                  'assets/images/fss.png',
                                                  height: 30,
                                                  width: 40,
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  'Lic. No.',
                                                  style: GoogleFonts.kreon(
                                                      color:
                                                          const Color.fromARGB(
                                                              255,
                                                              119,
                                                              118,
                                                              118)),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 12, right: 15, bottom: 15),
                                          child: Container(
                                            height: 40,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: const Color.fromARGB(
                                                    255, 241, 238, 238)),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 15),
                                                child: Text(
                                                  allupperdata!.notices![0]!,
                                                  style: GoogleFonts.kreon(
                                                      color:
                                                          const Color.fromARGB(
                                                              255,
                                                              119,
                                                              118,
                                                              118)),
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Container(
                                color: const Color.fromARGB(255, 243, 241, 241),
                                child: Column(
                                  children: [
                                    Container(
                                      color: Colors.white,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 15),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 133.8,
                                              child: Column(
                                                children: [
                                                  Expanded(
                                                    child: SizedBox(
                                                      height: 200,
                                                      child: ListView.builder(
                                                          physics:
                                                              const BouncingScrollPhysics(),
                                                          itemCount: 1,
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          itemBuilder:
                                                              (BuildContext
                                                                      context,
                                                                  int index) {
                                                            return Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top: 15,
                                                                      left: 15,
                                                                      right:
                                                                          15),
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/burger.jpg',
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            );
                                                          }),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5, top: 10),
                                              child: Row(
                                                children: [
                                                  Switch(
                                                    onChanged: toggleSwitch,
                                                    value: isSwitched,
                                                    activeColor:
                                                        Colors.greenAccent[400],
                                                    activeTrackColor:
                                                        Colors.greenAccent,
                                                    inactiveThumbColor:
                                                        Colors.white,
                                                    inactiveTrackColor:
                                                        Colors.grey,
                                                  ),
                                                  const SizedBox(
                                                    width: 15,
                                                  ),
                                                  Text(
                                                    'Veg only',
                                                    style: GoogleFonts.kreon(
                                                        fontSize: 16),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    ListView.builder(
                                        padding: EdgeInsets.zero,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: allbelowdata!.length,
                                        itemBuilder: ((context, nameindex) {
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 10),
                                            child: Container(
                                              color: Colors.white,
                                              child: ListTile(
                                                title: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      allbelowdata![nameindex]!
                                                          .categoryName!,
                                                      style: GoogleFonts.kreon(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    ListView.builder(
                                                        physics:
                                                            const NeverScrollableScrollPhysics(),
                                                        itemCount:
                                                            allbelowdata![
                                                                    nameindex]!
                                                                .products!
                                                                .length,
                                                        shrinkWrap: true,
                                                        itemBuilder: ((context,
                                                            itemindex) {
                                                          return Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    bottom: 30),
                                                            child: Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Stack(
                                                                  alignment:
                                                                      Alignment
                                                                          .topRight,
                                                                  children: [
                                                                    allbelowdata![nameindex]!
                                                                            .products![itemindex]!
                                                                            .img
                                                                            .toString()
                                                                            .isEmpty
                                                                        ? SizedBox(
                                                                            height:
                                                                                80,
                                                                            width:
                                                                                80,
                                                                            child:
                                                                                ClipOval(
                                                                              child: Image.asset('assets/images/foodwifi.png', color: Colors.white.withOpacity(0.2), colorBlendMode: BlendMode.modulate),
                                                                            ),
                                                                          )
                                                                        : SizedBox(
                                                                            height:
                                                                                80,
                                                                            width:
                                                                                80,
                                                                            child:
                                                                                ClipRRect(borderRadius: BorderRadius.circular(5), child: Image.network('https://globizs.sgp1.cdn.digitaloceanspaces.com/foodwifi/${allbelowdata![nameindex]!.products![itemindex]!.img}')),
                                                                          ),
                                                                    Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              1),
                                                                      child: Image
                                                                          .asset(
                                                                        allbelowdata![nameindex]!.products![itemindex]!.type ==
                                                                                'non_veg'
                                                                            ? 'assets/images/nonvegok.png'
                                                                            : 'assets/images/veg.png',
                                                                        height:
                                                                            17,
                                                                        width:
                                                                            17,
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      left: 20),
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(allbelowdata![
                                                                              nameindex]!
                                                                          .products![
                                                                              itemindex]!
                                                                          .name!),
                                                                      SizedBox(
                                                                        width:
                                                                            210,
                                                                        child:
                                                                            Text(
                                                                          allbelowdata![nameindex]!
                                                                              .products![itemindex]!
                                                                              .description!,
                                                                          style:
                                                                              GoogleFonts.kreon(fontSize: 14),
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            28,
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            240,
                                                                        child:
                                                                            Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Row(
                                                                              children: [
                                                                                Text(
                                                                                  allbelowdata![nameindex]!.products![itemindex]!.price!.toString(),
                                                                                  style: const TextStyle(decoration: TextDecoration.lineThrough),
                                                                                ),
                                                                                const SizedBox(
                                                                                  width: 10,
                                                                                ),
                                                                                Text('₹${allbelowdata![nameindex]!.products![itemindex]!.offer!.offerPrice.toString()}'),
                                                                              ],
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsets.only(left: 10),
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.circular(2),
                                                                                child: Container(
                                                                                  height: 24,
                                                                                  color: const Color.fromARGB(255, 17, 149, 138),
                                                                                  child: Padding(
                                                                                    padding: const EdgeInsets.all(2),
                                                                                    child: Row(
                                                                                      children: [
                                                                                        Transform(
                                                                                          alignment: Alignment.center,
                                                                                          transform: Matrix4.rotationY(math.pi),
                                                                                          child: const FaIcon(
                                                                                            FontAwesomeIcons.tag,
                                                                                            color: Colors.white,
                                                                                            size: 14,
                                                                                          ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: const EdgeInsets.only(left: 5),
                                                                                          child: Text(
                                                                                            allbelowdata![nameindex]!.products![itemindex]!.offer!.description.toString(),
                                                                                            style: GoogleFonts.kreon(color: Colors.white, fontSize: 12),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        }))
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        })),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  showappbar
                      ? Material(
                          elevation: 15,
                          child: Container(
                            height: 100,
                            width: MediaQuery.of(context).size.width,
                            color: Colors.white,
                            child: SafeArea(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15, right: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10),
                                              child: InkWell(
                                                onTap: () {
                                                  context.router.pop();
                                                },
                                                child: const Icon(
                                                    Icons.arrow_back_ios_new),
                                              ),
                                            ),
                                            Text(widget.itemname),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              'CLOSED',
                                              style: GoogleFonts.kreon(
                                                  fontSize: 12,
                                                  color: Colors.red),
                                            ),
                                          ],
                                        ),
                                        const Icon(
                                            Icons.favorite_border_outlined)
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, left: 15, right: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            showModalBottomSheet(
                                              context: context,
                                              builder: (context) =>
                                                  DraggableScrollableSheet(
                                                initialChildSize: 0.2,
                                                minChildSize: 0.1,
                                                maxChildSize: 1,
                                                snapSizes: const [
                                                  0.3,
                                                  0.6,
                                                  0.9,
                                                  1.0
                                                ],
                                                snap: true,
                                                builder: (context,
                                                        scrollController) =>
                                                    Container(
                                                  height: 200,
                                                  color: Colors.purple,
                                                ),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            height: 30,
                                            width: 235,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: const Color.fromARGB(
                                                    255, 226, 225, 225)),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10, right: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: const [
                                                  Text('Momo'),
                                                  Icon(Icons.arrow_drop_down)
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          height: 30,
                                          width: 115,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: const Color.fromARGB(
                                                  255, 226, 225, 225)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: const [
                                              FaIcon(
                                                FontAwesomeIcons
                                                    .magnifyingGlass,
                                                size: 14,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text('Search')
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      : const SizedBox()
                ],
              ));
  }
}
