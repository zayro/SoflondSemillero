import 'dart:async';

import 'package:app_flutter/service/http/index.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_intro/flutter_intro.dart';

import '../../service/provider/search.dart';

import '../../widgets/search_field.dart';
import '../../model/client.dart';
import 'client.add.dart';
import 'client.controller.dart';
import 'dart:convert';

import 'client.edit.dart';
import 'client.view.dart';

class ClientPageDesign extends StatefulWidget {
  const ClientPageDesign({Key key}) : super(key: key);

  @override
  ClientPageDesignState createState() => ClientPageDesignState();
}

class ClientPageDesignState extends State<ClientPageDesign> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final http = Http();

  String search, chipText = "";

  List dataHttp = [];
  List dataSearch = [];
  num countDataSearch = 0;

  void dataClient() async {
    dataSearch = await http.getHttpFuture('/clientes');
  }

  Future loadData() async {
    await http.getHttp('/clientes').then((value) => setState(() {
          dataHttp = value;
          dataSearch = value;
          print("dataSearch");
          print(dataSearch);
        }));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    loadData();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("didChangeDependencies");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("dispose");
  }

  // Colors that we use in our app
  var kPrimaryColor = Color(0xFF0C9869);
  var kTextColor = Color(0xFF3C4046);
  var kBackgroundColor = Color(0xFFF9F8FD);

  double kDefaultPadding = 20.0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
      ),
      body: Container(
        //margin: EdgeInsets.only(bottom: kDefaultPadding),
        height: size.height * 0.2,
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                left: kDefaultPadding,
                right: kDefaultPadding,
                bottom: kDefaultPadding,
              ),
              height: size.height,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Row(
                children: <Widget>[
                  Text(
                    'List of Clients',
                    style: Theme.of(context).textTheme.headline5.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  //Image.asset("assets/images/logo.png")
                ],
              ),
            ),
            Container(
              child: Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: SearchField()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
