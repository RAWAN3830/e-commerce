import 'package:flutter/cupertino.dart';

class ProductProvider with ChangeNotifier{
  bool _isMute = false;
  bool get isMute => isMute;

  Duration postion = Duration.zero;
  Duration _duration = Duration.zero;

  Duration get position => position;

  Duration get duration => _duration;
  bool _isPlaying = true;


  set setduration(value) {
    _duration = value;
    notifyListeners();
  }

  set setisPlaying(value) {
    _isPlaying = value;
    notifyListeners();
  }

  set setMute(value) {
    _isMute = !value;

    notifyListeners();
  }

  set setPostion(newpositon) {
    postion = newpositon;
    notifyListeners();
  }

}