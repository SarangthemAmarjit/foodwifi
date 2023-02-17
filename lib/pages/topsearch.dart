import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodwifi/logic/fetchdata/cubit/fetchdatabloc_cubit.dart';
import 'package:foodwifi/logic/topsearch/cubit/top_search_cubit.dart';
import 'package:foodwifi/model/model.dart';
import 'package:foodwifi/model/searchfiltermodal.dart';
import 'package:foodwifi/pages/searchrestuarent.dart';
import 'package:foodwifi/refactor/skeleton.dart';
import 'package:foodwifi/router/router.gr.dart';
import 'package:google_fonts/google_fonts.dart';

class TopsearchPage extends StatefulWidget {
  late String searchname;
  final bool issearchfoud;
  final String itemname;
  final String cuisinesId;
  final String storetypeid;
  final String sortbyname;
  final String cuisinesname;
  final String storetypename;
  final bool freedeliveryname;
  final bool halalname;
  final bool promoname;
  final String? sortby;
  final bool iscomingfromsort;
  final int? selectedindexforstoretype;
  final bool ischecked;
  final String allcuisines;
  final String freedeliveryid;
  final String halalid;
  final String promoid;

  TopsearchPage({
    super.key,
    required this.searchname,
    required this.issearchfoud,
    required this.itemname,
    required this.cuisinesId,
    required this.storetypeid,
    this.sortby,
    required this.sortbyname,
    required this.cuisinesname,
    required this.storetypename,
    required this.freedeliveryname,
    required this.halalname,
    required this.promoname,
    required this.iscomingfromsort,
    this.selectedindexforstoretype,
    required this.ischecked,
    required this.allcuisines,
    required this.freedeliveryid,
    required this.halalid,
    required this.promoid,
  });

  @override
  State<TopsearchPage> createState() => _TopsearchPageState();
}

class _TopsearchPageState extends State<TopsearchPage> {
  TextEditingController? controller;
  List<List<Item?>> firstlistitems = [];
  bool? isitemfound;
  int itemlength = 0;
  bool isvisible = true;
  bool? issortbypressed;
  bool isitemfound2 = false;
  String cuisindata = '';
  String storetypeid = '';
  String sortby = '';
  String sortname = '';
  String storename = '';
  String cuisinename = '';
  bool freedeliveryname = false;
  bool halalname = false;
  bool promoname = false;
  String freedeliveryid = '';
  String halalid = '';
  String promoid = '';

  final _formKey = GlobalKey<FormState>();
  TopSearchModal? finaltopdata;
  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    isitemfound = false;
    if (widget.iscomingfromsort) {
      log('True');

      setState(() {
        controller!.text = widget.itemname;
        cuisindata = widget.cuisinesId;
        storetypeid = widget.storetypeid;
        sortname = widget.sortbyname;
        storename = widget.storetypename;
        cuisinename = widget.cuisinesname;
        freedeliveryname = widget.freedeliveryname;
        halalname = widget.halalname;
        promoname = widget.promoname;
        sortby = widget.sortby == null ? '' : widget.sortby!;
        isitemfound = widget.iscomingfromsort;
        isitemfound2 = true;
        issortbypressed = true;
        freedeliveryid = widget.freedeliveryid;
        halalid = widget.halalid;
        promoid = widget.promoid;
      });
    } else {
      setState(() {
        controller!.text = widget.searchname;
        issortbypressed = false;
      });
    }

    context.read<TopSearchCubit>().gettopsearchdata();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final topdata = context.watch<TopSearchCubit>().state;
    finaltopdata = topdata.topsearchdata;
    final data = context.watch<FetchdatablocCubit>().state;

    firstlistitems = data.firstlistitems;
    Future<bool> showExitPopup() async {
      context.router
          .pushAndPopUntil(const HomeRoute(), predicate: (_) => false);
      return true;
    }

