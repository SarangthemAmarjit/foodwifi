import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodwifi/model/belowproductmodel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;

class ProductListPage extends StatelessWidget {
  final List<Productbelowmodel?> allbelowdata;
  const ProductListPage({super.key, required this.allbelowdata});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: allbelowdata.length,
        itemBuilder: ((context, nameindex) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Container(
              color: Colors.white,
              child: ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      allbelowdata[nameindex]!.categoryName!,
                      style: GoogleFonts.kreon(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: allbelowdata[nameindex]!.products!.length,
                        shrinkWrap: true,
                        itemBuilder: ((context, itemindex) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 30),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Stack(
                                  alignment: Alignment.topRight,
                                  children: [
                                    allbelowdata[nameindex]!
                                            .products![itemindex]!
                                            .img
                                            .toString()
                                            .isEmpty
                                        ? SizedBox(
                                            height: 80,
                                            width: 80,
                                            child: ClipOval(
                                              child: Image.asset(
                                                  'assets/images/foodwifi.png',
                                                  color: Colors.white
                                                      .withOpacity(0.2),
                                                  colorBlendMode:
                                                      BlendMode.modulate),
                                            ),
                                          )
                                        : SizedBox(
                                            height: 80,
                                            width: 80,
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                child: Image.network(
                                                    'https://globizs.sgp1.cdn.digitaloceanspaces.com/foodwifi/${allbelowdata[nameindex]!.products![itemindex]!.img}')),
                                          ),
                                    Padding(
                                      padding: const EdgeInsets.all(1),
                                      child: Image.asset(
                                        allbelowdata[nameindex]!
                                                    .products![itemindex]!
                                                    .type ==
                                                'non_veg'
                                            ? 'assets/images/nonvegok.png'
                                            : 'assets/images/veg.png',
                                        height: 17,
                                        width: 17,
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(allbelowdata[nameindex]!
                                          .products![itemindex]!
                                          .name!),
                                      SizedBox(
                                        width: 210,
                                        child: Text(
                                          allbelowdata[nameindex]!
                                              .products![itemindex]!
                                              .description!,
                                          style:
                                              GoogleFonts.kreon(fontSize: 14),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 28,
                                      ),
                                      SizedBox(
                                        width: 240,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  allbelowdata[nameindex]!
                                                      .products![itemindex]!
                                                      .price!
                                                      .toString(),
                                                  style: const TextStyle(
                                                      decoration: TextDecoration
                                                          .lineThrough),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                    '₹${allbelowdata[nameindex]!.products![itemindex]!.offer!.offerPrice.toString()}'),
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(2),
                                                child: Container(
                                                  height: 24,
                                                  color: const Color.fromARGB(
                                                      255, 17, 149, 138),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(2),
                                                    child: Row(
                                                      children: [
                                                        Transform(
                                                          alignment:
                                                              Alignment.center,
                                                          transform:
                                                              Matrix4.rotationY(
                                                                  math.pi),
                                                          child: const FaIcon(
                                                            FontAwesomeIcons
                                                                .tag,
                                                            color: Colors.white,
                                                            size: 14,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 5),
                                                          child: Text(
                                                            allbelowdata[
                                                                    nameindex]!
                                                                .products![
                                                                    itemindex]!
                                                                .offer!
                                                                .description
                                                                .toString(),
                                                            style: GoogleFonts
                                                                .kreon(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        12),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }))
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
