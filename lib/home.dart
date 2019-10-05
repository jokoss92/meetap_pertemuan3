import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String nama = "";

  Future _cekLogin() async{
        //SHAREDPREFERENCES
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.getBool("isLogin")==false) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => new Login()));
    }
  }

   Future _logout() async{
        //SHAREDPREFERENCES
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool("isLogin", false);

    Navigator.push(
    context, MaterialPageRoute(builder: (context) => new Login()));
  }

  Future _cekUser() async{
        //SHAREDPREFERENCES
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.getString("userName")!=null) {
      setState(() {
        nama =  pref.getString("userName");
      });
    }
  }

  @override
  void initState() { 
    super.initState();
    _cekUser();
    _cekLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Halaman Home"),),
      body: Center(
        child: Column(
          children: <Widget>[

            //TEXT
              Text("Welcome :" + nama),
            //BUTTON
              _buttonLogout(context),
              
          ],
        )
      ),
    );
  }

    Widget _buttonLogout(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: new InkWell(
        onTap: () {
         _logout();
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
              'Logout',
              style: new TextStyle(fontSize: 18.0, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

}