import 'package:flutter/material.dart';
import 'package:foodwifi/refactor/constant.dart';

class FilterContainer extends StatelessWidget {
  final bool issearchfoud;
  final String itemname;
  final String cuisinesId;
  final String storetypeid;
  final String checkname;
  final String sortby;
  final bool issortbypress;
  final bool isreset;
  final List seachitems;
  final int index;
  const FilterContainer(
      {super.key,
      required this.issearchfoud,
      required this.itemname,
      required this.cuisinesId,
      required this.storetypeid,
      required this.checkname,
      required this.sortby,
      required this.issortbypress,
      required this.isreset,
      required this.seachitems,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              color: issortbypress
                  ? isreset
                      ? const Color.fromARGB(255, 215, 213, 213)
                      : storetypeid.isEmpty
                          ? index == 0
                              ? bordercolor
                              : seachitems[index] == checkname
                                  ? bordercolor
                                  : const Color.fromARGB(255, 215, 213, 213)
                          : const Color.fromARGB(255, 215, 213, 213)
                  : seachitems[index] == checkname
                      ? bordercolor
                      : const Color.fromARGB(255, 215, 213, 213),
              width: 1),
          color: issortbypress
              ? isreset
                  ? const Color.fromARGB(255, 215, 213, 213)
                  : storetypeid.isEmpty
                      ? index == 0
                          ? const Color.fromARGB(255, 177, 245, 204)
                          : seachitems[index] == checkname
                              ? const Color.fromARGB(255, 177, 245, 204)
                              : const Color.fromARGB(255, 215, 213, 213)
                      : const Color.fromARGB(255, 215, 213, 213)
              : seachitems[index] == checkname
                  ? const Color.fromARGB(255, 177, 245, 204)
                  : const Color.fromARGB(255, 215, 213, 213),
          borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
        child: Text(seachitems[index]),
      ),
    );
  }
}
