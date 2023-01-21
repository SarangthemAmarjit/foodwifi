import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
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
                  const CircleAvatar(
                      radius: 12,
                      child: Icon(
                        Icons.arrow_forward_sharp,
                        size: 17,
                      ))
                ],
              ),
              SizedBox(
                height: 220,
                child: ListView.builder(
                    physics: const PageScrollPhysics()
                        .applyTo(const BouncingScrollPhysics()),
                    itemCount: 10,
                    controller: PageController(viewportFraction: 0.8),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: ((context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 20, bottom: 50),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          width: 300,
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
