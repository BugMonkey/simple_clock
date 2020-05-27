import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'main_page.dart';
import 'time_vo.dart';

class MainPageState extends State<MainPage> {
  Stream<TimeVo> timeStream;

  @override
  void initState() {
    super.initState();
    //隐藏状态栏
    SystemChrome.setEnabledSystemUIOverlays([]);
    timeStream = timer();
  }

  ///当前时间
  Stream<TimeVo> timer() {
    return Stream.periodic(Duration(seconds: 1), (i) {
      DateTime dateTime = DateTime.now();
      return TimeVo(
          dateTime.year.toString(),
          dateTime.month.toString(),
          dateTime.day.toString(),
          dateTime.hour.toString(),
          "${dateTime.minute < 10 ? "0" : ""}${dateTime.minute.toString()}",
          "${dateTime.second < 10 ? "0" : ""}${dateTime.second.toString()}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color(0xcc000000),
      alignment: Alignment.center,
      child: StreamBuilder<TimeVo>(
        stream: timeStream,
        builder: (BuildContext context, AsyncSnapshot<TimeVo> snapshot) {
          TimeVo vo = snapshot.data;
          if (vo == null) {
            return Container();
          } else {
            return Text(
              "${vo?.hour}:${vo?.min}:${vo?.second}",
              style: TextStyle(
                  fontSize: 100,
                  color: Colors.white,
                  fontFamily: "Ewert"),
            );
          }
        },
      ),
    );
  }
}
