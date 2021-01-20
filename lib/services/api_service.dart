import 'dart:convert';

import 'package:flutterApiWithProvider/models/playerInfo.dart';
import 'package:http/http.dart' as http;

class ApiService {
  // final String url = 'https://abis-r6-api.vercel.app/api/v1/ab____';

  // static Future<List<PlayerInfo>> fetchPlayerDefaultInfo() async {
  //   var response =
  //       await http.get('https://abis-r6-api.vercel.app/api/v1/ab____');
  //   var decodedData = jsonDecode(response.body) as List;
  //   print(decodedData);
  //   return decodedData.map((info) => PlayerInfo.fromJson(info)).toList();
  // }

  static Future<PlayerInfo> fetchPlayerInfo(String playerName) async {
    var response =
        await http.get('https://abis-r6-api.vercel.app/api/v1/$playerName');
    var decodedData = jsonDecode(response.body);
    return PlayerInfo.fromJson(decodedData[0]);
  }
}
