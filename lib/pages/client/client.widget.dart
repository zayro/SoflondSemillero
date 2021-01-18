import 'package:app_flutter/service/http/index.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:provider/provider.dart';

import '../../service/provider/search.dart';

import '../../widgets/search_field.dart';
import '../../model/client.dart';
import 'client.controller.dart';
import 'dart:convert';

import 'client.view.dart';

class ClientPage extends StatefulWidget {
  const ClientPage({Key key}) : super(key: key);

  @override
  ClientPageState createState() => ClientPageState();
}

class ClientPageState extends State<ClientPage> {
  //var provider = Provider.of<ProviderClient>(context);
  //var json = jsonEncode(ClientModel().toJson());

  final http = Http();

  String search, chipText = "";

  List dataHttp = [];
  List dataSearch = [];
  num countDataSearch = 0;
  final GlobalKey _menuKey = new GlobalKey();

  void dataClient() async {
    dataSearch = await http.getHttpBasic('/clientes');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    http.getHttpBasic('/clientes').then((value) => setState(() {
          dataHttp = value;
          dataSearch = value;
          print("dataSearch");
          print(dataSearch);
        }));
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final providers = Provider.of<ProviderSearch>(context);

    final AlertDialog dialog = AlertDialog(
      title: Text('Title'),
      contentPadding: EdgeInsets.zero,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (int i = 1; i <= 3; i++)
            ListTile(
              title: Text(
                'option $i',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    .copyWith(color: Colors.blue),
              ),
              leading: Radio(
                value: i,
                groupValue: 1,
                onChanged: (_) {},
              ),
            ),
        ],
      ),
      actions: [
        FlatButton(
          textColor: Colors.blue,
          onPressed: () => Navigator.pop(context),
          child: Text('ACTION 1'),
        ),
        FlatButton(
          textColor: Colors.blue,
          onPressed: () => Navigator.pop(context),
          child: Text('ACTION 2'),
        ),
      ],
    );

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
            switch (value) {
              case "View":
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => ClientViewPage(),
                    fullscreenDialog: true,
                  ),
                );
                break;
              case "Edit":
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => ClientViewPage(),
                    fullscreenDialog: true,
                  ),
                );
                break;
              default:
            }
          });
    }

    if (providers.search.isNotEmpty) {
      dataSearch = dataHttp
          .where((element) => (element["name"].contains(providers.search)))
          .toList();
      countDataSearch = dataSearch.length;
    } else {
      countDataSearch = 0;
      dataSearch = [];
    }

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
                child: Chip(
                  label: Text(chipText),
                ),
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: dataSearch.length ?? 0,
                      itemBuilder: (BuildContext ctxt, int index) {
                        //Map dataSearch = clients as Map;
                        Map object = dataSearch[index] as Map;

                        return Card(
                            child: ListTile(
                                title:
                                    Text("${index + 1} - ${object['name']} "),
                                leading:
                                    Icon(Icons.supervised_user_circle_sharp),
                                trailing: button(object['id']),
                                //selected: true,
                                onTap: () {
                                  // This is a hack because _PopupMenuButtonState is private.
                                  //dynamic state = _menuKey.currentState;
                                  print(object['name']);
                                  setState(() {
                                    providers.search = object['name'];
                                    chipText = object['name'];
                                  });

                                  //state.showButtonMenu();
                                }));
                      })),
            ],
          ),
        ),
      ),
    );
  }
}
