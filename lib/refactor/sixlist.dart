import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodwifi/model/model.dart';
import 'package:foodwifi/refactor/skeleton.dart';
import 'package:foodwifi/router/router.gr.dart';
import 'package:google_fonts/google_fonts.dart';

class SixRowList extends StatelessWidget {
  const SixRowList({
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
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(left: 15, top: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 3),
                          child: Text(
                            'Imphal\'s Most Favorites',
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
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        'City Favotites',
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
                        controller: PageController(viewportFraction: 0.67),
                        scrollDirection: Axis.horizontal,
                        physics: const PageScrollPhysics()
                            .applyTo(const BouncingScrollPhysics()),
                        itemCount: firstlistitems[4].length,
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
                                    child: InkWell(
                                      onTap: () {
                                        context.router.push(ProductRoute(
                                          id: firstlistitems[4][index]!
                                              .id
                                              .toString(),
                                          itemname:
                                              firstlistitems[4][index]!.title!,
                                          iscomingfromsearch: false,
                                          index: 0,
                                        ));
                                      },
                                      child: CachedNetworkImage(
                                        fadeInDuration:
                                            const Duration(seconds: 1),
                                        imageUrl:
                                            'https://globizs.sgp1.cdn.digitaloceanspaces.com/foodwifi/${firstlistitems[4][index]!.img!}',
                                        fit: BoxFit.cover,
                                        progressIndicatorBuilder:
                                            (context, url, downloadProgress) =>
                                                const Skeleton(
                                          height: 130,
                                        ),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 7),
                                  child: SizedBox(
                                    width: 240,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          firstlistitems[4][index]!.title!,
                                          style:
                                              GoogleFonts.kreon(fontSize: 12),
                                        ),
                                        const Icon(
                                            Icons.favorite_border_outlined)
                                      ],
                                    ),
                                  ),
                                ),
                                firstlistitems[4][index]!.description != null
                                    ? Padding(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: Text(
                                          firstlistitems[4][index]!
                                              .description!,
                                          style: GoogleFonts.kreon(
                                              fontSize: 12,
                                              color: const Color.fromARGB(
                                                  255, 148, 144, 144)),
                                        ),
                                      )
                                    : const SizedBox(),
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
                                        firstlistitems[4][index]!.rating!,
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
                                        firstlistitems[4][index]!.time!,
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
                                        firstlistitems[4][index]!.distance!,
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
