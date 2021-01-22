// librarys
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Pruebas de integración', () {
    FlutterDriver driver;

    // hace conexion  a la aplicacion
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    //Future.delayed((Duration(seconds: 5)), () async {        });
    test('Digitar Usuario', () async {
      await driver.traceAction(() async {
        final userText = find.byValueKey('controllerUser');
        await driver.tap(userText); // acquire focus
        await driver.enterText('Stella75@gmail.com'); // enter text
        await driver.waitFor(
            find.text('Stella75@gmail.com')); // verify text appears on UI
      });
    });

    test('Digitar Clave', () async {
      await driver.traceAction(() async {
        final userText = find.byValueKey('controllerPassword');
        await driver.tap(userText); // acquire focus
        await driver.enterText('naYSpcTxmRzLgQa'); // enter text
        await driver
            .waitFor(find.text('naYSpcTxmRzLgQa')); // verify text appears on UI
      });
    });

    test('Enviar Datos', () async {
      await driver.traceAction(() async {
        final userText = find.byValueKey('boton_enviar');
        await driver.tap(userText); // acquire focus
        await Future.delayed(Duration(seconds: 2));
      });
    });

    test('Buscador', () async {
      await driver.traceAction(() async {
        final userText = find.byValueKey('buscador');
        await driver.tap(userText); // acquire focus
        await driver.enterText('Marlon Zayro'); // enter text
        await driver
            .waitFor(find.text('Marlon Zayro')); // verify text appears on UI

        final listado = find.byValueKey('list-1');
        await driver.tap(listado);
        await Future.delayed(Duration(seconds: 2));
        final listadoBoton = find.byValueKey('1');
        await driver.tap(listadoBoton);
        await Future.delayed(Duration(seconds: 2));
        final view = find.byValueKey('ver');
        await driver.tap(view);
      });
    });

    // se desconecta de la aplicacion
    tearDownAll(() async {
      if (driver != null) {
        await Future.delayed(Duration(seconds: 2));
        await driver.close();
      }
    });
  });
}
