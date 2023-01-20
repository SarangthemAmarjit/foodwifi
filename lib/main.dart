import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'src/app/app.widget.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent
          //color set to transperent or set your own color
          ));
  runApp(MyApp());
}
