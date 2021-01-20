import 'package:app_flutter/model/client.dart';
import 'package:app_flutter/service/http/index.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class ClientEditPage extends StatefulWidget {
  final id;
  ClientEditPage({Key key, this.id}) : super(key: key);

  @override
  ClientEditPageState createState() => ClientEditPageState();
}

class ClientEditPageState extends State<ClientEditPage> {
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

    http.getHttp('/clientes/${widget.id}').then((value) => setState(() {
          setState(() {
            dataSearch = value;
            print(dataSearch);
            getInfo = ClientModel.fromJson(value);
            //print(getInfo.toJson());

            controllerID.text = getInfo.id;
            controllerName.text = getInfo.name;
            avatar = getInfo.image;
          });
        }));
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.

    return Scaffold(
        appBar: AppBar(
          title: Text("Edit"),
          backgroundColor: Colors.orange,
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
                      keyboardType: TextInputType.number,
                      //initialValue: dataSearch['id'],
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: 'ID',
                        hintText: 'ID',
                      ),
                    ),
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

                            http
                                .putHttp('clientes/${widget.id}', dataSend)
                                .then((res) {
                              print(res['status']);
                              if (res['status'] == 'true') {
                                setState(() {
                                  event = controllerName.text;
                                });

                                showDialog(
                                    context: context,
                                    child: Alert(
                                        title: 'Updated',
                                        message: 'data was updated',
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

class Alert extends StatelessWidget {
  final String title, message, type;
  const Alert({this.title, this.message, this.type});

  @override
  Widget build(BuildContext context) {
    Icon icono;

    switch (this.type) {
      case 'success':
        icono = Icon(Icons.check, size: 50, color: Colors.green);
        break;
      case 'warninig':
        icono = Icon(Icons.warning, size: 50, color: Colors.orange);
        break;
      case 'error':
        icono = Icon(Icons.error, size: 50, color: Colors.red);
        break;
      default:
    }
    return AlertDialog(
      title: Text(this.title),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            icono,
            Center(child: Text(this.message)),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('Close'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
