import 'package:flutter/material.dart';

class LoginProvider with ChangeNotifier {
  String _email;
  String _name;
  String _profileImageUrl;

  //getters

  String get email => _email;
  String get name => _name;
  String get imgUrl => _profileImageUrl;

  //setters
  void setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  void setName(String name) {
    _name = name;
    notifyListeners();
  }

  void setProfileImageUrl(String imageUrl) {
    _profileImageUrl = imageUrl;
    notifyListeners();
  }
}
