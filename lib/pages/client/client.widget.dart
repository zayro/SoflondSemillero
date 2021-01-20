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

class ClientPage extends StatefulWidget {
  const ClientPage({Key key}) : super(key: key);

  @override
  ClientPageState createState() => ClientPageState();
}

class ClientPageState extends State<ClientPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Intro intro;

  ClientPageState() {
    /// init Intro
    intro = Intro(
      stepCount: 2,

      /// use defaultTheme, or you can implement widgetBuilder function yourself
      widgetBuilder: StepWidgetBuilder.useDefaultTheme(
        texts: [
          'This button you can add new client',
          'you can search in text box for a client.',
        ],
        buttonTextBuilder: (currPage, totalPage) {
          return currPage < totalPage - 1 ? 'Next' : 'Finish';
        },
      ),
    );
  }

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
    final providers = Provider.of<ProviderSearch>(context);

    Size size = MediaQuery.of(context).size;

    // set up the AlertDialog
    AlertDialog alert(id) {
      return AlertDialog(
        title: Text("Alert"),
        content: Text("Would you like to continue deleting this row?"),
        actions: [
          FlatButton(
            child: Text("Cancel"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          FlatButton(
            child: Text("Continue"),
            onPressed: () async {
              await http.deleteHttp('/clientes/$id');
              Navigator.pop(context);
              await loadData();
              await showDialog(
                  context: context,
                  child: Alert(
                      title: 'Deleted',
                      message: 'data was deleted',
                      type: 'success'));
            },
          ),
        ],
      );
    }

    PopupMenuButton button(id) {
      return PopupMenuButton(
          //key: UniqueKey(),
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
          onSelected: (value) async {
            print(id);
            print(value);
            switch (value) {
              case "View":
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => ClientViewPage(id: id),
                    fullscreenDialog: true,
                  ),
                );
                break;
              case "Edit":
                String save = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => ClientEditPage(id: id),
                    fullscreenDialog: true,
                  ),
                );

                if (save != '') {
                  await loadData();
                  providers.search = save;
                }
                break;

              case "Delete":
                showDialog(context: context, child: alert(id));
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

    return WillPopScope(
      child: Container(
        child: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            //title: Text("List of Clients"),
            //backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            toolbarOpacity: 0.9,
            elevation: 0.1,
            actions: [
              Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                    onTap: () {
                      intro.start(context);
                    },
                    child: Icon(
                      Icons.help,
                      size: 26.0,
                    ),
                  )),
            ],
          ),
          body: Container(
            //margin: EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  height: size.height * 0.2,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        height: size.height,
                        padding: EdgeInsets.only(
                          left: kDefaultPadding,
                          right: kDefaultPadding,
                          bottom: kDefaultPadding,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40),
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'List of Clients',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                            ),
                            //Spacer(),
                            //Image.asset("assets/images/logo.png")
                          ],
                        ),
                      ),
                      Container(
                        child: Positioned(
                          bottom: 15,
                          left: 0,
                          right: 0,
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(
                                horizontal: kDefaultPadding),
                            //padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: (dataHttp.isNotEmpty)
                                ? Center(
                                    key: intro.keys[1], child: SearchField())
                                : CircularProgressIndicator(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (providers.search.isNotEmpty)
                  Center(
                    child: InputChip(
                      avatar: Icon(Icons.delete),
                      onPressed: () {
                        providers.search = "";
                      },
                      label: Text(providers.search),
                    ),
                  ),
                Expanded(
                    child: ListView.builder(
                        itemCount: dataSearch.length ?? 0,
                        itemBuilder: (BuildContext ctxt, int index) {
                          //Map dataSearch = clients as Map;
                          Map object = dataSearch[index] as Map;
                          //print(index);

                          return Card(
                              child: ListTile(
                                  title: Text(
                                      "${object['id']} - ${object['name']} "),
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
                                      chipText = providers.search;
                                    });

                                    //state.showButtonMenu();
                                  }));
                        })),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            key: intro.keys[0],

            onPressed: () async {
              // Add your onPressed code here!
              String save = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => ClientAddPage(),
                  fullscreenDialog: true,
                ),
              );

              if (save != '') {
                await loadData();
                providers.search = save;
              }
            },

            child: Icon(Icons.add),
            //backgroundColor: Colors.green,
          ),
        ),
      ),
      onWillPop: () {
        // destroy guide page when tap back key
        intro.dispose();
        return Future.value(true);
      },
    );
  }
}
