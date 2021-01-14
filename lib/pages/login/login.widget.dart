import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                  initialValue: '',
                  autofocus: false,
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
                TextFormField(
                  cursorColor: Theme.of(context).cursorColor,
                  initialValue: '',
                  autofocus: false,
                  obscureText: true,
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
                    onPressed: () {
                      // Respond to button press
                      Navigator.pushNamed(context, '/home');
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
    );
  }
}
