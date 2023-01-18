import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodwifi/model/model.dart';
import 'package:foodwifi/refactor/skeleton.dart';
import 'package:google_fonts/google_fonts.dart';

class EightRowList extends StatelessWidget {
  const EightRowList({
    Key? key,
    required this.firstlistitems,
  }) : super(key: key);

  final List<List<Item?>> firstlistitems;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: SizedBox(
        height: 320,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(left: 15, top: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 3),
                      child: Text(
                        'Best of Local',
                        style: GoogleFonts.kreon(fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        'Lets support the unique taste of our locals',
                        style: GoogleFonts.kreon(color: Colors.grey),
                      ),
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
                        height: 320,
                      )
                    : ListView.builder(
                        controller: PageController(viewportFraction: 0.88),
                        scrollDirection: Axis.horizontal,
                        physics: const PageScrollPhysics()
                            .applyTo(const BouncingScrollPhysics()),
                        itemCount: firstlistitems[7].length,
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
                                      width: 320,
                                      height: 183,
                                      child: Stack(
                                        fit: StackFit.expand,
                                        children: [
                                          CachedNetworkImage(
                                            fadeInDuration:
                                                const Duration(seconds: 1),
                                            imageUrl:
                                                'https://globizs.sgp1.cdn.digitaloceanspaces.com/foodwifi/${firstlistitems[7][index]!.img!}',
                                            fit: BoxFit.cover,
                                            progressIndicatorBuilder: (context,
                                                    url, downloadProgress) =>
                                                const Skeleton(
                                              height: 180,
                                            ),
                                            errorWidget:
                                                (context, url, error) =>
                                                    const Icon(Icons.error),
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 4),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      gradient:
                                                          const LinearGradient(
                                                              colors: [
                                                            Colors.white10,
                                                            Colors.black26,
                                                            Colors.black54,
                                                            Color.fromARGB(
                                                                221, 19, 19, 19)
                                                          ],
                                                              begin: Alignment
                                                                  .topCenter,
                                                              end: Alignment
                                                                  .bottomCenter),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 15,
                                                            bottom: 15),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(top: 7),
                                                          child: Text(
                                                            firstlistitems[7]
                                                                    [index]!
                                                                .title!,
                                                            style: GoogleFonts.kreon(
                                                                fontSize: 22,
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                        firstlistitems[7]
                                                                        [index]!
                                                                    .description !=
                                                                null
                                                            ? Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        top: 5),
                                                                child: Text(
                                                                  firstlistitems[
                                                                              7]
                                                                          [
                                                                          index]!
                                                                      .description!,
                                                                  style: GoogleFonts.kreon(
                                                                      fontSize:
                                                                          13,
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                              )
                                                            : const SizedBox(),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(top: 5),
                                                          child: Row(
                                                            children: [
                                                              Text(
                                                                firstlistitems[
                                                                            7]
                                                                        [index]!
                                                                    .distance!,
                                                                style: GoogleFonts.kreon(
                                                                    fontSize:
                                                                        12,
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                              const Padding(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            3),
                                                                child: Icon(
                                                                  Icons.circle,
                                                                  size: 2,
                                                                ),
                                                              ),
                                                              Text(
                                                                firstlistitems[
                                                                            7]
                                                                        [index]!
                                                                    .time!,
                                                                style: GoogleFonts.kreon(
                                                                    fontSize:
                                                                        12,
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                              const Padding(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            3),
                                                                child: Icon(
                                                                  Icons.circle,
                                                                  size: 2,
                                                                ),
                                                              ),
                                                              const Icon(
                                                                Icons.star,
                                                                size: 11,
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        220,
                                                                        204,
                                                                        52),
                                                              ),
                                                              Text(
                                                                firstlistitems[
                                                                            7]
                                                                        [index]!
                                                                    .rating!,
                                                                style: GoogleFonts.kreon(
                                                                    fontSize:
                                                                        12,
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      )),
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
