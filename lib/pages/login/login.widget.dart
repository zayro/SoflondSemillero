import 'package:app_flutter/service/http/index.dart';
import 'package:app_flutter/widgets/alert.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController controllerUser = new TextEditingController();
  TextEditingController controllerPassword = new TextEditingController();
  final http = Http();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //appBar: AppBar(title: Text("Login")),
        //backgroundColor: Theme.of(context).primaryColor,
        resizeToAvoidBottomPadding: false,
        body: Container(
          //color: Colors.white,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.grey[50], Colors.lightBlue[500]]),
            image: DecorationImage(
                image: AssetImage("assets/images/background/trees.png"),
                repeat: ImageRepeat.repeat
                //fit: BoxFit.scaleDown,
                ),
          ),
          child: Container(
            margin: EdgeInsets.only(top: 40, left: 40, right: 40),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                    child: FlutterLogo(
                      size: 100,
                      curve: Curves.bounceOut,
                    ),
                  ),
                  SizedBox(height: 50),
                  Center(
                    child: Text('WELCOME APP',
                        style: GoogleFonts.fredokaOne(
                          textStyle: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 40),
                          //color: Theme.of(context).accentColor),
                        )),
                  ),
                  SizedBox(height: 50),
                  TextFormField(
                    cursorColor: Theme.of(context).cursorColor,
                    //initialValue: '',
                    controller: controllerUser,
                    //autofocus: false,
                    key: Key('controllerUser'),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }

                      return null;
                    },
                    style: TextStyle(fontSize: 18.0, color: Colors.grey),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[50],
                      contentPadding: new EdgeInsets.symmetric(vertical: 10.0),
                      /* focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(25.7),
                    ), */
                      enabledBorder: UnderlineInputBorder(
                        //borderSide: BorderSide(color: Colors.white),
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(25.7),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 25, right: 25),
                        child: Icon(
                          Icons.email,
                          size: 30,
                          color: Theme.of(context).primaryColor,
                        ), // myIcon is a 48px-wide widget.
                      ),
                      //icon: Icon(Icons.email),
                      labelText: 'Email',
                      labelStyle: TextStyle(
                          //color: Theme.of(context).primaryColor,
                          color: Colors.grey),
                      //helperText: 'Helper text',
                    ),
                  ),
                  SizedBox(height: 50),
                  // input password
                  TextFormField(
                    cursorColor: Theme.of(context).cursorColor,
                    //initialValue: '',
                    //autofocus: false,
                    obscureText: true,
                    controller: controllerPassword,
                    key: Key('controllerPassword'),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[50],
                      contentPadding: new EdgeInsets.symmetric(vertical: 10.0),
                      //border: OutlineInputBorder(),
                      //border: UnderlineInputBorder(),
                      enabledBorder: UnderlineInputBorder(
                        //borderSide: BorderSide(color: Colors.white),
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(25.7),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 25, right: 25),
                        child: Icon(
                          Icons.lock,
                          size: 30,
                          color: Theme.of(context).primaryColor,
                        ), // myIcon is a 48px-wide widget.
                      ),
                      labelText: 'Password',
                      labelStyle: TextStyle(
                          //color: Theme.of(context).primaryColor,
                          color: Colors.grey),
                      //helperText: 'Helper text',
                    ),
                  ),
                  SizedBox(height: 30),
                  SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: RaisedButton(
                      key: Key('boton_enviar'),
                      onPressed: () async {
                        // Respond to button press
                        if (_formKey.currentState.validate()) {
                          await http
                              .login(
                                  controllerUser.text, controllerPassword.text)
                              .then((value) => {
                                    if (value)
                                      {Navigator.pushNamed(context, '/client')}
                                    else
                                      {
                                        showDialog(
                                            context: context,
                                            child: Alert(
                                                title: 'Warning',
                                                message:
                                                    'Error typing your data',
                                                type: 'warning'))
                                      }
                                  });

                          //Navigator.pushNamed(context, '/client');
                        }
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      color: Theme.of(context).primaryColorDark,
                      //icon: Icon(Icons.send, size: 20),
                      child: Text("  LOGIN",
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ),
                  ),
                  SizedBox(height: 30),
                  SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: RaisedButton(
                      onPressed: () {
                        // Respond to button press
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      color: Theme.of(context).primaryColorLight,
                      child: Text("SIGNUP",
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
