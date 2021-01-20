import 'package:flutter/cupertino.dart';
import 'package:flutterApiWithProvider/models/playerInfo.dart';

class InfoProvider with ChangeNotifier {
  bool _isProcessing = true;
  PlayerInfo _playerInfo;

  bool get isProcessing => _isProcessing;
  PlayerInfo get playerInfo => _playerInfo;

  setIsProcessing(bool value) {
    _isProcessing = value;
    notifyListeners();
  }

  setPlayerInfo(PlayerInfo playerInfo) {
    _playerInfo = playerInfo;
    notifyListeners();
  }
}
