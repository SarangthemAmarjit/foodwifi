import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodwifi/model/model.dart';
import 'package:foodwifi/refactor/skeleton.dart';
import 'package:foodwifi/router/router.gr.dart';
import 'package:google_fonts/google_fonts.dart';

class ForthRowList extends StatelessWidget {
  const ForthRowList({
    Key? key,
    required this.firstlistitems,
  }) : super(key: key);

  final List<List<Item?>> firstlistitems;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: SizedBox(
        height: 400,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  top: 25,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 3),
                  child: Text(
                    'Imphal\'s Most Favorites',
                    style: GoogleFonts.kreon(fontSize: 20),
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
                        height: 350,
                      )
                    : GridView.builder(
                        controller: PageController(viewportFraction: 0.4),
                        padding: const EdgeInsets.only(left: 10),
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 1 / 0.92,
                          crossAxisCount: 2,
                        ),
                        physics: const PageScrollPhysics()
                            .applyTo(const BouncingScrollPhysics()),
                        itemCount: firstlistitems[2].length,
                        itemBuilder: ((
                          context,
                          index,
                        ) {
                          return InkWell(
                            onTap: () {
                              context.router.push(ProductRoute(
                                id: firstlistitems[2][index]!.id.toString(),
                                itemname: firstlistitems[2][index]!.title!,
                                iscomingfromsearch: false,
                                index: 0,
                              ));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: SizedBox(
                                    width: 135,
                                    child: CachedNetworkImage(
                                      fadeInDuration:
                                          const Duration(seconds: 1),
                                      imageUrl:
                                          'https://globizs.sgp1.cdn.digitaloceanspaces.com/foodwifi/${firstlistitems[2][index]!.img!}',
                                      fit: BoxFit.cover,
                                      progressIndicatorBuilder:
                                          (context, url, downloadProgress) =>
                                              const Skeleton(
                                        height: 75,
                                      ),
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 7),
                                  child: Text(
                                    firstlistitems[2][index]!.title!,
                                    style: GoogleFonts.kreon(fontSize: 12),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
              ),
            ),
            Container(
              height: 17,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
