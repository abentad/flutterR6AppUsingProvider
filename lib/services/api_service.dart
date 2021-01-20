import 'dart:convert';
import 'dart:io';
import 'package:flutterApiWithProvider/models/http_response.dart';
import 'package:flutterApiWithProvider/models/playerInfo.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<HttpResponse<PlayerInfo>> fetchPlayerInfo(
      String playerName) async {
    //SocketException :  when there is internet or network problem
    //FormatException :  when the json data is invalid
    try {
      var response =
          await http.get('https://abis-r6-api.vercel.app/api/v1/$playerName');
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        return HttpResponse(
          true,
          PlayerInfo.fromJson(
            decodedData[0],
          ),
          responseCode: response.statusCode,
        );
      } else {
        return HttpResponse(
          false,
          null,
          message:
              "Invalid response recieved from server Please try aagain later.",
          responseCode: response.statusCode,
        );
      }
    } on SocketException {
      return HttpResponse(
        false,
        null,
        message: "Unable to reach the internet please try again in a minute.",
      );
    } on FormatException {
      return HttpResponse(
        false,
        null,
        message:
            "Invalid response recieved from server! Please try again in a minute.",
      );
    } catch (e) {
      return HttpResponse(
        false,
        null,
        message: "Something went wrong Please try again in a minute.",
      );
    }
  }
}
