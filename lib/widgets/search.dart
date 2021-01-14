import 'package:flutter/material.dart';

class InputSearch extends StatelessWidget {
  const InputSearch({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 20, bottom: 20),
        //color: Colors.white,
        child: TextField(
            decoration: InputDecoration(
          labelText: 'Search here',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderSide: new BorderSide(color: Colors.teal),
            borderRadius: BorderRadius.circular(30),
          ),
        )));
  }
}
