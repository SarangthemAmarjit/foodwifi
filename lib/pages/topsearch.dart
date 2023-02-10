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
import 'package:google_fonts/google_fonts.dart';

class TopsearchPage extends StatefulWidget {
  late String searchname;
  TopsearchPage({super.key, required this.searchname});

  @override
  State<TopsearchPage> createState() => _TopsearchPageState();
}

class _TopsearchPageState extends State<TopsearchPage> {
  TextEditingController? controller;
  List<List<Item?>> firstlistitems = [];
  bool? isitemfound;
  int itemlength = 0;
  bool isvisible = true;
  bool isitemfound2 = false;
  String cuisindata = '';
  String storetypeid = '';
  String checkname = '';

  final _formKey = GlobalKey<FormState>();
  TopSearchModal? finaltopdata;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TextEditingController();
    isitemfound = false;

    setState(() {
      controller!.text = widget.searchname;
    });
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

    return GestureDetector(
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
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, bottom: 5),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: InkWell(
                              onTap: () {
                                context.router.pop();
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
                                  color:
                                      const Color.fromARGB(255, 246, 242, 242),
                                ),
                                child: Row(
                                  children: [
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(left: 15, right: 20),
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

                                            if (!currentFocus.hasPrimaryFocus) {
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
                                          autofocus: true,
                                          controller: controller,
                                          decoration:
                                              const InputDecoration.collapsed(
                                                  hintText:
                                                      "What are you craving?"),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
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
                          checkname: checkname,
                        )
                      : Visibility(
                          replacement: SearchRestuarentPage(
                            itemname: controller!.text,
                            issearchfoud: true,
                            cuisinesId: cuisindata,
                            storetypeid: storetypeid,
                            checkname: checkname,
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
                                                padding: const EdgeInsets.only(
                                                    left: 20),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    ListView.builder(
                                                        shrinkWrap: true,
                                                        itemCount: finaltopdata!
                                                            .cuisines.length,
                                                        itemBuilder:
                                                            (context, index) {
                                                          return InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                isitemfound =
                                                                    true;

                                                                cuisindata =
                                                                    finaltopdata!
                                                                        .cuisines[
                                                                            index]
                                                                        .id
                                                                        .toString();
                                                                checkname =
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
                                                                  style: GoogleFonts
                                                                      .kreon(
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
                                                padding: const EdgeInsets.only(
                                                    left: 20),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    ListView.builder(
                                                        shrinkWrap: true,
                                                        itemCount: finaltopdata!
                                                            .storeTypes.length,
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
                                                                checkname =
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
                                                                  style: GoogleFonts
                                                                      .kreon(
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
