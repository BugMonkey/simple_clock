import 'dart:async';

import 'package:cuertino_app/main/TimeViewModel.dart';
import 'package:cuertino_app/main/main_page.dart';
import 'package:cuertino_app/main/time_vo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPageState extends State<MainPage> {
  Stream<TimeVo> timeStream;

  @override
  void initState() {
    super.initState();
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
          dateTime.minute.toString(),
          dateTime.second.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: Container(
      width: double.infinity,
      height: double.infinity,
      color: Color(0xcc000000),
      child: StreamBuilder<TimeVo>(
        stream: timeStream,
        builder: (BuildContext context, AsyncSnapshot<TimeVo> snapshot) {
          TimeVo vo = snapshot.data;
          return Text(
            "${vo.hour}:${vo.min}:${vo.second}",
            style: TextStyle(fontSize: 20, color: Colors.white12),
          );
        },
      ),
    ));
  }


}
