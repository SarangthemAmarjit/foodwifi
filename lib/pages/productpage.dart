import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodwifi/logic/belowproduct/cubit/below_product_cubit_cubit.dart';
import 'package:foodwifi/logic/upperproduct/cubit/upperproduct_cubit_cubit.dart';
import 'package:foodwifi/model/belowproductmodel.dart';
import 'package:foodwifi/model/upperproductmodel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ProductPage extends StatefulWidget {
  final String id;
  const ProductPage({
    super.key,
    required this.id,
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
      if (controller.hasClients && controller.offset > 330) {
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
    final belowdata = context.watch<BelowProductCubitCubit>().state;
    List<Productbelowmodel?> allbelowdata = belowdata.alldata;

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
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 15, left: 15, right: 15),
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
                            Switch(
                              onChanged: toggleSwitch,
                              value: isSwitched,
                              activeColor: Colors.greenAccent[400],
                              activeTrackColor: Colors.greenAccent,
                              inactiveThumbColor: Colors.white,
                              inactiveTrackColor: Colors.grey,
                            ),
                            SizedBox(
                              height: double.maxFinite,
                              child: Column(
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      child: ListView.builder(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount: allbelowdata.length,
                                          itemBuilder: ((context, nameindex) {
                                            return Container(
                                              child: ListTile(
                                                title: Column(
                                                  children: [
                                                    Text(
                                                        allbelowdata[nameindex]!
                                                            .categoryName!),
                                                    ListView.builder(
                                                        physics:
                                                            const NeverScrollableScrollPhysics(),
                                                        itemCount: allbelowdata[
                                                                nameindex]!
                                                            .products!
                                                            .length,
                                                        shrinkWrap: true,
                                                        itemBuilder: ((context,
                                                            itemindex) {
                                                          return ListTile(
                                                            title: Text(allbelowdata[
                                                                    nameindex]!
                                                                .products![
                                                                    itemindex]!
                                                                .name!),
                                                          );
                                                        }))
                                                  ],
                                                ),
                                              ),
                                            );
                                          })),
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
                  showappbar
                      ? Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.white,
                        )
                      : const SizedBox()
                ],
              ));
  }
}
