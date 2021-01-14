import 'package:flutter/material.dart';

import '../pages/login/login.widget.dart';
import '../pages/client/client.widget.dart';

Map<String, WidgetBuilder> rootPath() {
  return <String, WidgetBuilder>{
    "/login": (BuildContext context) => LoginPage(),
    "/client": (BuildContext context) => ClientPage()
  };
}
