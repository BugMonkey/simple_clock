import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_clock/clock_shown/clock_view_page.dart';
import 'package:simple_clock/clock_shown/clock_widget.dart';
import 'package:simple_clock/clock_shown/text_style.dart';

import 'main_page.dart';

class MainPageState extends State<MainPage> {
  List<TextStyle> textStyle = [
    styleNormal,
    styleAmaticSC,
    styleEwert,
    styleOrbitron
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          padding: const EdgeInsets.all(20.0),
          itemCount: textStyle.length,
          itemBuilder: (context, index) {
            return _buildItem(index);
          },
        ),
      ),
    );
  }



  Widget _buildItem(int index) {
    return ClockCardWidget(textStyle[index]);
  }
}
