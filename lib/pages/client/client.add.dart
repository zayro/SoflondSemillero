import 'package:app_flutter/model/client.dart';
import 'package:app_flutter/service/http/index.dart';
import 'package:app_flutter/widgets/alert.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class ClientAddPage extends StatefulWidget {
  ClientAddPage({Key key}) : super(key: key);

  @override
  ClientAddPageState createState() => ClientAddPageState();
}

class ClientAddPageState extends State<ClientAddPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController controllerID = new TextEditingController();
  TextEditingController controllerName = new TextEditingController();
  String avatar = '';

  Map dataSearch;
  final http = Http();
  ClientModel getInfo;
  String event = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.

    return Scaffold(
        appBar: AppBar(
          title: Text("Add"),
          leading: IconButton(
              icon: Icon(Icons.cancel),
              onPressed: () {
                // handle delete here
                Navigator.pop(context, event);
              }),
        ),
        body: Container(
          margin: EdgeInsets.all(20),
          child: Form(
              key: _formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      enabled: true,
                      controller: controllerName,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }

                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: 'NAME',
                        hintText: 'NAME',
                      ),
                      //initialValue: dataSearch['name'],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          // Validate will return true if the form is valid, or false if
                          // the form is invalid.
                          if (_formKey.currentState.validate()) {
                            final dataSend = {'name': controllerName.text};

                            http.postHttp('clientes/', dataSend).then((res) {
                              print(res['status']);
                              if (res['status'] == 'true') {
                                setState(() {
                                  event = controllerName.text;
                                });

                                showDialog(
                                    context: context,
                                    child: Alert(
                                        title: 'Created',
                                        message: 'data was created',
                                        type: 'success'));
                              }
                            });
                          }
                        },
                        child: Text('Submit'),
                      ),
                    ),
                  ])),
        ));
  }
}
