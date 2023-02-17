import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void pagenavigate() async {
    Future.delayed(const Duration(seconds: 2))
        .whenComplete(() => context.router.replaceNamed('/home'));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pagenavigate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Image.asset(
      'assets/images/splash.gif',
      fit: BoxFit.cover,
      height: MediaQuery.of(context).size.height,
    ));
  }
}
