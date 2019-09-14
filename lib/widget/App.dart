import 'package:flutter/material.dart';

import '../helper/config.dart' as appConfig;
import './Absence.dart' as widgetAbsence;
import './Salary.dart' as widgetSalary;
import './Home.dart' as widgetHome;

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appConfig.strings.app_title,
      home: Layout(),
      routes: <String,WidgetBuilder>{
        'urlSalary':(BuildContext context) => widgetSalary.Salary(),
        'urlAbsen':(BuildContext context) => widgetAbsence.Absence(),
        'urlHome' : (BuildContext context) => widgetHome.Home(),
      },
    );
  }
}

class Layout extends StatefulWidget {
  Layout({Key key}) : super(key: key);
 
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> with SingleTickerProviderStateMixin{
  TabController controller;

  void initState(){
    controller = new TabController(length: 3, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: appConfig.colors.ColorPrimaryDark,
        title: Text(appConfig.strings.app_name),
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
          new widgetSalary.Salary()
        ],
      ),

      bottomNavigationBar: new Material(
        color: appConfig.colors.ColorPrimaryDark,
        child: TabBar(
          controller: controller,
          tabs: <Widget>[
            new Tab(
              icon: Icon(appConfig.icons.icon_home),
              text: appConfig.strings.text_home,
            ),
            new Tab(
              icon: Icon(appConfig.icons.icon_absence),
              text: appConfig.strings.text_absence,
            ),
            new Tab(
              icon: Icon(appConfig.icons.icon_sallary),
              text: appConfig.strings.text_sallary,
            ),
          ],
        ),
      ),
    );
    
  }
}

