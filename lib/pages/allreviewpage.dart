import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodwifi/logic/fetchdata2/cubit/fetchrecentdata_cubit.dart';
import 'package:foodwifi/model/reviewmodal.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:jiffy/jiffy.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AllreviewPage extends StatefulWidget {
  final String id;
  const AllreviewPage({super.key, required this.id});

  @override
  State<AllreviewPage> createState() => _AllreviewPageState();
}

class _AllreviewPageState extends State<AllreviewPage> {
  ScrollController controller = ScrollController();
  int value = 0;
  int data = 10;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<FetchallreviewCubit>().getdatalist(
        id: widget.id,
        pagenumber: 1,
        datalimit: 10,
        isMoredata: true,
        lastdocument: null);
    controller.addListener(() {
      if (controller.position.pixels == controller.position.maxScrollExtent) {
        setState(() {
          data = data + 10;
        });
        log(data.toString());
        context.read<FetchallreviewCubit>().getdatalist(
              id: widget.id,
              pagenumber: 1,
              datalimit: data,
              isMoredata: true,
            );

        log('reach buttom');
      }
    });
  }

  String rating = '';
  String ratingcount = '';

  @override
  Widget build(BuildContext context) {
    final review = context.watch<FetchallreviewCubit>().state;
    ReviewModal allreview = review.productdetail!;
    if (allreview.rating != null) {
      rating = allreview.rating.toString();
      ratingcount = allreview.ratingCount.toString();
    }
    bool ismoreloading = review.isloading;
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 30),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    context.router.pop();
                  },
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    size: 18,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Text(
                    'Ratings & Reviews',
                    style: GoogleFonts.kreon(fontSize: 20),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: controller,
              child: SizedBox(
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 15, bottom: 10, left: 20),
                      child: Row(
                        children: [
                          Text(
                            rating,
                            style: GoogleFonts.kreon(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const Icon(
                            Icons.star,
                            color: Color.fromARGB(255, 212, 197, 59),
                          ),
                          Text(
                            " $ratingcount ratings & public reviews",
                            style: GoogleFonts.kreon(
                                fontSize: 16,
                                color:
                                    const Color.fromARGB(255, 111, 109, 109)),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: 2,
                    ),
                    Container(
                      child: Column(
                        children: [
                          ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: allreview.review.length,
                            itemBuilder: ((context, index) {
                              var dd = Jiffy(
                                      '${allreview.review[index].createdDate.year}-${allreview.review[index].createdDate.month}-${allreview.review[index].createdDate.day}')
                                  .subtract(days: 1)
                                  .format();

                              var datetime = DateTime.parse(dd);

                              var format = DateFormat("dd MMM, yyyy");

                              var datefinal = format.format(datetime);

                              return Padding(
                                padding: const EdgeInsets.only(
                                  right: 20,
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8, left: 20, bottom: 8),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            allreview.review[index].name!,
                                            style: GoogleFonts.kreon(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              top: 5,
                                            ),
                                            child: Row(
                                              children: [
                                                Text(
                                                  allreview
                                                      .review[index].rating!,
                                                  style: GoogleFonts.kreon(
                                                      color: Colors.grey[700],
                                                      fontSize: 16),
                                                ),
                                                const Icon(
                                                  Icons.star,
                                                  size: 22,
                                                  color: Color.fromARGB(
                                                      255, 212, 197, 59),
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
                                                  datefinal,
                                                  style: GoogleFonts.kreon(
                                                      color: Colors.grey[700],
                                                      fontSize: 16),
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
                                                  'Ordered on ',
                                                  style: GoogleFonts.kreon(
                                                      color: Colors.grey[700],
                                                      fontSize: 16),
                                                ),
                                                SizedBox(
                                                  height: 13,
                                                  width: 13,
                                                  child: ClipOval(
                                                    child: Image.asset(
                                                      'assets/images/foodwifi.png',
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          allreview.review[index].description ==
                                                      null ||
                                                  allreview.review[index]
                                                      .description!.isEmpty
                                              ? Container()
                                              : Text(
                                                  allreview.review[index]
                                                      .description!,
                                                  style: GoogleFonts.kreon(
                                                      textStyle:
                                                          const TextStyle(
                                                              height: 1.3,
                                                              letterSpacing:
                                                                  0.7),
                                                      color: Colors.grey[700],
                                                      fontSize: 16,
                                                      fontStyle:
                                                          FontStyle.italic),
                                                )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const Divider(
                                thickness: 2,
                              );
                            },
                          ),
                          Center(
                            child: ismoreloading
                                ? Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Column(
                                      children: [
                                        LoadingAnimationWidget
                                            .threeArchedCircle(
                                                color: Colors.grey, size: 26),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          'Loading more data',
                                          style: GoogleFonts.kreon(
                                              color: Colors.grey, fontSize: 18),
                                        )
                                      ],
                                    ),
                                  )
                                : const SizedBox(),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
