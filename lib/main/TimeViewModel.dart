import 'dart:async';

import 'time_vo.dart';



class TimeViewModel {
  StreamController<TimeVo> _controller;

  StreamController<TimeVo> get controller => _controller;

  TimeViewModel() {
    _controller = StreamController<TimeVo>();
  }

  void add(TimeVo event) {
    _controller.sink.add(event);
  }

  void dispose() {
    _controller.close();
  }


}
