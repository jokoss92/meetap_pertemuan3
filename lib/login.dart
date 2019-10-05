import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  String name = '';
  String pass = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Form'),
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: <Widget>[_username(context), _password(context), _buttonLogin(context)],
        ),
      ),
    );
  }

  String validatePass(String value){
    if(value.isEmpty){
      return 'Password harus diisi';
    } else 
    if(value.length<4){
      return 'Password minimal 4 karakter';
    }
    return null;
  }

  void submit(){
    if(formKey.currentState.validate()){
      formKey.currentState.save();
      print('Username : $name');
      print('Password : $pass');
    }
  }

  String validateUser(String value){
    if(value.isEmpty){
      return 'Username harus diisi';
    }
    return null;
  }

  Widget _username(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        validator: validateUser,
        onSaved: (String value) {
          name = value;
        },
        key: Key('username'),
        decoration:
            InputDecoration(hintText: 'username', labelText: 'username'),
        style: TextStyle(fontSize: 20.0, color: Colors.black),
      ),
    );
  }

  Widget _password(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        validator: validatePass,
        onSaved: (String value) {
          pass = value;
        },
        key: Key('password'),
        decoration:
            InputDecoration(hintText: 'password', labelText: 'password'),
        style: TextStyle(fontSize: 20.0, color: Colors.black),
      ),
    );
  }

  Widget _buttonLogin (BuildContext context){
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: new InkWell(
        onTap: (){
          submit();
        },
        child: new Container(
          //width: 100.0,
          height: 50.0,
          decoration: new BoxDecoration(
            color: Colors.blueAccent,
            border: new Border.all(color: Colors.white, width: 2.0),
            borderRadius: new BorderRadius.circular(10.0),
          ),
          child: new Center(
            child: new Text('Login', 
            style: new TextStyle
            (fontSize: 18.0, color: Colors.white),),
          ),
        ),
      ),
    );
  }
}
