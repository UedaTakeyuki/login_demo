import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final formKey = new GlobalKey<FormState>();

  String _email;
  String _password;

  bool validateAndSave(){
    final form = formKey.currentState;
    if (form.validate()){
      form.save();
      return true;
    } else {
      return false;
    }
  }

  void validateAndSubmit(){
    if(validateAndSave()){

    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('flutter login demo'),
      ),
      body: new Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: new Form(
            key: formKey,
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                new TextFormField(
                  decoration: new InputDecoration(
                    labelText: 'Email',
                  ),
                  validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
                  onSaved: (value) => _email = value,
                ),
                new TextFormField(
                  decoration: new InputDecoration(
                    labelText: 'Password',
                  ),
                  validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
                  obscureText: true,
                  onSaved: (value) => _password = value,
                ),
                new RaisedButton(
                  onPressed: validateAndSubmit,
                  child: new Text('Login', style: new TextStyle(fontSize: 20.0),),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}