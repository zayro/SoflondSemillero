import 'package:app_flutter/service/http/index.dart';
import 'package:flutter/material.dart';

class ClientViewPage extends StatefulWidget {
  final id;
  ClientViewPage({Key key, this.id}) : super(key: key);

  @override
  _ClientViewPageState createState() => _ClientViewPageState();
}

class _ClientViewPageState extends State<ClientViewPage> {
  final _formKey = GlobalKey<FormState>();

  List dataSearch = [];
  final http = Http();

  dataClient() async {
    dataSearch = await http.getHttp(
        'https://6001ffb108587400174db895.mockapi.io/api/v1/clientes/${widget.id}');
  }

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
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Enter your Name',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          // Validate will return true if the form is valid, or false if
                          // the form is invalid.
                          if (_formKey.currentState.validate()) {
                            // Process data.
                          }
                        },
                        child: Text('Submit'),
                      ),
                    ),
                  ])),
        ));
  }
}
