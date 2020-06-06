import 'package:flutter/cupertino.dart';
import 'package:simple_clock/clock_shown/clock_show_view_state.dart';

///时钟显示页
class ClockViewShowPage extends StatefulWidget {
  //是否预览
  bool _preview=false;

  TextStyle _textStyle;

  ClockViewShowPage(this._preview,this._textStyle);

  @override
  State<StatefulWidget> createState() {
    return ClockViewPageSate(_preview,_textStyle);
  }
}
