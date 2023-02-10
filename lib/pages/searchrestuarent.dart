import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodwifi/model/allbelowmodel.dart';
import 'package:foodwifi/model/searchmodal.dart';
import 'package:foodwifi/refactor/skeleton.dart';
import 'package:foodwifi/router/router.gr.dart';
import 'package:foodwifi/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../logic/searchrestuarent/cubit/search_restuarent_cubit.dart';

class SearchRestuarentPage extends StatefulWidget {
  final bool issearchfoud;
  final String itemname;
  final String cuisinesId;
  final String storetypeid;
  final String checkname;
  const SearchRestuarentPage(
      {super.key,
      required this.itemname,
      required this.issearchfoud,
      required this.cuisinesId,
      required this.storetypeid,
      required this.checkname});

  @override
  State<SearchRestuarentPage> createState() => _SearchRestuarentPageState();
}

class _SearchRestuarentPageState extends State<SearchRestuarentPage> {
  ScrollController controller = ScrollController();
  bool? ismoreloading;
  bool? isempty;
  int data = 1;
  int? ind;

  List<SearchRestuarentModal> allsearchdata = [];

  @override
  void initState() {
    super.initState();
    if (widget.issearchfoud) {
      getdatatopsearch();
    } else {
      getdata();
    }

    controller.addListener(() async {
      if (controller.position.pixels == controller.position.maxScrollExtent) {
        if (ismoreloading == false) {
          log('Item reach its limit');
        } else {
          setState(() {
            data = data + 1;
          });
          log(data.toString());
          var allsearchitems =
              await context.read<SearchRestuarentCubit>().getsearchdata(
                    itemname: widget.itemname,
                    page: data,
                    isMoredata: true,
                  );

          setState(() {
            allsearchdata = allsearchdata + allsearchitems!;
          });

          log('reach buttom');
        }
      }
    });
    log('Search Page :${widget.itemname}');
  }

  getdata() async {
    var finaldata = await context.read<SearchRestuarentCubit>().getsearchdata(
          itemname: widget.itemname,
          page: 1,
          isMoredata: true,
        );

    setState(() {
      allsearchdata = allsearchdata + finaldata!;
    });
  }

  getdatatopsearch() async {
    var finaldata = await context.read<SearchRestuarentCubit>().getsearchdata(
          Storetypeid: widget.storetypeid,
          cuisinesid: widget.cuisinesId,
          itemname: widget.itemname,
          page: 1,
          isMoredata: true,
        );

    setState(() {
      allsearchdata = allsearchdata + finaldata!;
    });
    ind = seachitems.indexOf(widget.checkname);
  }

  List seachitems = [
    'Sort by',
    'Store types',
    'Cuisines',
    'Free delivery',
    'Halal',
    'Promo'
  ];
  int indexfinal = 0;
  ReviewModalModified? catename;
  Product? product;

