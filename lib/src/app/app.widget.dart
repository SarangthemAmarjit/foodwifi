import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:foodwifi/core/multiprovider.wrapper.dart';
import 'package:foodwifi/router/router.gr.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = AppRouter();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialization();
  }

  void initialization() async {
    Future.delayed(const Duration(microseconds: 1))
        .whenComplete(() => FlutterNativeSplash.remove());
  }

  @override
  Widget build(BuildContext context) {
    return MultiproviderWrapper(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
        theme: ThemeData(
            scrollbarTheme: const ScrollbarThemeData(
              crossAxisMargin: 0,
            ),
            textTheme: GoogleFonts.kreonTextTheme(),
            highlightColor: Colors.white),
        builder: EasyLoading.init(),
        title: 'Foodwifi',
      ),
    );
  }
}
