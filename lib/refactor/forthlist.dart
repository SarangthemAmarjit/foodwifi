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
        height: 350,
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
                    'Choose From cuisines',
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
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 1 / 0.71,
                          crossAxisCount: 2,
                        ),
                        physics: const BouncingScrollPhysics(),
                        itemCount: firstlistitems[3].length,
                        itemBuilder: ((
                          context,
                          index,
                        ) {
                          return InkWell(
                            onTap: () {
                              context.router.push(SearchRestuarentRoute(
                                itemname:
                                    firstlistitems[3][index]!.keyword == null
                                        ? ''
                                        : firstlistitems[3][index]!.keyword!,
                                issearchfoud: false,
                                cuisinesId: '',
                                storetypeid: '',
                                checkname: '',
                              ));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 84,
                                  child: CachedNetworkImage(
                                    fadeInDuration: const Duration(seconds: 1),
                                    imageUrl:
                                        'https://globizs.sgp1.cdn.digitaloceanspaces.com/foodwifi/${firstlistitems[3][index]!.img!}',
                                    fit: BoxFit.cover,
                                    progressIndicatorBuilder:
                                        (context, url, downloadProgress) =>
                                            const Skeleton(
                                      radius: 50,
                                      height: 75,
                                    ),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 7),
                                  child: Text(
                                    firstlistitems[3][index]!.title!,
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
