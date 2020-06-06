import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_clock/clock_shown/clock_view_page.dart';
import 'package:simple_clock/main/time_vo.dart';



class ClockViewPageSate extends State<ClockViewShowPage> {
  Stream<TimeVo> timeStream;
  bool _preview=false;
  TextStyle _textStyle;

  ClockViewPageSate(this._preview,this._textStyle);

  @override
  void initState() {
    super.initState();
    if(!_preview){
      //隐藏状态栏
      SystemChrome.setEnabledSystemUIOverlays([]);
      timeStream = timer();
    }else{
      timeStream=Stream.value(TimeVo('2020','06','01','10','21','08'));
    }

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
      height: 100,
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
              style:_textStyle?? TextStyle(
                  fontSize: 100,
                  color: Colors.white,
                  fontFamily: "AmaticSC",
                  fontStyle: FontStyle.italic,
                  decoration: TextDecoration.none),
            );
          }
        },
      ),
    );
  }
}
