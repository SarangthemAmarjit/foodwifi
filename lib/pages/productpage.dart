import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodwifi/logic/belowproduct/cubit/below_product_cubit_cubit.dart';
import 'package:foodwifi/logic/upperproduct/cubit/upperproduct_cubit_cubit.dart';
import 'package:foodwifi/model/allbelowmodel.dart';
import 'package:foodwifi/model/belowproductmodel.dart';
import 'package:foodwifi/model/upperproductmodel.dart';
import 'package:foodwifi/refactor/productlist.dart';
import 'package:foodwifi/refactor/vegonlylist.dart';
import 'package:foodwifi/router/router.gr.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class ProductPage extends StatefulWidget {
  final Product? product;

  final int index;
  final bool iscomingfromsearch;
  final String id;
  final String itemname;
  const ProductPage({
    super.key,
    required this.id,
    required this.itemname,
    required this.iscomingfromsearch,
    required this.index,
    this.product,
  });

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  Productuppermodel? allupperdata;
  ScrollPhysics singlechildscroll = const BouncingScrollPhysics();
  ScrollPhysics listviewscroll = const BouncingScrollPhysics();

  ScrollController? controller;
  SheetController? sheetcontroller = SheetController();
  DraggableScrollableController dragController =
      DraggableScrollableController();
  ScrollController controller2 = ScrollController();
  double scrolloffset = 0;
  bool showappbar = false;
  final double _opacity = 0;
  String itemname = '';
  bool showcontainer = false;

  ItemScrollController? itemScrollController = ItemScrollController();
  ItemPositionsListener? itemPositionsListener;
  int itemindex = 0;
  ScrollDirection? direction;
  ScrollDirection? direction2;

  @override
  void initState() {
    super.initState();
    context.read<UpperproductCubit>().getupperproductdata(widget.id);
    context.read<BelowProductCubitCubit>().getbelowproductdata(widget.id);

    itemPositionsListener = ItemPositionsListener.create();
    controller = ScrollController();
    if (widget.iscomingfromsearch) {
      Future.delayed(const Duration(seconds: 1), () {
        controller!
            .animateTo(
          controller!.position.maxScrollExtent / 1.11,
          curve: Curves.easeOut,
          duration: const Duration(milliseconds: 600),
        )
            .whenComplete(() {
          setState(() {
            showappbar = true;
          });
          log('index  :${widget.index}');
          scrollTo(widget.index);
        }).whenComplete(() {
          Future.delayed(const Duration(milliseconds: 1200), () {
            context.router.push(ProductDetailRoute(product: widget.product!));
          });
        });
      });
    }

    controller!.addListener(() {
      if (direction2 == ScrollDirection.reverse) {
        log('down');
        if (controller!.hasClients && controller!.offset > 555) {
          setState(() {
            showappbar = true;
          });
        } else {
          setState(() {
            showappbar = false;
          });
        }
      } else if (direction2 == ScrollDirection.forward) {
        if (controller!.hasClients && controller!.offset < 555) {
          setState(() {
            showappbar = false;
          });
        }
      }
      log(controller!.offset.toString());
    });
  }

  int? min;
  double? progress;
  void scrollTo(int index) => itemScrollController!.scrollTo(
      index: index,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOutCubic,
      alignment: widget.iscomingfromsearch ? 0.05 : 0.12);

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
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final allproductupperdata = context.watch<UpperproductCubit>().state;
    final allproductbelowdata = context.watch<BelowProductCubitCubit>().state;

    Productuppermodel? allupperdata = allproductupperdata.upperdata;

    List<ReviewModalModified?>? allvegdatalist = allproductbelowdata.vegdata;

    List<ReviewModalModified?>? newallbelowdata =
        allproductbelowdata.allbelowitems;
    List<Productbelowmodel?>? originalbelowdata =
        allproductbelowdata.orialldata;

    switch (allproductupperdata.status) {
      case Status.initial:
        return Container();

      case Status.loading:
        return Center(
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
        );

      case Status.loaded:
        return Scaffold(
            body: Stack(
          children: [
            Column(
              children: [
                Image.network(
                    'https://globizs.sgp1.cdn.digitaloceanspaces.com/foodwifi/${allupperdata!.img}'),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 35, left: 15, right: 15),
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
              child: NotificationListener<UserScrollNotification>(
                onNotification: (notification) {
                  direction2 = notification.direction;

                  log('Progress :$progress');

                  return true;
                },
                child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (overscroll) {
                    overscroll.disallowIndicator();
                    return true;
                  },
                  child: SingleChildScrollView(
                    clipBehavior: Clip.none,
                    controller: controller,
                    physics: progress == null
                        ? const AlwaysScrollableScrollPhysics()
                        : progress == 0.0
                            ? const AlwaysScrollableScrollPhysics()
                            : const NeverScrollableScrollPhysics(),
                    child: SizedBox(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              elevation: 10,
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 15, top: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        allupperdata.title!,
                                        style: GoogleFonts.kreon(fontSize: 25),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5),
                                        child: Text(
                                          allupperdata.description!,
                                          style: GoogleFonts.kreon(
                                              fontSize: 16,
                                              color: const Color.fromARGB(
                                                  255, 119, 118, 118)),
                                        ),
                                      ),
                                      Text(
                                        allupperdata.address!,
                                        style: GoogleFonts.kreon(
                                            fontSize: 16,
                                            color: const Color.fromARGB(
                                                255, 119, 118, 118)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: Row(
                                          children: [
                                            const Icon(
                                              Icons.star,
                                              size: 15,
                                              color: Color.fromARGB(
                                                  255, 220, 204, 52),
                                            ),
                                            Text(
                                              (allupperdata.rating!.toString()),
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
                                                '(${allupperdata.ratingCount}+ ratings)',
                                                style: GoogleFonts.kreon(
                                                    fontSize: 15,
                                                    color: const Color.fromARGB(
                                                        255, 119, 118, 118)),
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
                                              allupperdata.time!,
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
                                              allupperdata.distance!,
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
                                                    color: const Color.fromARGB(
                                                        255, 119, 118, 118)),
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
                                          width:
                                              MediaQuery.of(context).size.width,
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
                                                allupperdata.notices![0]!,
                                                style: GoogleFonts.kreon(
                                                    color: const Color.fromARGB(
                                                        255, 119, 118, 118)),
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
                                                                    right: 15),
                                                            child: Image.asset(
                                                              'assets/images/burger.jpg',
                                                              fit: BoxFit.cover,
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
                                  isSwitched
                                      ? Column(
                                          children: [
                                            SizedBox(
                                              child: ListView.builder(
                                                  physics: showappbar
                                                      ? const BouncingScrollPhysics()
                                                      : const NeverScrollableScrollPhysics(),
                                                  itemCount:
                                                      allvegdatalist.length,
                                                  shrinkWrap: true,
                                                  itemBuilder:
                                                      ((context, index) {
                                                    return VegetableonlyListPage(
                                                      allvegdatalist:
                                                          allvegdatalist,
                                                      ind: index,
                                                      id: widget.id,
                                                    );
                                                  })),
                                            )
                                          ],
                                        )
                                      : Column(
                                          children: [
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                  .size
                                                  .height,
                                              child: NotificationListener<
                                                  UserScrollNotification>(
                                                onNotification: (notification) {
                                                  direction =
                                                      notification.direction;
                                                  progress = notification
                                                      .metrics.pixels;
                                                  log('Pixels :${notification.metrics.pixels}');
                                                  log('max scroll index :${notification.metrics.maxScrollExtent}');

                                                  if (direction ==
                                                      ScrollDirection.reverse) {
                                                    log('down');

                                                    setState(() {
                                                      showappbar = true;
                                                    });
                                                  } else if (direction ==
                                                      ScrollDirection.forward) {
                                                    if (progress == 0) {
                                                      setState(() {
                                                        showappbar = false;
                                                      });
                                                    }
                                                  }

                                                  log('Progress :$progress');

                                                  return true;
                                                },
                                                child: ScrollablePositionedList
                                                    .builder(
                                                  itemPositionsListener:
                                                      itemPositionsListener,
                                                  itemScrollController:
                                                      itemScrollController,
                                                  physics: showappbar
                                                      ? const AlwaysScrollableScrollPhysics()
                                                      : const NeverScrollableScrollPhysics(),
                                                  padding: EdgeInsets.zero,
                                                  shrinkWrap: true,
                                                  itemCount:
                                                      newallbelowdata.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return ProductListPage(
                                                      allbelowdata:
                                                          newallbelowdata,
                                                      nameindex: index,
                                                      id: widget.id,
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            showappbar
                ? Material(
                    elevation: 15,
                    child: Container(
                      height: 102,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: SafeArea(
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
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
                                            fontSize: 12, color: Colors.red),
                                      ),
                                    ],
                                  ),
                                  const Icon(Icons.favorite_border_outlined)
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
                                      log('pressed');
                                      showFlexibleBottomSheet<void>(
                                        useRootNavigator: true,
                                        barrierColor: Colors.black38,
                                        duration:
                                            const Duration(milliseconds: 450),
                                        isModal: true,
                                        decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20))),
                                        isCollapsible: false,
                                        minHeight: 0.1,
                                        initHeight: 0.5,
                                        maxHeight: 0.85,
                                        context: context,
                                        bottomSheetColor: Colors.transparent,
                                        builder: (context, controller, offset) {
                                          log('Scrollcntroller :$offset');
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                left: 15, top: 15),
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: 5,
                                                  decoration: BoxDecoration(
                                                      color:
                                                          const Color.fromARGB(
                                                              255,
                                                              199,
                                                              197,
                                                              197),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  width: 40,
                                                ),
                                                Flexible(
                                                  child: Container(
                                                    child: ListView.separated(
                                                      shrinkWrap: true,
                                                      physics:
                                                          const BouncingScrollPhysics(),
                                                      controller: controller,
                                                      itemCount: newallbelowdata
                                                          .length,
                                                      padding: EdgeInsets.zero,
                                                      itemBuilder:
                                                          (BuildContext context,
                                                              int index) {
                                                        return InkWell(
                                                          onTap: () {
                                                            setState(() {
                                                              itemname =
                                                                  newallbelowdata[
                                                                          index]!
                                                                      .categoryName;
                                                            });
                                                            log('Index :$index');
                                                            scrollTo(index);

                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    top: 5,
                                                                    bottom: 10),
                                                            child: Text(
                                                              originalbelowdata[
                                                                      index]!
                                                                  .categoryName!,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      separatorBuilder:
                                                          (BuildContext context,
                                                              int index) {
                                                        return const Divider(
                                                          color: Color.fromARGB(
                                                              255,
                                                              215,
                                                              213,
                                                              213),
                                                          thickness: 1,
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                        anchors: [0.1, 0.8],
                                      );
                                    },
                                    child: ValueListenableBuilder<
                                        Iterable<ItemPosition>>(
                                      valueListenable:
                                          itemPositionsListener!.itemPositions,
                                      builder: (context, positions, child) {
                                        if (positions.isNotEmpty) {
                                          // Determine the first visible item by finding the item with the
                                          // smallest trailing edge that is greater than 0.  i.e. the first
                                          // item whose trailing edge in visible in the viewport.
                                          min = positions
                                              .where((ItemPosition position) =>
                                                  position.itemTrailingEdge >
                                                  0.14)
                                              .reduce((ItemPosition min,
                                                  ItemPosition position) {
                                            return position.itemTrailingEdge <
                                                    min.itemTrailingEdge
                                                ? position
                                                : min;
                                          }).index;
                                          log('min :$min');

                                          itemname = newallbelowdata[min!]!
                                              .categoryName;
                                        }
                                        return Container(
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
                                              children: [
                                                Text(itemname),
                                                const Icon(
                                                    Icons.arrow_drop_down)
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    height: 30,
                                    width: 115,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color.fromARGB(
                                            255, 226, 225, 225)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        FaIcon(
                                          FontAwesomeIcons.magnifyingGlass,
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
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : const SizedBox()
          ],
        ));
      case Status.error:
        return Container(
          child: const Text('error'),
        );
    }
  }
}
