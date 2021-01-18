import 'package:app_flutter/service/http/index.dart';
import 'package:flutter/foundation.dart';

class ProviderSearch with ChangeNotifier, DiagnosticableTreeMixin {
  final http = Http();

  //Future<List<dynamic>> dataSearch = Http().getHttp('/clientes');

  String _search =
      ""; //Dentro de nuestro provider, creamos e inicializamos nuestra variable.

  String get getSearch =>
      _search; //Creamos el metodo Get, para poder obtener el valor de mitexto

  String get search =>
      _search; //Creamos el metodo Get, para poder obtener el valor de mitexto

  //Ahora creamos el metodo set para poder actualizar el valor de _mitexto, este metodo recibe un valor newTexto de tipo String
  set search(String newTexto) {
    _search = newTexto; //actualizamos el valor
    notifyListeners(); //notificamos a los widgets que esten escuchando el stream.
  }

  /**
   * DEVELOP
   */

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('_search', search));
  }
}
