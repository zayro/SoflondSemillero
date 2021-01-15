import 'dart:convert';

import 'package:app_flutter/service/http/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:provider/provider.dart';

import '../../service/provider/search.dart';

import '../../widgets/search_field.dart';
import '../../model/client.dart';
import 'client.controller.dart';

class ClientPage extends StatefulWidget {
  const ClientPage({Key key}) : super(key: key);

  @override
  _ClientPageState createState() => _ClientPageState();
}

class _ClientPageState extends State<ClientPage> {
  //var provider = Provider.of<ProviderClient>(context);
  //var json = jsonEncode(ClientModel().toJson());

  final http = Http();

  String search = "";
  List dataSearch = [];
  num countDataSearch = 0;
  final GlobalKey _menuKey = new GlobalKey();

  Future _future;

  dataClient() async {
    _future = await http
        .getHttp('https://6001ffb108587400174db895.mockapi.io/api/v1/clientes');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final providers = Provider.of<ProviderClient>(context);

    PopupMenuButton button(id) {
      return PopupMenuButton(
          key: UniqueKey(),
          itemBuilder: (_) => <PopupMenuItem<String>>[
                PopupMenuItem<String>(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.pageview,
                          color: Colors.blue,
                        ),
                        Text('View')
                      ],
                    ),
                    value: 'View'),
                PopupMenuItem<String>(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.edit,
                          color: Colors.orange,
                        ),
                        Text('Edit')
                      ],
                    ),
                    value: 'Edit'),
                PopupMenuItem<String>(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        Text('Delete')
                      ],
                    ),
                    value: 'Delete'),
              ],
          onSelected: (value) {
            print(id);
            print(value);
          });
    }

    if (providers.search.isNotEmpty) {
      dataSearch = clients
          .where((element) => (element["name"].contains(providers.search)))
          .toList();
      countDataSearch = dataSearch.length;
    } else {
      countDataSearch = 0;
    }

//    final watch = context.watch<ClientController>();

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
                child: Text(providers.search),
              ),
              Expanded(
                  child: FutureBuilder(
                      future: http.getHttp(
                          'https://6001ffb108587400174db895.mockapi.io/api/v1/clientes'),
                      builder: (context, AsyncSnapshot snap) {
                        print("snap.data");
                        print(snap.data);

                        if (snap.hasData) {
                          return ListView.builder(
                              itemCount: snap.data.length ?? 0,
                              itemBuilder: (BuildContext ctxt, int index) {
                                //Map dataSearch = clients as Map;
                                Map object = snap.data[index] as Map;

                                return Card(
                                    child: ListTile(
                                        title: Text(
                                            "${index + 1} - ${object['name']} "),
                                        leading: Icon(
                                            Icons.supervised_user_circle_sharp),
                                        trailing: button(object['id']),
                                        //selected: true,
                                        onTap: () {
                                          // This is a hack because _PopupMenuButtonState is private.
                                          dynamic state = _menuKey.currentState;
                                          //state.showButtonMenu();
                                        }));
                              });
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      })),
            ],
          ),
        ),
      ),
    );
  }
}
