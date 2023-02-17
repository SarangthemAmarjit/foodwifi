import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodwifi/model/model.dart';
import 'package:foodwifi/refactor/skeleton.dart';
import 'package:foodwifi/router/router.gr.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;

class ThirdRowList extends StatelessWidget {
  final List<List<Item?>> firstlistitems;

  const ThirdRowList({super.key, required this.firstlistitems});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: SizedBox(
        height: 280,
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(left: 15, top: 25),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 3),
                      child: Text(
                        'Offers For You',
                        style: GoogleFonts.kreon(fontSize: 20),
                      ),
                    ),
                    const Icon(
                      FontAwesomeIcons.circleArrowRight,
                      size: 17,
                      color: Color.fromARGB(255, 195, 193, 193),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                width: double.maxFinite,
                height: 280,
                child: firstlistitems.isEmpty
                    ? const Skeleton(
                        height: 280,
                      )
                    : ListView.builder(
                        controller: PageController(viewportFraction: 0.67),
                        scrollDirection: Axis.horizontal,
                        physics: const PageScrollPhysics()
                            .applyTo(const BouncingScrollPhysics()),
                        itemCount: firstlistitems[1].length,
                        itemBuilder: ((
                          context,
                          index,
                        ) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 10, left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 12,
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: SizedBox(
                                      width: 240,
                                      height: 130,
                                      child: Stack(
                                        fit: StackFit.expand,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              context.router.push(ProductRoute(
                                                id: firstlistitems[1][index]!
                                                    .id
                                                    .toString(),
                                                itemname: firstlistitems[1]
                                                        [index]!
                                                    .title!,
                                                iscomingfromsearch: false,
                                                index: 0,
                                              ));
                                            },
                                            child: CachedNetworkImage(
                                              fadeInDuration:
                                                  const Duration(seconds: 1),
                                              imageUrl:
                                                  'https://globizs.sgp1.cdn.digitaloceanspaces.com/foodwifi/${firstlistitems[1][index]!.img!}',
                                              fit: BoxFit.cover,
                                              progressIndicatorBuilder:
                                                  (context, url,
                                                          downloadProgress) =>
                                                      const Skeleton(
                                                height: 130,
                                              ),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      const Icon(Icons.error),
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              firstlistitems[1][index]!
                                                      .offerDescription!
                                                      .isEmpty
                                                  ? const SizedBox()
                                                  : Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(2),
                                                        child: Container(
                                                          width: 135,
                                                          height: 24,
                                                          color: const Color
                                                                  .fromARGB(255,
                                                              17, 149, 138),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(2),
                                                            child: Row(
                                                              children: [
                                                                Transform(
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  transform: Matrix4
                                                                      .rotationY(
                                                                          math.pi),
                                                                  child:
                                                                      const FaIcon(
                                                                    FontAwesomeIcons
                                                                        .tag,
                                                                    color: Colors
                                                                        .white,
                                                                    size: 14,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      left: 5),
                                                                  child: Text(
                                                                    firstlistitems[1]
                                                                            [
                                                                            index]!
                                                                        .offerDescription!,
                                                                    style: GoogleFonts.kreon(
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                            ],
                                          )
                                        ],
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 7),
                                  child: Text(
                                    firstlistitems[1][index]!.title!,
                                    style: GoogleFonts.kreon(fontSize: 12),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    firstlistitems[1][index]!.description!,
                                    style: GoogleFonts.kreon(
                                        fontSize: 12,
                                        color: const Color.fromARGB(
                                            255, 148, 144, 144)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        size: 11,
                                        color:
                                            Color.fromARGB(255, 220, 204, 52),
                                      ),
                                      Text(
                                        firstlistitems[1][index]!.rating!,
                                        style: GoogleFonts.kreon(
                                            fontSize: 12,
                                            color: const Color.fromARGB(
                                                221, 60, 60, 60)),
                                      ),
                                      const Padding(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 3),
                                        child: Icon(
                                          Icons.circle,
                                          size: 2,
                                        ),
                                      ),
                                      Text(
                                        firstlistitems[1][index]!.time!,
                                        style: GoogleFonts.kreon(
                                            fontSize: 12,
                                            color: const Color.fromARGB(
                                                221, 60, 60, 60)),
                                      ),
                                      const Padding(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 3),
                                        child: Icon(
                                          Icons.circle,
                                          size: 2,
                                        ),
                                      ),
                                      Text(
                                        firstlistitems[1][index]!.distance!,
                                        style: GoogleFonts.kreon(
                                            fontSize: 12,
                                            color: const Color.fromARGB(
                                                221, 60, 60, 60)),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
