import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodwifi/model/model.dart';
import 'package:foodwifi/refactor/skeleton.dart';
import 'package:google_fonts/google_fonts.dart';

class FifthRowList extends StatelessWidget {
  const FifthRowList({
    Key? key,
    required this.firstlistitems,
  }) : super(key: key);

  final List<List<Item?>> firstlistitems;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: SizedBox(
        height: 300,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(left: 15, top: 25),
                child: Padding(
                  padding: const EdgeInsets.only(right: 3),
                  child: Text(
                    'New on Foodwifi',
                    style: GoogleFonts.kreon(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
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
                        height: 300,
                      )
                    : ListView.builder(
                        controller: PageController(viewportFraction: 0.4),
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
                                    width: 135,
                                    child: CachedNetworkImage(
                                      fadeInDuration:
                                          const Duration(seconds: 1),
                                      imageUrl:
                                          'https://globizs.sgp1.cdn.digitaloceanspaces.com/foodwifi/${firstlistitems[4][index]!.img!}',
                                      fit: BoxFit.cover,
                                      progressIndicatorBuilder:
                                          (context, url, downloadProgress) =>
                                              const Skeleton(
                                        height: 135,
                                      ),
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 7),
                                  child: Text(
                                    firstlistitems[4][index]!.title!,
                                    style: GoogleFonts.kreon(fontSize: 15),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    firstlistitems[4][index]!.title!,
                                    style: GoogleFonts.kreon(
                                        fontSize: 11,
                                        color: const Color.fromARGB(
                                            255, 148, 144, 144)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Row(
                                    children: [
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
