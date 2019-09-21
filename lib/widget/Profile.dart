import 'package:flutter/material.dart';
import '../helper/config.dart' as appConfig;

class Profile extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //HEADER
      appBar: new AppBar(
        title: new Text(appConfig.strings.text_profil),
        backgroundColor: appConfig.colors.ColorPrimary,
        //tombol back
        leading: InkWell(
          child: Icon(appConfig.icons.icon_back,
          color: appConfig.colors.ColorTeks,),
          onTap: (){
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: appConfig.colors.ColorPrimaryDark,
      body: new Center(
        child: Text("Profile",style: TextStyle(color: Colors.white),),
      ),
    );
  }

}

