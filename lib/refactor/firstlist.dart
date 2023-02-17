import 'package:flutter/material.dart';
import 'package:foodwifi/model/model.dart';
import 'package:foodwifi/refactor/skeleton.dart';

class FirstRowList extends StatelessWidget {
  const FirstRowList({
    Key? key,
    required this.firstlistitems,
  }) : super(key: key);

  final List<List<Item?>> firstlistitems;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: SizedBox(
        height: 220,
        child: Column(
          children: [
            Expanded(
              child: Container(
                  color: Colors.white,
                  width: double.maxFinite,
                  height: 280,
                  child: firstlistitems.isEmpty
                      ? const Skeleton(
                          height: 237,
                        )
                      : ListView.builder(
                          itemCount: 1,
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, bottom: 15),
                              child: Image.asset(
                                'assets/images/valentine.gif',
                                width: 365,
                              ),
                            );
                          })

                  // : ListView.builder(
                  //     controller: PageController(viewportFraction: 0.81),
                  //     scrollDirection: Axis.horizontal,
                  //     physics: const PageScrollPhysics()
                  //         .applyTo(const BouncingScrollPhysics()),
                  //     itemCount: firstlistitems[0].length,
                  //     itemBuilder: ((
                  //       context,
                  //       index,
                  //     ) {
                  //       return Padding(
                  //         padding: const EdgeInsets.only(top: 10, left: 17),
                  //         child: Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             const SizedBox(
                  //               height: 12,
                  //             ),
                  //             ClipRRect(
                  //               borderRadius: BorderRadius.circular(12),
                  //               child: SizedBox(
                  //                 width: 340,
                  //                 height: 185,
                  //                 child: CachedNetworkImage(
                  //                   fadeInDuration:
                  //                       const Duration(seconds: 1),
                  //                   imageUrl:
                  //                       'https://globizs.sgp1.cdn.digitaloceanspaces.com/foodwifi/${firstlistitems[0][index]!.img!}',
                  //                   fit: BoxFit.cover,
                  //                   progressIndicatorBuilder:
                  //                       (context, url, downloadProgress) =>
                  //                           const Skeleton(
                  //                     height: 185,
                  //                   ),
                  //                   errorWidget: (context, url, error) =>
                  //                       const Icon(Icons.error),
                  //                 ),
                  //               ),
                  //             ),
                  //             Padding(
                  //               padding: const EdgeInsets.all(3),
                  //               child: Text(firstlistitems[0][index]!.title!),
                  //             )
                  //           ],
                  //         ),
                  //       );
                  //     }),
                  //   ),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
