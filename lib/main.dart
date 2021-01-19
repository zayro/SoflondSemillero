import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'service/provider/client.dart';
import 'service/provider/search.dart';
import './routes/index.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProviderSearch()),
        ChangeNotifierProvider(create: (_) => ProviderClient()),
        /*        ChangeNotifierProvider.value(
          value: ProviderClient(),
        ), */
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          brightness: Brightness.light,
          primaryColor: Colors.indigo,
          accentColor: Colors.orange,
          buttonColor: Colors.deepOrange,
          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        //home: MyHomePage(title: 'Flutter Demo Home Page'),
        initialRoute: "/login",
        routes: rootPath(),
      )));
}
