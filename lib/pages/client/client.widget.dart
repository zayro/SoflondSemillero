import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:provider/provider.dart';

import '../../service/provider/search.dart';

import '../../widgets/search_field.dart';
import '../../model/client.dart';

class ClientPage extends StatefulWidget {
  const ClientPage({Key key}) : super(key: key);

  @override
  _ClientPageState createState() => _ClientPageState();
}

class _ClientPageState extends State<ClientPage> {
  final provider = ProviderClient();

  //var provider = Provider.of<ProviderClient>(context);
  final data = ClientModel();
  //var json = jsonEncode(ClientModel().toJson());

  String search = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(clients.toList());
    print(clients.length);

    print("initState : " + provider.search);

    print(clients.where((element) => (element["title"].contains("Office"))));

    setState(() {
      search = provider.search;
    });
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var providers = Provider.of<ProviderClient>(context, listen: true).search;

    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          toolbarOpacity: 0.9,
          elevation: 0.1,
        ),
        body: Container(
          child: Column(
            children: [
              Center(child: SearchField()),
              Center(
                child: Text(providers),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: clients.length,
                    itemBuilder: (BuildContext ctxt, int Index) {
                      return new Text("# $Index");
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
