import 'package:flutter/material.dart';
import '../helper/config.dart' as appConfig;

class Absence extends StatelessWidget {
  
  final data_absen_tgl = appConfig.datas.data_absen_tgl;
  final data_absen_status = appConfig.datas.data_absen_status;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: appConfig.colors.ColorPrimaryDark,
      body: new Container(
        decoration: BoxDecoration(
          color: appConfig.colors.ColorPrimaryDark
        ),
        child: ListView.builder(
          itemCount: data_absen_tgl.length,
          itemBuilder: (context, index){
            final absen_tgl = data_absen_tgl[index];
            final absen_status = appConfig.absen.findAbsenStatus(data_absen_status[index]);
            final absen_icon = appConfig.absen.findAbsenIcon(data_absen_status[index]);

            return Container(
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(color: appConfig.colors.ColorPrimary),
              child: ListTile(
                //ICON
                leading: Image.asset(absen_icon),
                //STATUS
                title: Text(absen_status, 
                  style: TextStyle(
                  color: appConfig.colors.ColorTeks,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0
                  ),
                  ),
                  //TANGGAL
                  trailing: Text(
                    absen_tgl,
                    style: TextStyle(
                      color: appConfig.colors.ColorTeks,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0),),

              ),
            );
          },
        ),
      ),
      
    );
  }
}