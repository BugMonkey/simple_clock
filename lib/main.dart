import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_clock/themes.dart';

import 'main/main_page.dart';


void main() {
  // This app is designed only to work vertically, so we limit
  // orientations to portrait up and down.
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  return runApp(CupertinoStoreApp());


}

class CupertinoStoreApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return new MaterialApp(home: MainPage(),
    theme: themeData,
    );
  }
}


