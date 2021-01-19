import 'dart:convert' as convert;
import 'dart:convert';
import 'package:http/http.dart' as http;

class Http {
  String api = "https://6001ffb108587400174db895.mockapi.io/api/v1";

  Future<List<dynamic>> getHttpFuture(String url) async {
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

  getHttp(String url) async {
    print("getHttpBasic: " + this.api + url);
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

  postHttp(String url, data) async {
    print("postHttp: " + this.api + url);
    String send = this.api + url;
    var response = await http.post(send,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        //body: jsonEncode(body),
        body: jsonEncode(data));
    if (response.statusCode == 201) {
      var jsonResponse = convert.jsonDecode(response.body);

      return jsonResponse;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      throw ("Error getHttp ${response.statusCode}");
    }
  }

  putHttp(String url, body) async {
    print("putHttp: " + this.api + url);
    String send = this.api + url;
    var response = await http.put(
      send,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(body),
    );
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);

      return jsonResponse;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      throw ("Error getHttp ${response.statusCode}");
    }
  }

  deleteHttp(String url) async {
    print("deleteHttp: " + this.api + url);
    String send = this.api + url;
    var response = await http.delete(
      send,
    );
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);

      return jsonResponse;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      //throw ("Error getHttp ${response.statusCode}");
    }
  }
}
