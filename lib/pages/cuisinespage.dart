import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodwifi/logic/topsearch/cubit/top_search_cubit.dart';
import 'package:foodwifi/model/searchfiltermodal.dart';
import 'package:foodwifi/pages/topsearch.dart';
import 'package:google_fonts/google_fonts.dart';

class CuisinesPage extends StatefulWidget {
  final String title;
  final String itemname;
  final List cuisinesitems;
  final String cuisinesid;
  final String storetypeid;
  final String sortbyname;
  final String cuisinesname;
  final String storetypename;
  final bool freedeliveryname;
  final bool halalname;
  final bool promoname;
  final Map cuisinesidwithname;

  const CuisinesPage({
    super.key,
    required this.title,
    required this.itemname,
    required this.cuisinesid,
    required this.storetypeid,
    required this.sortbyname,
    required this.cuisinesname,
    required this.storetypename,
    required this.freedeliveryname,
    required this.halalname,
    required this.promoname,
    required this.cuisinesitems,
    required this.cuisinesidwithname,
  });

  @override
  State<CuisinesPage> createState() => _SortPageState();
}

class _SortPageState extends State<CuisinesPage> {
  List<Cuisine>? cuisines;

  int? _selectedIndex;
  bool? issearch;
  Map<String, bool> values = {};
  String allcuisines = '';

  @override
  void initState() {
    super.initState();
    issearch = false;
    log('coming Cuisines Page');

    if (widget.cuisinesid.isNotEmpty) {
      log('not empty');
      log(widget.cuisinesid.toString());
      for (var element in widget.cuisinesitems) {
        log(widget.cuisinesidwithname[element].toString());
        if (widget.cuisinesidwithname[element].toString() ==
            widget.cuisinesid) {
          log('true');
          values[element] = true;
        } else {
          values[element] = false;
        }
      }
    } else {
      for (var element in widget.cuisinesitems) {
        values[element] = false;
      }
    }
  }

  var tmpArray = [];

  getCheckboxItems() {
    values.forEach((key, value) {
      if (value == true) {
        tmpArray.add(widget.cuisinesidwithname[key]);
      }
    });

    setState(() {
      allcuisines = tmpArray.join(', ');
    });
    log(allcuisines.toString());
  }

  @override
  Widget build(BuildContext context) {
    final topdata = context.watch<TopSearchCubit>().state;
    if (topdata.topsearchdata != null) {
      cuisines = topdata.topsearchdata!.cuisines;

      log(values.toString());
    }

    return issearch!
        ? TopsearchPage(
            cuisinesname: widget.cuisinesname,
            freedeliveryname: widget.freedeliveryname,
            halalname: widget.halalname,
            promoname: widget.promoname,
            sortbyname: widget.sortbyname,
            storetypename: widget.storetypename,
            sortby: '',
            itemname: widget.itemname,
            issearchfoud: true,
            cuisinesId: widget.cuisinesid,
            storetypeid: widget.storetypeid,
            iscomingfromsort: true,
            searchname: '',
            selectedindexforstoretype: _selectedIndex,
            ischecked: true,
            allcuisines: allcuisines,
            freedeliveryid: '',
            halalid: '',
            promoid: '',
          )
        : Scaffold(
            body: SafeArea(
                child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 15, 25, 7),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.restaurant_menu_outlined,
                                  size: 25,
                                  color: Color.fromARGB(255, 120, 120, 120),
                                ),
                                const SizedBox(
                                  width: 38,
                                ),
                                Text(
                                  widget.title,
                                  style: GoogleFonts.kreon(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: const Color.fromARGB(
                                          255, 124, 123, 123),
                                      textStyle:
                                          const TextStyle(letterSpacing: 1)),
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                context.router.pop();
                              },
                              child: const CircleAvatar(
                                backgroundColor: Colors.grey,
                                radius: 12,
                                child: Icon(
                                  Icons.close,
                                  size: 16,
                                  color: Colors.white,
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
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: cuisines!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              CheckboxListTile(
                                activeColor:
                                    const Color.fromARGB(255, 236, 28, 60),
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                visualDensity: const VisualDensity(
                                  horizontal: VisualDensity.minimumDensity,
                                  vertical: VisualDensity.minimumDensity,
                                ),
                                dense: true,
                                checkColor: Colors.white,
                                value: values[widget.cuisinesitems[index]],
                                title: Row(
                                  children: [
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      cuisines![index].cuisineName,
                                      style: GoogleFonts.kreon(fontSize: 17),
                                    ),
                                  ],
                                ),
                                onChanged: (value) {
                                  log('Changes');
                                  setState(() {
                                    values[widget.cuisinesitems[index]] =
                                        value!;
                                  });
                                },
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 82),
                                child: Divider(
                                  thickness: 1,
                                  color: Color.fromARGB(255, 218, 218, 218),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 20),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 40,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 236, 28, 60)),
                              onPressed: () {
                                setState(() {
                                  issearch = true;
                                  getCheckboxItems();
                                });
                              },
                              child: Text(
                                'search',
                                style: GoogleFonts.kreon(
                                    fontSize: 19, color: Colors.white),
                              ),
                            ),
                          )),
                      widget.storetypename.isEmpty &&
                              widget.sortbyname.isEmpty &&
                              widget.cuisinesname.isEmpty
                          ? _selectedIndex == null
                              ? const SizedBox()
                              : Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15, top: 10),
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    height: 40,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white,
                                          side: const BorderSide(width: 0.7)),
                                      onPressed: () {
                                        setState(() {});
                                      },
                                      child: Text(
                                        'Reset Filters',
                                        style: GoogleFonts.kreon(
                                            fontSize: 19, color: Colors.black),
                                      ),
                                    ),
                                  ))
                          : Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, top: 10),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: 40,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      side: const BorderSide(width: 0.7)),
                                  onPressed: () {},
                                  child: Text(
                                    'Reset Filters',
                                    style: GoogleFonts.kreon(
                                        fontSize: 19, color: Colors.black),
                                  ),
                                ),
                              )),
                    ],
                  ),
                ],
              ),
            )),
          );
  }
}
