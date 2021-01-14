import 'package:flutter/foundation.dart';

class ProviderClient with ChangeNotifier {
  String _search =
      "Texto Inicial"; //Dentro de nuestro provider, creamos e inicializamos nuestra variable.

  String get getSearch =>
      _search; //Creamos el metodo Get, para poder obtener el valor de mitexto

  String get search =>
      _search; //Creamos el metodo Get, para poder obtener el valor de mitexto

  //Ahora creamos el metodo set para poder actualizar el valor de _mitexto, este metodo recibe un valor newTexto de tipo String
  set search(String newTexto) {
    print("ProviderClient: $newTexto");
    _search = newTexto; //actualizamos el valor
    notifyListeners(); //notificamos a los widgets que esten escuchando el stream.
  }
}
