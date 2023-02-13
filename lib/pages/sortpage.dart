import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodwifi/logic/topsearch/cubit/top_search_cubit.dart';
import 'package:foodwifi/model/searchfiltermodal.dart';
import 'package:foodwifi/pages/topsearch.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:string_2_icon/string_2_icon.dart';

class SortPage extends StatefulWidget {
  final String selectedindexforsort;
  final String title;
  final String itemname;
  final String checkname;
  final String cuisinesid;
  final String storetypeid;

  const SortPage({
    super.key,
    required this.title,
    required this.itemname,
    required this.checkname,
    required this.cuisinesid,
    required this.storetypeid,
    required this.selectedindexforsort,
  });

  @override
  State<SortPage> createState() => _SortPageState();
}

class _SortPageState extends State<SortPage> {
  List<SortOption>? sortlist;
  int? _selectedIndex;
  bool? issearch;
  String sortby = '';
  bool? isreset;

  @override
  void initState() {
    super.initState();
    issearch = false;
    isreset = false;
    if (widget.selectedindexforsort.isNotEmpty) {
      setState(() {
        _selectedIndex = int.parse(widget.selectedindexforsort) - 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final topdata = context.watch<TopSearchCubit>().state;
    if (topdata.topsearchdata != null) {
      sortlist = topdata.topsearchdata!.sortOptions;
    }

    return issearch!
        ? TopsearchPage(
            itemname: widget.itemname,
            issearchfoud: true,
            cuisinesId: widget.cuisinesid,
            storetypeid: widget.storetypeid,
            checkname: widget.checkname,
            sortby: sortby,
            iscomingfromsort: true,
            searchname: '',
            isreset: false,
          )
        : isreset!
            ? TopsearchPage(
                itemname: widget.itemname,
                issearchfoud: true,
                cuisinesId: '',
                storetypeid: '',
                checkname: '',
                sortby: '',
                iscomingfromsort: true,
                searchname: '',
                isreset: isreset!,
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
                                    const Icon(Icons.reorder_outlined),
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
                                          textStyle: const TextStyle(
                                              letterSpacing: 1)),
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
                            itemCount: sortlist!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  RadioListTile(
                                    controlAffinity:
                                        ListTileControlAffinity.trailing,
                                    visualDensity: const VisualDensity(
                                      horizontal: VisualDensity.minimumDensity,
                                      vertical: VisualDensity.minimumDensity,
                                    ),
                                    dense: true,
                                    activeColor:
                                        const Color.fromARGB(255, 236, 28, 60),
                                    value: index,
                                    groupValue: _selectedIndex,
                                    title: Row(
                                      children: [
                                        index == 0
                                            ? Icon(
                                                String2Icon
                                                    .getIconDataFromString(
                                                        sortlist![index].icon),
                                                size: 26,
                                              )
                                            : Transform.rotate(
                                                angle: 45,
                                                child: const Icon(
                                                  Icons.navigation_outlined,
                                                  size: 26,
                                                )),
                                        const SizedBox(
                                          width: 40,
                                        ),
                                        Text(
                                          sortlist![index].name,
                                          style:
                                              GoogleFonts.kreon(fontSize: 17),
                                        ),
                                      ],
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedIndex = value;
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
                                      backgroundColor: const Color.fromARGB(
                                          255, 236, 28, 60)),
                                  onPressed: () {
                                    setState(() {
                                      sortby = (_selectedIndex! + 1).toString();
                                      issearch = true;
                                    });
                                  },
                                  child: Text(
                                    'search',
                                    style: GoogleFonts.kreon(
                                        fontSize: 19, color: Colors.white),
                                  ),
                                ),
                              )),
                          widget.checkname.isEmpty
                              ? _selectedIndex == null
                                  ? const SizedBox()
                                  : Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15, right: 15, top: 10),
                                      child: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 40,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.white,
                                              side:
                                                  const BorderSide(width: 0.7)),
                                          onPressed: () {
                                            setState(() {
                                              isreset = true;
                                            });
                                          },
                                          child: Text(
                                            'Reset Filters',
                                            style: GoogleFonts.kreon(
                                                fontSize: 19,
                                                color: Colors.black),
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
                                      onPressed: () {
                                        setState(() {
                                          isreset = true;
                                        });
                                      },
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
