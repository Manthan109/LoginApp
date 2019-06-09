import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomLoginForm extends StatefulWidget {
  @override
  _CustomLoginFormState createState() => _CustomLoginFormState();
}

class _LoginData {
  String value = "";
  String password = "";
}

class _CustomLoginFormState extends State<CustomLoginForm> {
  final _formKey = GlobalKey<FormState>();

  _LoginData _data = new _LoginData();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
                child: Image.asset(
              "images/face.png",
              height: 90,
              width: 90,
            )),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Name",
                    border: OutlineInputBorder(
                        gapPadding: 2.3,
                        borderRadius: BorderRadius.circular(5.0))),
                validator: (name) {
                  if (name.isEmpty) {
                    return "Please Enter Your Name";
                  } else {
                    _data.value = name;
                  }
                },
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(
                          gapPadding: 2.3,
                          borderRadius: BorderRadius.circular(5.0))),
                  validator: (pass) {
                    if (pass.isEmpty) {
                      return "Please Enter The Password";
                    } else {
                      _data.password = pass;
                    }
                  },
                )),
            Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text("Welcome ${_data.value.toString()}!"),
                        ));
                      }
                    },
                    child: Text("Submit")),
                RaisedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.reset();
                      }
                    },
                    child: Text("Clear"))
              ],
            ))
          ],
        ));
  }
}
