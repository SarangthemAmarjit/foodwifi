import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodwifi/model/model.dart';
import 'package:foodwifi/refactor/skeleton.dart';
import 'package:foodwifi/router/router.gr.dart';
import 'package:google_fonts/google_fonts.dart';

class SecondRowList extends StatelessWidget {
  const SecondRowList({
    Key? key,
    required this.firstlistitems,
  }) : super(key: key);

  final List<List<Item?>> firstlistitems;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: SizedBox(
        height: 140,
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.white,
                width: double.maxFinite,
                height: 300,
                child: firstlistitems.isEmpty
                    ? const Skeleton(
                        height: 130,
                      )
                    : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const PageScrollPhysics()
                            .applyTo(const BouncingScrollPhysics()),
                        itemCount: firstlistitems[0].length,
                        itemBuilder: ((
                          context,
                          index,
                        ) {
                          return InkWell(
                            onTap: () {
                              context.router.push(SearchRestuarentRoute(
                                itemname:
                                    firstlistitems[0][index]!.keyword == null
                                        ? ''
                                        : firstlistitems[0][index]!.keyword!,
                                issearchfoud: false,
                                cuisinesId: '',
                                storetypeid: '',
                                sortby: '',
                                cuisinesname: '',
                                freedeliveryname: false,
                                halalname: false,
                                promoname: false,
                                sortbyname: '',
                                storetypename: '',
                                selectedindexforstoretype: null,
                                ischecked: false,
                                allcuisinese: '',
                                freedeliveryid: '',
                                halalid: '',
                                promoid: '',
                              ));
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10, left: 24),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: SizedBox(
                                      width: 75,
                                      child: CachedNetworkImage(
                                        fadeInDuration:
                                            const Duration(seconds: 1),
                                        imageUrl:
                                            'https://globizs.sgp1.cdn.digitaloceanspaces.com/foodwifi/${firstlistitems[0][index]!.img!}',
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
                                      firstlistitems[0][index]!.title!,
                                      style: GoogleFonts.kreon(fontSize: 12),
                                    ),
                                  ),
                                ],
                              ),
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
