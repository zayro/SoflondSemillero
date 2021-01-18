import 'package:app_flutter/service/http/index.dart';
import 'package:flutter/foundation.dart';

class ProviderClient with ChangeNotifier, DiagnosticableTreeMixin {
  final http = Http();

  List dataSearch = [];
  num countDataSearch = 0;

  void dataClient() async {
    print("dataClient");
    dataSearch = await http.getHttp('/clientes');
  }
}
