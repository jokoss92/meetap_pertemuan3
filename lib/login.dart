import 'package:flutter/material.dart';
import 'home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  //snackbar
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final nameController = TextEditingController();
  final passController = TextEditingController();

  String name = '';
  String pass = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Login Form'),
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            _username(context),
            _password(context),
            _buttonLogin(context),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _cekLogin();
  }

  Future _cekLogin() async{
        //SHAREDPREFERENCES
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.getBool("isLogin")) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => new Home()));
    }
  }

  String validatePass(String value) {
    if (value.length < 4) {
      return 'Password Minimal 4 Karakter';
    }
    return null;
  }

  String validateUser(String value) {
    if (value.isEmpty) {
      return 'Username harus diisi';
    }
    return null;
  }

  void submit() async {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      print(nameController.value.text);

      if (nameController.value.text == "2001") {
        if (passController.value.text == "12345678") {
          //SHAREDPREFERENCES
          SharedPreferences pref = await SharedPreferences.getInstance();
          pref.setBool("isLogin", true);
          pref.setString("userName", nameController.value.text);
          //pindah ke home
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => new Home()));
        } else {
          //SHAREDPREFERENCES
          SharedPreferences pref = await SharedPreferences.getInstance();
          pref.setBool("isLogin", false);

          SnackBar snackBar2 = SnackBar(
            content: Text(
              'Invalid Password',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.green,
          );
          scaffoldKey.currentState.showSnackBar(snackBar2);
        }
      } else {
        //SHAREDPREFERENCES
        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.setBool("isLogin", false);

        SnackBar snackBar2 = SnackBar(
          content: Text(
            'Invalid User',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.green,
        );
        scaffoldKey.currentState.showSnackBar(snackBar2);
      }
    }
  }

  Widget _username(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        controller: nameController,
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
        controller: passController,
        validator: validatePass,
        onSaved: (String value) {
          pass = value;
        },
        key: Key('password'),
        decoration:
            InputDecoration(hintText: 'password', labelText: 'password'),
        style: TextStyle(fontSize: 20.0, color: Colors.black),
        obscureText: true,
      ),
    );
  }

  Widget _buttonLogin(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: new InkWell(
        onTap: () {
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
            child: new Text(
              'Login',
              style: new TextStyle(fontSize: 18.0, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}