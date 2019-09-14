import 'package:flutter/material.dart';
import '../helper/config.dart' as appConfig;

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: appConfig.colors.ColorPrimaryDark,
      body: GridView.count(
        crossAxisCount: 3,
        children: <Widget>[
          new customGrid(
            icon: appConfig.icons.icon_home,
            iconTitle: appConfig.strings.text_home,
            iconColor: appConfig.colors.ColorIcon,
            textColor: appConfig.colors.ColorTeks,
            iconSize: 80.0,
            urlWidget: '/urlHome',
          ),
          new customGrid(
            icon: appConfig.icons.icon_absence,
            iconTitle: appConfig.strings.text_absence,
            iconColor: appConfig.colors.ColorIcon,
            textColor: appConfig.colors.ColorTeks,
            iconSize: 80.0,
            urlWidget: '/urlAbsen',
          ),
          new customGrid(
            icon: appConfig.icons.icon_sallary,
            iconTitle: appConfig.strings.text_sallary,
            iconColor: appConfig.colors.ColorIcon,
            textColor: appConfig.colors.ColorTeks,
            iconSize: 80.0,
            urlWidget: '/urlSallary',
          ),
          new customGrid(
            icon: appConfig.icons.icon_sallary,
            iconTitle: appConfig.strings.text_sallary,
            iconColor: appConfig.colors.ColorIcon,
            textColor: appConfig.colors.ColorTeks,
            iconSize: 80.0,
            urlWidget: '/urlSallary',
          ),
        ],
      ),
      
    );
  }
}

class customGrid extends StatelessWidget {
  final IconData icon;
  final String iconTitle, urlWidget;
  final Color iconColor, textColor;
  final double iconSize;

  customGrid(
    {
      this.urlWidget,
      this.textColor,
      this.iconTitle,
      this.iconColor,
      this.iconSize,
      this.icon
    }
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(6.0),
      color: appConfig.colors.ColorPrimary,
      child: RaisedButton(
        color: appConfig.colors.ColorPrimary,
        child: Column(
          children: <Widget>[
            Icon(
              icon,
              size: iconSize,
              color: iconColor),
            Text(
              iconTitle,
              style: TextStyle(color: textColor),)
          ],
        ),
        onPressed: (){
          Navigator.pushNamed(context, urlWidget);
        },
        ),

    );
  }
}