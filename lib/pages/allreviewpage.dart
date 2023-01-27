import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class AllreviewPage extends StatefulWidget {
  final String id;
  const AllreviewPage({super.key, required this.id});

  @override
  State<AllreviewPage> createState() => _AllreviewPageState();
}

class _AllreviewPageState extends State<AllreviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 30),
            child: Row(
              children: [
                const Icon(
                  Icons.arrow_back_ios_new,
                  size: 22,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Text(
                    'Ratings & Reviews',
                    style: GoogleFonts.kreon(fontSize: 22),
                  ),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
