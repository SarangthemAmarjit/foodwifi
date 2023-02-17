import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodwifi/model/restuarantlistmodal.dart';
import 'package:foodwifi/refactor/skeleton.dart';
import 'package:foodwifi/router/router.gr.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;

class LastList extends StatelessWidget {
  const LastList({
    Key? key,
    required this.allreslist,
  }) : super(key: key);

  final List<allrestuarantItem> allreslist;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8,
      ),
      child: Column(
        children: [
          SizedBox(
            height: allreslist.length * 322,
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, top: 25),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 3),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Restaurants near you',
                            style: GoogleFonts.kreon(
                                fontSize: 27, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'view all restaurants',
                            style: GoogleFonts.kreon(
                                fontSize: 16,
                                color:
                                    const Color.fromARGB(255, 113, 113, 113)),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.white,
                    height: 280,
                    child: allreslist.isEmpty
                        ? const Skeleton(
                            height: 300,
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: allreslist.length,
                            itemBuilder: ((
                              context,
                              index,
                            ) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    top: 10, left: 15, right: 15, bottom: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: SizedBox(
                                        child: Stack(children: [
                                          InkWell(
                                            onTap: () {
                                              context.router.push(ProductRoute(
                                                id: allreslist[index]
                                                    .id
                                                    .toString(),
                                                itemname:
                                                    allreslist[index].title,
                                                iscomingfromsearch: false,
                                                index: 0,
                                              ));
                                            },
                                            child: CachedNetworkImage(
                                              fadeInDuration:
                                                  const Duration(seconds: 1),
                                              imageUrl:
                                                  'https://globizs.sgp1.cdn.digitaloceanspaces.com/foodwifi/${allreslist[index].img}',
                                              fit: BoxFit.cover,
                                              progressIndicatorBuilder:
                                                  (context, url,
                                                          downloadProgress) =>
                                                      const Skeleton(
                                                height: 200,
                                              ),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      Container(
                                                height: 200,
                                                color: const Color.fromARGB(
                                                    255, 246, 243, 243),
                                              ),
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              allreslist[index]
                                                      .offerDescription
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
                                                                    allreslist[
                                                                            index]
                                                                        .offerDescription,
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
                                        ]),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 7),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: 320,
                                            child: Text(
                                              allreslist[index].title,
                                              style: GoogleFonts.kreon(
                                                  fontSize: 27,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          const Icon(
                                              Icons.favorite_outline_outlined)
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: 225,
                                            child: Text(
                                              allreslist[index].description,
                                              style: GoogleFonts.kreon(
                                                  fontSize: 15,
                                                  color: const Color.fromARGB(
                                                      255, 104, 104, 104)),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                allreslist[index].time,
                                                style: GoogleFonts.kreon(
                                                    fontSize: 12,
                                                    color: const Color.fromARGB(
                                                        221, 60, 60, 60)),
                                              ),
                                              const Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 3),
                                                child: Icon(
                                                  Icons.circle,
                                                  size: 2,
                                                ),
                                              ),
                                              Text(
                                                allreslist[index].distance,
                                                style: GoogleFonts.kreon(
                                                    fontSize: 12,
                                                    color: const Color.fromARGB(
                                                        221, 60, 60, 60)),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.star,
                                            size: 15,
                                            color: Color.fromARGB(
                                                255, 221, 204, 50),
                                          ),
                                          Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 3),
                                              child: Text(
                                                  allreslist[index].rating)),
                                          Text(
                                              '(${allreslist[index].ratingCount})'),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 10),
                                            child: Image.asset(
                                              'assets/images/equilizer.gif',
                                              height: 14,
                                            ),
                                          ),
                                          Text(
                                              '${allreslist[index].recentOrder.toString()}+ orders placed from here recently')
                                        ],
                                      ),
                                    )
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
        ],
      ),
    );
  }
}