    return WillPopScope(
      onWillPop: showExitPopup,
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: SafeArea(
              child: Column(
            children: [
              Expanded(
                flex: 11,
                child: Container(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, bottom: 5),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: InkWell(
                                onTap: () {
                                  context.router.pushAndPopUntil(
                                      const HomeRoute(),
                                      predicate: (_) => false);
                                },
                                child: const Icon(
                                  Icons.arrow_back_ios_new,
                                  size: 20,
                                ),
                              ),
                            ),
                            Flexible(
                              child: Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: const Color.fromARGB(
                                        255, 246, 242, 242),
                                  ),
                                  child: Row(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(
                                            left: 15, right: 20),
                                        child: FaIcon(
                                          FontAwesomeIcons.magnifyingGlass,
                                          size: 17,
                                        ),
                                      ),
                                      Flexible(
                                        child: Container(
                                          child: TextFormField(
                                            textInputAction:
                                                TextInputAction.search,
                                            onEditingComplete: () {
                                              setState(() {
                                                isitemfound = true;
                                              });
                                              FocusScopeNode currentFocus =
                                                  FocusScope.of(context);

                                              if (!currentFocus
                                                  .hasPrimaryFocus) {
                                                currentFocus.unfocus();
                                              }
                                            },
                                            onChanged: (value) {
                                              if (value.length > 2) {
                                                log('length is greater than 2');

                                                setState(() {
                                                  isitemfound = !isitemfound!;
                                                  isvisible = false;
                                                  isitemfound2 = isitemfound!;
                                                });
                                                log(itemlength.toString());
                                                log(' From onchange${controller!.text}');

                                                FocusScopeNode currentFocus =
                                                    FocusScope.of(context);

                                                if (!currentFocus
                                                    .hasPrimaryFocus) {
                                                  currentFocus.unfocus();
                                                }
                                              }
                                            },
                                            onTap: () {
                                              setState(() {
                                                isitemfound = isitemfound2;
                                              });
                                            },
                                            autofocus: widget.iscomingfromsort
                                                ? false
                                                : true,
                                            controller: controller,
                                            decoration: const InputDecoration
                                                    .collapsed(
                                                hintText:
                                                    "What are you craving?"),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              controller!.text = '';
                                            });
                                          },
                                          child: const Icon(
                                            Icons.close,
                                            size: 22,
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                  flex: 110,
                  child: Container(
                    child: isitemfound!
                        ? SearchRestuarentPage(
                            itemname: controller!.text,
                            issearchfoud: true,
                            cuisinesId: cuisindata,
                            storetypeid: storetypeid,
                            sortby: sortby,
                            cuisinesname: cuisinename,
                            freedeliveryname: freedeliveryname,
                            halalname: halalname,
                            promoname: promoname,
                            sortbyname: sortname,
                            storetypename: storename,
                            selectedindexforstoretype:
                                widget.selectedindexforstoretype,
                            ischecked: widget.ischecked,
                            allcuisinese: widget.allcuisines,
                            freedeliveryid: freedeliveryid,
                            halalid: halalid,
                            promoid: promoid,
                          )
                        : Visibility(
                            replacement: SearchRestuarentPage(
                              cuisinesname: cuisinename,
                              freedeliveryname: freedeliveryname,
                              halalname: halalname,
                              promoname: promoname,
                              sortbyname: sortname,
                              storetypename: storename,
                              itemname: controller!.text,
                              issearchfoud: true,
                              cuisinesId: cuisindata,
                              storetypeid: storetypeid,
                              sortby: sortby,
                              selectedindexforstoretype:
                                  widget.selectedindexforstoretype,
                              ischecked: widget.ischecked,
                              allcuisinese: widget.allcuisines,
                              freedeliveryid: freedeliveryid,
                              halalid: halalid,
                              promoid: promoid,
                            ),
                            visible: isvisible,
                            child: Container(
                              child: Column(
                                children: [
                                  const Divider(
                                    color: Color.fromARGB(255, 246, 242, 242),
                                    thickness: 5,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Cuisines',
                                          style: GoogleFonts.kreon(
                                              color: Colors.red,
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          width: 130,
                                        ),
                                        Text('Store types',
                                            style: GoogleFonts.kreon(
                                                color: Colors.red,
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                  ),
                                  finaltopdata == null
                                      ? Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20, right: 20),
                                          child: Column(
                                            children: const [
                                              Skeleton(
                                                height: 40,
                                                radius: 0,
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Skeleton(
                                                height: 40,
                                                radius: 0,
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Skeleton(
                                                height: 40,
                                                radius: 0,
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Skeleton(
                                                height: 40,
                                                radius: 0,
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Skeleton(
                                                height: 40,
                                                radius: 0,
                                              )
                                            ],
                                          ),
                                        )
                                      : Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 20),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                      ListView.builder(
                                                          shrinkWrap: true,
                                                          itemCount:
                                                              finaltopdata!
                                                                  .cuisines
                                                                  .length,
                                                          itemBuilder:
                                                              (context, index) {
                                                            return InkWell(
                                                              onTap: () {
                                                                setState(() {
                                                                  isitemfound =
                                                                      true;
                                                                  isitemfound2 =
                                                                      true;

                                                                  cuisindata = finaltopdata!
                                                                      .cuisines[
                                                                          index]
                                                                      .id
                                                                      .toString();
                                                                  cuisinename =
                                                                      'Cuisines';
                                                                });
                                                                FocusScopeNode
                                                                    currentFocus =
                                                                    FocusScope.of(
                                                                        context);

                                                                if (!currentFocus
                                                                    .hasPrimaryFocus) {
                                                                  currentFocus
                                                                      .unfocus();
                                                                }
                                                              },
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        bottom:
                                                                            20),
                                                                child: Text(
                                                                    finaltopdata!
                                                                        .cuisines[
                                                                            index]
                                                                        .cuisineName,
                                                                    style: GoogleFonts.kreon(
                                                                        fontSize:
                                                                            20)),
                                                              ),
                                                            );
                                                          }),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 20),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                      ListView.builder(
                                                          shrinkWrap: true,
                                                          itemCount:
                                                              finaltopdata!
                                                                  .storeTypes
                                                                  .length,
                                                          itemBuilder:
                                                              (context, index) {
                                                            return InkWell(
                                                              onTap: () {
                                                                setState(() {
                                                                  isitemfound =
                                                                      true;
                                                                  storetypeid = finaltopdata!
                                                                      .storeTypes[
                                                                          index]
                                                                      .id
                                                                      .toString();
                                                                  storename =
                                                                      'Store types';
                                                                });
                                                                FocusScopeNode
                                                                    currentFocus =
                                                                    FocusScope.of(
                                                                        context);

                                                                if (!currentFocus
                                                                    .hasPrimaryFocus) {
                                                                  currentFocus
                                                                      .unfocus();
                                                                }
                                                              },
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        bottom:
                                                                            20),
                                                                child: Text(
                                                                    finaltopdata!
                                                                        .storeTypes[
                                                                            index]
                                                                        .name,
                                                                    style: GoogleFonts.kreon(
                                                                        fontSize:
                                                                            20)),
                                                              ),
                                                            );
                                                          }),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                ],
                              ),
                            )),
                  ))
            ],
          )),
        ),
      ),
    );
  }
}

// class newdata extends StatefulWidget {
//   const newdata({
//     super.key,
//     required this.isitemfound,
//     required this.controller,
//     required this.finaltopdata,
//   });

//   final bool isitemfound;
//   final TextEditingController? controller;
//   final TopSearchModal? finaltopdata;

//   @override
//   State<newdata> createState() => _newdataState();
// }

// class _newdataState extends State<newdata> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     log('coming this page');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: widget.isitemfound
//           ? SearchRestuarentPage(
//               itemname: widget.controller!.text,
//               issearchfoud: true,
//             )
//           : TopbelowPage(finaltopdata: widget.finaltopdata),
//     );
//   }
// }
