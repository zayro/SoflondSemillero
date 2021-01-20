import 'package:app_flutter/service/http/index.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class ClientViewPage extends StatefulWidget {
  final id;
  ClientViewPage({Key key, this.id}) : super(key: key);

  @override
  ClientViewPageState createState() => ClientViewPageState();
}

class ClientViewPageState extends State<ClientViewPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController controllerID = new TextEditingController();
  TextEditingController controllerName = new TextEditingController();
  String avatar = '';

  Map dataSearch = {};
  final http = Http();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    http.getHttp('/clientes/${widget.id}').then((value) => setState(() {
          setState(() {
            dataSearch = value;
            print(dataSearch);
            controllerID.text = dataSearch['id'];
            controllerName.text = dataSearch['name'];
            avatar = dataSearch['image'];
          });
        }));
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('View'),
        ),
        body: Container(
          margin: EdgeInsets.all(20),
          child: Form(
              key: _formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    if (avatar.isNotEmpty)
                      Center(
                        child: Container(
                            width: 190.0,
                            height: 190.0,
                            decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                image: new DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(
                                      avatar,
                                    )))),
                      ),
                    TextFormField(
                      enabled: false,
                      controller: controllerID,
                      //initialValue: dataSearch['id'],
                      decoration: const InputDecoration(
                        labelText: 'ID',
                        hintText: 'ID',
                      ),
                    ),
                    TextFormField(
                      enabled: false,
                      controller: controllerName,
                      decoration: const InputDecoration(
                        labelText: 'NAME',
                        hintText: 'NAME',
                      ),
                      //initialValue: dataSearch['name'],
                    ),
                  ])),
        ));
  }
}
