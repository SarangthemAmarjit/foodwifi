import 'package:flutter/material.dart';
import 'package:foodwifi/core/multiprovider.wrapper.dart';
import 'package:foodwifi/router/router.gr.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiproviderWrapper(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
        theme: ThemeData(textTheme: GoogleFonts.kreonTextTheme()),
        builder: EasyLoading.init(),
        title: 'Foodwifi',
      ),
    );
  }
}
