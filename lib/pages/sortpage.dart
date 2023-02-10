import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodwifi/logic/topsearch/cubit/top_search_cubit.dart';
import 'package:foodwifi/model/searchfiltermodal.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:string_2_icon/string_2_icon.dart';

class SortPage extends StatelessWidget {
  final String title;

  SortPage({
    super.key,
    required this.title,
  });

  int? _selectedIndex;
  @override
  Widget build(BuildContext context) {
    final topdata = context.watch<TopSearchCubit>().state;
    List<SortOption> sortlist = topdata.topsearchdata!.sortOptions;
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.menu),
                    const SizedBox(
                      width: 30,
                    ),
                    Text(
                      title,
                      style: GoogleFonts.kreon(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 124, 123, 123),
                          textStyle: const TextStyle(letterSpacing: 1)),
                    ),
                  ],
                ),
                const CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 13,
                  child: Icon(
                    Icons.close,
                    size: 16,
                    color: Colors.white,
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
            itemCount: sortlist.length,
            itemBuilder: (BuildContext context, int index) {
              return StatefulBuilder(builder: (BuildContext context,
                  void Function(void Function()) setState) {
                return Column(
                  children: [
                    RadioListTile(
                      visualDensity: const VisualDensity(
                        horizontal: VisualDensity.minimumDensity,
                        vertical: VisualDensity.minimumDensity,
                      ),
                      dense: true,
                      activeColor: const Color.fromARGB(255, 236, 28, 60),
                      value: index,
                      groupValue: _selectedIndex,
                      title: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(String2Icon.getIconDataFromString(
                                sortlist[index].icon)),
                            Text(
                              sortlist[index].name,
                              style: GoogleFonts.kreon(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _selectedIndex = value!;
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
              });
            },
          ),
        ],
      )),
    );
  }
}
