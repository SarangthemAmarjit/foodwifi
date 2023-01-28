import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:foodwifi/model/allbelowmodel.dart';
import 'package:foodwifi/router/router.gr.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

class ReviewPage extends StatelessWidget {
  final String id;
  final Reviewdata reviewdata;
  const ReviewPage({
    Key? key,
    required this.reviewdata,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'What people say',
                    style: GoogleFonts.kreon(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                    onTap: () {
                      context.router.push(AllreviewRoute(id: id));
                    },
                    child: const CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 203, 201, 201),
                        radius: 12,
                        child: Icon(
                          Icons.arrow_forward_sharp,
                          size: 17,
                          color: Colors.black,
                        )),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: Row(
                  children: [
                    Text(
                      reviewdata.rating.toString(),
                      style: GoogleFonts.kreon(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const Icon(
                      Icons.star,
                      color: Color.fromARGB(255, 212, 197, 59),
                    ),
                    Text(
                      " ${reviewdata.ratingCount} ratings & public reviews",
                      style: GoogleFonts.kreon(
                          color: const Color.fromARGB(255, 111, 109, 109)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 130,
                child: ListView.builder(
                    physics: const PageScrollPhysics()
                        .applyTo(const BouncingScrollPhysics()),
                    itemCount: reviewdata.review.length,
                    controller: PageController(viewportFraction: 0.88),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: ((context, index) {
                      var dd = Jiffy(
                              '${reviewdata.review[index].createdDate.year}-${reviewdata.review[index].createdDate.month}-${reviewdata.review[index].createdDate.day}')
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
                            Container(
                              width: 300,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 20, left: 15, bottom: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      reviewdata.review[index].name,
                                      style: GoogleFonts.kreon(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      child: Row(
                                        children: [
                                          Text(
                                            reviewdata.review[index].rating,
                                            style:
                                                GoogleFonts.kreon(fontSize: 16),
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
                                          Text(datefinal),
                                          const Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 3),
                                            child: Icon(
                                              Icons.circle,
                                              size: 2,
                                            ),
                                          ),
                                          const Text('Ordered on '),
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
                                    reviewdata.review[index].description ==
                                                null ||
                                            reviewdata.review[index]
                                                .description!.isEmpty
                                        ? Container()
                                        : Text(
                                            reviewdata
                                                .review[index].description!,
                                            style: GoogleFonts.kreon(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                          )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    })),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
