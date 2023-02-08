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
import 'package:foodwifi/refactor/topbelowpage.dart';

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
                                              log('lenght is greater than 2');

                                              setState(() {
                                                isitemfound = true;
                                              });

                                              FocusScopeNode currentFocus =
                                                  FocusScope.of(context);

                                              if (!currentFocus
                                                  .hasPrimaryFocus) {
                                                currentFocus.unfocus();
                                              }
                                            }
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
              child: newdata(
                  isitemfound: isitemfound!,
                  controller: controller,
                  finaltopdata: finaltopdata),
            )
          ],
        )),
      ),
    );
  }
}

class newdata extends StatefulWidget {
  const newdata({
    super.key,
    required this.isitemfound,
    required this.controller,
    required this.finaltopdata,
  });

  final bool isitemfound;
  final TextEditingController? controller;
  final TopSearchModal? finaltopdata;

  @override
  State<newdata> createState() => _newdataState();
}

class _newdataState extends State<newdata> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    log('coming this page');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.isitemfound
          ? SearchRestuarentPage(
              itemname: widget.controller!.text,
              issearchfoud: true,
            )
          : TopbelowPage(finaltopdata: widget.finaltopdata),
    );
  }
}