  void getindex(int index, int itemindex) async {
    var allbelowdata =
        await ServiceApi().getbelowproductdata(allsearchdata[index].id);
    for (var element in allbelowdata!) {
      for (var element2 in element.products) {
        if (allsearchdata[index].items[itemindex].name == element2.name) {
          setState(() {
            catename = element;
            indexfinal = allbelowdata.indexOf(catename!);
            product = element2;
          });
          context.router.push(ProductRoute(
            id: allsearchdata[index].id,
            itemname: allsearchdata[index].title,
            iscomingfromsearch: true,
            index: indexfinal,
            product: product!,
          ));
          log('new index:${indexfinal.toString()}');
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    log(widget.checkname);
    final searchdata = context.watch<SearchRestuarentCubit>().state;
    isempty = searchdata.isempty;
    ismoreloading = searchdata.isloading;
    // allsearchdata = searchdata.searchdata;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(
              flex: widget.issearchfoud ? 5 : 15,
              child: Material(
                elevation: allsearchdata.isEmpty ? 0 : 5,
                child: Container(
                  child: Column(
                    children: [
                      widget.issearchfoud
                          ? const SizedBox()
                          : Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, top: 20, right: 20),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: ListTile(
                                    contentPadding: EdgeInsets.zero,
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            context.router.pop();
                                          },
                                          child: const Icon(
                                            Icons.arrow_back_ios,
                                            size: 20,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            widget.itemname.isEmpty
                                                ? 'Foods near you'
                                                : widget.itemname,
                                            textAlign: TextAlign.center,
                                            style:
                                                GoogleFonts.kreon(fontSize: 20),
                                          ),
                                        ),
                                        const Text('         ')
                                      ],
                                    )),
                              ),
                            ),
                      Expanded(
                        child: Container(
                            child: allsearchdata.isEmpty
                                ? isempty!
                                    ? ListView.builder(
                                        physics: const BouncingScrollPhysics(),
                                        scrollDirection: Axis.horizontal,
                                        itemCount: seachitems.length,
                                        itemBuilder: (context, index) {
                                          log('index new for items $ind');
                                          return InkWell(
                                            onTap: () {
                                              switch (index) {
                                                case 0:
                                                  context.router.push(SortRoute(
                                                    title: seachitems[index],
                                                  ));
                                                  break;
                                                default:
                                              }
                                            },
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 10,
                                                  right: index ==
                                                          (seachitems.length -
                                                              1)
                                                      ? 10
                                                      : 0),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: seachitems[index] ==
                                                                    widget
                                                                        .checkname
                                                                ? const Color.fromARGB(
                                                                    255, 84, 252, 151)
                                                                : const Color.fromARGB(
                                                                    255, 215, 213, 213),
                                                            width: 1),
                                                        color: seachitems[index] ==
                                                                widget.checkname
                                                            ? const Color.fromARGB(
                                                                255, 177, 245, 204)
                                                            : const Color.fromARGB(
                                                                255, 215, 213, 213),
                                                        borderRadius:
                                                            BorderRadius.circular(15)),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 10,
                                                              right: 10,
                                                              top: 5,
                                                              bottom: 5),
                                                      child: Text(
                                                          seachitems[index]),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        })
                                    : const SizedBox()
                                : ListView.builder(
                                    physics: const BouncingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: seachitems.length,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          switch (index) {
                                            case 0:
                                              context.router.push(SortRoute(
                                                title: seachitems[index],
                                              ));
                                              break;
                                            default:
                                          }
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 10,
                                              right: index ==
                                                      (seachitems.length - 1)
                                                  ? 10
                                                  : 0),
                                          child: Row(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: seachitems[index] ==
                                                                widget.checkname
                                                            ? const Color.fromARGB(
                                                                255, 84, 252, 151)
                                                            : const Color.fromARGB(
                                                                255,
                                                                215,
                                                                213,
                                                                213),
                                                        width: 1),
                                                    color: seachitems[index] ==
                                                            widget.checkname
                                                        ? const Color.fromARGB(
                                                            255, 177, 245, 204)
                                                        : const Color.fromARGB(
                                                            255, 215, 213, 213),
                                                    borderRadius:
                                                        BorderRadius.circular(15)),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10,
                                                          right: 10,
                                                          top: 5,
                                                          bottom: 5),
                                                  child:
                                                      Text(seachitems[index]),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    })),
                      )
                    ],
                  ),
                ),
              )),
          Expanded(
            flex: 80,
            child: SingleChildScrollView(
              controller: controller,
              child: Container(
                child: Column(
                  children: [
                    allsearchdata.isEmpty
                        ? isempty!
                            ? Image.asset('assets/images/empty.jpg')
                            : Column(
                                children: [
                                  ListView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      itemCount: 5,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10, bottom: 20),
                                          child: Row(
                                            children: [
                                              const Skeleton(
                                                height: 90,
                                                width: 90,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: SizedBox(
                                                  height: 85,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: const [
                                                      Skeleton(
                                                        radius: 0,
                                                        height: 20,
                                                        width: 250,
                                                      ),
                                                      Skeleton(
                                                        radius: 0,
                                                        height: 17,
                                                        width: 170,
                                                      ),
                                                      Skeleton(
                                                        radius: 0,
                                                        height: 20,
                                                        width: 250,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                      }),
                                  const Divider(
                                    thickness: 5,
                                  )
                                ],
                              )
                        : ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.only(top: 7),
                            shrinkWrap: true,
                            itemCount: allsearchdata.length,
                            itemBuilder: (context, index) {
                              return Container(
                                  child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15, right: 15, top: 10),
                                    child: Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            context.router.push(ProductRoute(
                                              id: allsearchdata[index].id,
                                              itemname:
                                                  allsearchdata[index].title,
                                              iscomingfromsearch: false,
                                              index: 0,
                                            ));
                                          },
                                          child: SizedBox(
                                            height: 90,
                                            width: 90,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: allsearchdata[index].img ==
                                                      null
                                                  ? SizedBox(
                                                      height: 90,
                                                      width: 90,
                                                      child: ClipOval(
                                                        child: Image.asset(
                                                            'assets/images/foodwifi.png',
                                                            color: Colors.white
                                                                .withOpacity(
                                                                    0.2),
                                                            colorBlendMode:
                                                                BlendMode
                                                                    .modulate),
                                                      ),
                                                    )
                                                  : Image.network(
                                                      'https://globizs.sgp1.cdn.digitaloceanspaces.com/foodwifi/${allsearchdata[index].img}'),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15),
                                          child: SizedBox(
                                            height: 90,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  allsearchdata[index].title,
                                                  style: GoogleFonts.kreon(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 2),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        allsearchdata[index]
                                                            .time,
                                                        style: GoogleFonts.kreon(
                                                            fontSize: 12,
                                                            color: const Color
                                                                    .fromARGB(
                                                                221,
                                                                60,
                                                                60,
                                                                60)),
                                                      ),
                                                      const Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 3),
                                                        child: Icon(
                                                          Icons.circle,
                                                          size: 2,
                                                        ),
                                                      ),
                                                      Text(
                                                        allsearchdata[index]
                                                            .distance,
                                                        style: GoogleFonts.kreon(
                                                            color: const Color
                                                                    .fromARGB(
                                                                221,
                                                                60,
                                                                60,
                                                                60),
                                                            fontSize: 12),
                                                      ),
                                                      const Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 3),
                                                        child: Icon(
                                                          Icons.circle,
                                                          size: 2,
                                                        ),
                                                      ),
                                                      const Icon(
                                                        Icons.star,
                                                        size: 11,
                                                        color: Color.fromARGB(
                                                            255, 220, 204, 52),
                                                      ),
                                                      Text(
                                                        allsearchdata[index]
                                                            .rating
                                                            .toString(),
                                                        style: GoogleFonts.kreon(
                                                            fontSize: 12,
                                                            color: const Color
                                                                    .fromARGB(
                                                                221,
                                                                60,
                                                                60,
                                                                60)),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Text(
                                                  allsearchdata[index]
                                                      .description,
                                                  style: GoogleFonts.kreon(
                                                      fontSize: 12,
                                                      color:
                                                          const Color.fromARGB(
                                                              221, 60, 60, 60)),
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  const Divider(
                                    thickness: 1,
                                  ),
                                  ListView.builder(
                                      padding: EdgeInsets.zero,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount:
                                          allsearchdata[index].items.length,
                                      itemBuilder: (context, itemindex) {
                                        return InkWell(
                                          onTap: () {
                                            getindex(index, itemindex);
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 15,
                                                right: 15,
                                                top: 15,
                                                bottom: 5),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      width: 250,
                                                      child: Text(
                                                        allsearchdata[index]
                                                            .items[itemindex]
                                                            .name,
                                                        style:
                                                            GoogleFonts.kreon(
                                                                fontSize: 16,
                                                                letterSpacing:
                                                                    0.7),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                        '₹${allsearchdata[index].items[itemindex].price.toString()}')
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 50,
                                                  width: 50,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    child: allsearchdata[index]
                                                                .items[
                                                                    itemindex]
                                                                .image ==
                                                            null
                                                        ? SizedBox(
                                                            height: 50,
                                                            width: 50,
                                                            child: ClipOval(
                                                              child: Image.asset(
                                                                  'assets/images/foodwifi.png',
                                                                  color: Colors
                                                                      .white
                                                                      .withOpacity(
                                                                          0.2),
                                                                  colorBlendMode:
                                                                      BlendMode
                                                                          .modulate),
                                                            ),
                                                          )
                                                        : Image.network(
                                                            'https://globizs.sgp1.cdn.digitaloceanspaces.com/foodwifi/${allsearchdata[index].items[itemindex].image}'),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      }),
                                  const Divider(
                                    thickness: 5,
                                  ),
                                ],
                              ));
                            }),
                    Center(
                      child: allsearchdata.isEmpty
                          ? const SizedBox()
                          : ismoreloading!
                              ? Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Column(
                                    children: [
                                      LoadingAnimationWidget.hexagonDots(
                                          color: Colors.grey, size: 26),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Loading more data',
                                        style: GoogleFonts.kreon(
                                            color: Colors.grey, fontSize: 18),
                                      )
                                    ],
                                  ),
                                )
                              : const SizedBox(),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
