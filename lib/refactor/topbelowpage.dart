import 'package:flutter/material.dart';
import 'package:foodwifi/model/searchfiltermodal.dart';
import 'package:foodwifi/refactor/skeleton.dart';
import 'package:google_fonts/google_fonts.dart';

class TopbelowPage extends StatelessWidget {
  const TopbelowPage({
    super.key,
    required this.finaltopdata,
  });

  final TopSearchModal? finaltopdata;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const Divider(
            color: Color.fromARGB(255, 246, 242, 242),
            thickness: 5,
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Text(
                  'Cuisines',
                  style: GoogleFonts.kreon(
                      color: Colors.red,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 130,
                ),
                Text('Store types',
                    style: GoogleFonts.kreon(
                        color: Colors.red,
                        fontSize: 22,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          finaltopdata == null
              ? Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: const [
                      Skeleton(
                        height: 40,
                        radius: 0,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Skeleton(
                        height: 40,
                        radius: 0,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Skeleton(
                        height: 40,
                        radius: 0,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Skeleton(
                        height: 40,
                        radius: 0,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Skeleton(
                        height: 40,
                        radius: 0,
                      )
                    ],
                  ),
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: finaltopdata!.cuisines.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 20),
                                      child: Text(
                                          finaltopdata!
                                              .cuisines[index].cuisineName,
                                          style:
                                              GoogleFonts.kreon(fontSize: 20)),
                                    );
                                  }),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: finaltopdata!.storeTypes.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 20),
                                      child: Text(
                                          finaltopdata!.storeTypes[index].name,
                                          style:
                                              GoogleFonts.kreon(fontSize: 20)),
                                    );
                                  }),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
