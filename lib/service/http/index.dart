import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class Http {
  Future getHttp(String url) async {
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      //var data = jsonResponse['data'];
      //var dataCount = jsonResponse['count'];

      return jsonResponse['data'];
    } else {
      print('Request failed with status: ${response.statusCode}.');
      throw ("Error getHttp ${response.statusCode}");
    }
  }
}
