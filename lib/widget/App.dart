import 'package:flutter/material.dart';
import 'package:meetap_sikar/login.dart';
import '../helper/config.dart' as appConfig;

import './Home.dart' as widgetHome;
import './Absence.dart' as widgetAbsence;
import './Salary.dart' as widgetSallary;
import './Profile.dart' as widgetProfile;
import './NewEmp.dart' as widgetNewEmp;


class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appConfig.strings.app_name,
      home: Login(),
      //NAVIGATION ROUTE
      routes: <String,WidgetBuilder>{
        '/urlProfile' : (BuildContext context) => widgetProfile.Profile(),
        '/urlNewEmp' : (BuildContext context) => widgetNewEmp.NewEmp(),
              
      },
    );
  }

}

class Layout extends StatefulWidget{
  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> with SingleTickerProviderStateMixin{

  TabController controller;

  @override

  void initState(){
    controller = new TabController(length: (3), vsync: this);
    super.initState();
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      
      //HEADER
      appBar: new AppBar(
        backgroundColor: appConfig.colors.ColorPrimaryDark,
        title: new Text(appConfig.strings.app_title),
        leading: Container(
          margin: EdgeInsets.all(10.0),
          child: Image.asset(appConfig.images.img_logo),
        ),
      ),

      //CONTENT
      body: new TabBarView(
        controller: controller,
          children: <Widget>[
            new widgetHome.Home(),
            new widgetAbsence.Absence(),
            widgetSallary.SallaryWidget(),
          ]
      ),
      
      //FLOATING ACTION BUTTON
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.pushNamed(context, '/urlProfile');
          },
        tooltip: appConfig.strings.text_profil,
        child: Icon(appConfig.icons.icon_profile),
        backgroundColor: appConfig.colors.ColorButton,
      ),

      //BOTTOM NAVIGATION BAR
      bottomNavigationBar: new Material(
        color: appConfig.colors.ColorPrimaryDark,
        child: TabBar(
          controller: controller,
            tabs: <Widget>[
              new Tab(
                icon: new Icon(appConfig.icons.icon_home),
                text: appConfig.strings.text_home,
              ),
              new Tab(
                icon: new Icon(appConfig.icons.icon_absence),
                text: appConfig.strings.text_absence,
              ),
              new Tab(
                icon: new Icon(appConfig.icons.icon_sallary),
                text: appConfig.strings.text_sallary,
              )
            ]
        ),
      ),

      
    );
  }
  
}