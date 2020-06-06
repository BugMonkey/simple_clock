import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClockCardWidget extends StatelessWidget{
  TextStyle _textStyle;

  ClockCardWidget(this._textStyle);

  @override
  Widget build(BuildContext context) {
    return Container(padding:EdgeInsets.only(left: 12,right: 12,top: 8,bottom: 8),child: Card(
      child: Text("21:34:08",style: _textStyle,),shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20.0)),),      clipBehavior: Clip.antiAlias,
      semanticContainer: false,),
    );
  }

}