import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class Http {
  String api = "https://6001ffb108587400174db895.mockapi.io/api/v1";

  Future<List<dynamic>> getHttp(String url) async {
    print("getHttp");
    var response = await http.get(this.api + url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      //var data = jsonResponse['data'];
      //var dataCount = jsonResponse['count'];
      //print(jsonResponse['data']);

      //return jsonResponse['data'];

      List<dynamic> data = jsonResponse['data'];
      return data;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      throw ("Error getHttp ${response.statusCode}");
    }
  }

  getHttpBasic(String url) async {
    print("getHttpBasic");
    var response = await http.get(this.api + url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      //var data = jsonResponse['data'];
      //var dataCount = jsonResponse['count'];
      //print(jsonResponse['data']);

      return jsonResponse['data'];
    } else {
      print('Request failed with status: ${response.statusCode}.');
      throw ("Error getHttp ${response.statusCode}");
    }
  }
}
