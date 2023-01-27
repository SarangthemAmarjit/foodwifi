import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodwifi/model/allbelowmodel.dart';
import 'package:foodwifi/refactor/reviewlistpage.dart';
import 'package:foodwifi/router/router.gr.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;

class ProductListPage extends StatefulWidget {
  final int nameindex;
  final String id;

  final List<ReviewModalModified?> allbelowdata;
  const ProductListPage({
    super.key,
    required this.allbelowdata,
    required this.nameindex,
    required this.id,
  });

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Container(
            color: Colors.white,
            child: ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.allbelowdata[widget.nameindex]!.categoryName,
                    style: GoogleFonts.kreon(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: widget
                          .allbelowdata[widget.nameindex]!.products.length,
                      shrinkWrap: true,
                      itemBuilder: ((context, itemindex) {
                        return InkWell(
                          onTap: () {
                            log('item pressed');
                            context.router.push(ProductDetailRoute(
                              product: widget.allbelowdata[widget.nameindex]!
                                  .products[itemindex],
                            ));
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Stack(
                                alignment: Alignment.topRight,
                                children: [
                                  widget.allbelowdata[widget.nameindex]!
                                          .products[itemindex].img
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
                                                  'https://globizs.sgp1.cdn.digitaloceanspaces.com/foodwifi/${widget.allbelowdata[widget.nameindex]!.products[itemindex].img}')),
                                        ),
                                  Padding(
                                    padding: const EdgeInsets.all(1),
                                    child: Image.asset(
                                      widget.allbelowdata[widget.nameindex]!
                                                  .products[itemindex].type ==
                                              'non_veg'
                                          ? 'assets/images/nonvegok.png'
                                          : 'assets/images/veg.png',
                                      height: 17,
                                      width: 17,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 84,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(widget
                                              .allbelowdata[widget.nameindex]!
                                              .products[itemindex]
                                              .name!),
                                          SizedBox(
                                            width: 210,
                                            child: Text(
                                              widget
                                                  .allbelowdata[
                                                      widget.nameindex]!
                                                  .products[itemindex]
                                                  .description!,
                                              style: GoogleFonts.kreon(
                                                  fontSize: 14),
                                            ),
                                          ),
                                        ],
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
                                                  widget
                                                      .allbelowdata[
                                                          widget.nameindex]!
                                                      .products[itemindex]
                                                      .price
                                                      .toString(),
                                                  style: const TextStyle(
                                                      decoration: TextDecoration
                                                          .lineThrough),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  '₹${widget.allbelowdata[widget.nameindex]!.products[itemindex].offer!.offerPrice.toString()}',
                                                  style: GoogleFonts.kreon(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
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
                                                            widget
                                                                .allbelowdata[widget
                                                                    .nameindex]!
                                                                .products[
                                                                    itemindex]
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
                              ),
                            ],
                          ),
                        );
                      }),
                      separatorBuilder: (BuildContext context, int index) {
                        return const Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Divider(
                            thickness: 1,
                            color: Color.fromARGB(255, 224, 223, 223),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        widget.allbelowdata[widget.nameindex]!.reviewdata == null
            ? const SizedBox()
            : ReviewPage(
                reviewdata: widget.allbelowdata[widget.nameindex]!.reviewdata!,
                id: widget.id,
              )
      ],
    );
  }
}
