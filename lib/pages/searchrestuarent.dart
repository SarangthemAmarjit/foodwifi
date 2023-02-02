import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodwifi/model/searchmodal.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../logic/searchrestuarent/cubit/search_restuarent_cubit.dart';

class SearchRestuarentPage extends StatefulWidget {
  final String itemname;
  const SearchRestuarentPage({super.key, required this.itemname});

  @override
  State<SearchRestuarentPage> createState() => _SearchRestuarentPageState();
}

class _SearchRestuarentPageState extends State<SearchRestuarentPage> {
  ScrollController controller = ScrollController();
  bool? ismoreloading;
  int data = 1;
  int datalimit = 15;
  List<SearchRestuarentModal> allsearchdata = [];
  List<SearchRestuarentModal> searchres_data = [];
  @override
  void initState() {
    super.initState();
    context.read<SearchRestuarentCubit>().getsearchdata(
        itemname: widget.itemname,
        page: 1,
        isMoredata: true,
        datalimit: datalimit);

    controller.addListener(() {
      if (controller.position.pixels == controller.position.maxScrollExtent) {
        if (ismoreloading == false) {
          log('Item reach its limit');
        } else {
          setState(() {
            data = data + 1;
            datalimit = datalimit + 15;
          });
          log(data.toString());
          context.read<SearchRestuarentCubit>().getsearchdata(
              itemname: widget.itemname,
              page: data,
              isMoredata: true,
              datalimit: datalimit);

          log('reach buttom');
        }
      }
    });
  }

  List seachitems = [
    'Sort by',
    'Store types',
    'Cuisiness',
    'Free delivery',
    'Halal',
    'Promo'
  ];

  @override
  Widget build(BuildContext context) {
    final searchdata = context.watch<SearchRestuarentCubit>().state;
    ismoreloading = searchdata.isloading;
    allsearchdata = searchdata.searchdata;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 15,
              child: Material(
                elevation: 5,
                child: Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, top: 40, bottom: 23),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.arrow_back_ios,
                              size: 20,
                            ),
                            const SizedBox(
                              width: 120,
                            ),
                            Text(widget.itemname)
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: seachitems.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                      left: 10,
                                      right: index == (seachitems.length - 1)
                                          ? 10
                                          : 0),
                                  child: Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                255, 215, 213, 213),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10,
                                              right: 10,
                                              top: 5,
                                              bottom: 5),
                                          child: Text(seachitems[index]),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        ),
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
                    ListView.builder(
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
                                    SizedBox(
                                      height: 90,
                                      width: 90,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: allsearchdata[index].img == null
                                            ? SizedBox(
                                                height: 90,
                                                width: 90,
                                                child: ClipOval(
                                                  child: Image.asset(
                                                      'assets/images/foodwifi.png',
                                                      color: Colors.white
                                                          .withOpacity(0.2),
                                                      colorBlendMode:
                                                          BlendMode.modulate),
                                                ),
                                              )
                                            : Image.network(
                                                'https://globizs.sgp1.cdn.digitaloceanspaces.com/foodwifi/${allsearchdata[index].img}'),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15),
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
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 2),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    allsearchdata[index].time,
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
                                                    allsearchdata[index]
                                                        .distance,
                                                    style: GoogleFonts.kreon(
                                                        color: const Color
                                                                .fromARGB(
                                                            221, 60, 60, 60),
                                                        fontSize: 12),
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
                                                            221, 60, 60, 60)),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Text(
                                              allsearchdata[index].description,
                                              style: GoogleFonts.kreon(
                                                  fontSize: 12,
                                                  color: const Color.fromARGB(
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
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: allsearchdata[index].items.length,
                                  itemBuilder: (context, itemindex) {
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15,
                                          right: 15,
                                          top: 15,
                                          bottom: 5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
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
                                                  style: GoogleFonts.kreon(
                                                      fontSize: 16,
                                                      letterSpacing: 0.7),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(allsearchdata[index]
                                                  .items[itemindex]
                                                  .price
                                                  .toString())
                                            ],
                                          ),
                                          SizedBox(
                                            height: 50,
                                            width: 50,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: allsearchdata[index]
                                                          .items[itemindex]
                                                          .image ==
                                                      null
                                                  ? SizedBox(
                                                      height: 50,
                                                      width: 50,
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
                                                      'https://globizs.sgp1.cdn.digitaloceanspaces.com/foodwifi/${allsearchdata[index].items[itemindex].image}'),
                                            ),
                                          )
                                        ],
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
                      child: ismoreloading!
                          ? Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
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
