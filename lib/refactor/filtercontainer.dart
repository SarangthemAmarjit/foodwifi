import 'package:flutter/material.dart';
import 'package:foodwifi/refactor/constant.dart';

class FilterContainer extends StatelessWidget {
  final bool issearchfoud;
  final String itemname;
  final String cuisinesId;
  final String storetypeid;

  final String sortby;

  final List seachitems;
  final int index;
  final String sortbyname;
  final String cuisinesname;
  final String storetypename;
  final bool freedeliveryname;
  final bool halalname;
  final bool promoname;
  const FilterContainer(
      {super.key,
      required this.issearchfoud,
      required this.itemname,
      required this.cuisinesId,
      required this.storetypeid,
      required this.sortby,
      required this.seachitems,
      required this.index,
      required this.sortbyname,
      required this.cuisinesname,
      required this.storetypename,
      required this.freedeliveryname,
      required this.halalname,
      required this.promoname});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              color: seachitems[index] == sortbyname
                  ? bordercolor
                  : seachitems[index] == storetypename
                      ? bordercolor
                      : seachitems[index] == cuisinesname
                          ? bordercolor
                          :
                          //freedelivery
                          freedeliveryname
                              ? index == 3
                                  ? bordercolor
                                  : promoname
                                      ? index == 5
                                          ? bordercolor
                                          : halalname
                                              ? index == 4
                                                  ? bordercolor
                                                  : const Color.fromARGB(
                                                      255, 215, 213, 213)
                                              : const Color.fromARGB(
                                                  255, 215, 213, 213)
                                      : halalname
                                          ? index == 4
                                              ? bordercolor
                                              : const Color.fromARGB(
                                                  255, 215, 213, 213)
                                          : const Color.fromARGB(
                                              255, 215, 213, 213)

                              //halal
                              : halalname
                                  ? index == 4
                                      ? bordercolor
                                      : promoname
                                          ? index == 5
                                              ? bordercolor
                                              : freedeliveryname
                                                  ? index == 3
                                                      ? bordercolor
                                                      : const Color.fromARGB(
                                                          255, 215, 213, 213)
                                                  : const Color.fromARGB(
                                                      255, 215, 213, 213)
                                          : freedeliveryname
                                              ? index == 3
                                                  ? bordercolor
                                                  : const Color.fromARGB(
                                                      255, 215, 213, 213)
                                              : const Color.fromARGB(
                                                  255, 215, 213, 213)

                                  //promo
                                  : promoname
                                      ? index == 5
                                          ? bordercolor
                                          : halalname
                                              ? index == 4
                                                  ? bordercolor
                                                  : freedeliveryname
                                                      ? index == 3
                                                          ? bordercolor
                                                          : const Color
                                                                  .fromARGB(255,
                                                              215, 213, 213)
                                                      : const Color.fromARGB(
                                                          255, 215, 213, 213)
                                              : freedeliveryname
                                                  ? index == 3
                                                      ? bordercolor
                                                      : const Color.fromARGB(
                                                          255, 215, 213, 213)
                                                  : const Color.fromARGB(
                                                      255, 215, 213, 213)
                                      : const Color.fromARGB(
                                          255, 215, 213, 213),
              width: 1),
          color: seachitems[index] == sortbyname
              ? const Color.fromARGB(255, 177, 245, 204)
              : seachitems[index] == storetypename
                  ? const Color.fromARGB(255, 177, 245, 204)
                  : seachitems[index] == cuisinesname
                      ? const Color.fromARGB(255, 177, 245, 204)
                      :
                      //freedelivery
                      freedeliveryname
                          ? index == 3
                              ? const Color.fromARGB(255, 177, 245, 204)
                              : promoname
                                  ? index == 5
                                      ? const Color.fromARGB(255, 177, 245, 204)
                                      : halalname
                                          ? index == 4
                                              ? const Color.fromARGB(255, 177, 245, 204)
                                              : const Color.fromARGB(255, 215, 213, 213)
                                          : const Color.fromARGB(255, 215, 213, 213)
                                  : halalname
                                      ? index == 4
                                          ? const Color.fromARGB(255, 177, 245, 204)
                                          : const Color.fromARGB(255, 215, 213, 213)
                                      : const Color.fromARGB(255, 215, 213, 213)

                          //halal
                          : halalname
                              ? index == 4
                                  ? const Color.fromARGB(255, 177, 245, 204)
                                  : promoname
                                      ? index == 5
                                          ? const Color.fromARGB(255, 177, 245, 204)
                                          : freedeliveryname
                                              ? index == 3
                                                  ? const Color.fromARGB(255, 177, 245, 204)
                                                  : const Color.fromARGB(255, 215, 213, 213)
                                              : const Color.fromARGB(255, 215, 213, 213)
                                      : freedeliveryname
                                          ? index == 3
                                              ? const Color.fromARGB(255, 177, 245, 204)
                                              : const Color.fromARGB(255, 215, 213, 213)
                                          : const Color.fromARGB(255, 215, 213, 213)

                              //promo
                              : promoname
                                  ? index == 5
                                      ? const Color.fromARGB(255, 177, 245, 204)
                                      : halalname
                                          ? index == 4
                                              ? const Color.fromARGB(255, 177, 245, 204)
                                              : freedeliveryname
                                                  ? index == 3
                                                      ? const Color.fromARGB(255, 177, 245, 204)
                                                      : const Color.fromARGB(255, 215, 213, 213)
                                                  : const Color.fromARGB(255, 215, 213, 213)
                                          : freedeliveryname
                                              ? index == 3
                                                  ? const Color.fromARGB(255, 177, 245, 204)
                                                  : const Color.fromARGB(255, 215, 213, 213)
                                              : const Color.fromARGB(255, 215, 213, 213)
                                  : const Color.fromARGB(255, 215, 213, 213),
          borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
        child: Text(seachitems[index]),
      ),
    );
  }
}
