// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application_notepad/controler/notecontro.dart';
import 'package:flutter_application_notepad/model/notem.dart';
import 'package:flutter_application_notepad/uti/color.dart';
import 'package:flutter_application_notepad/uti/icon.dart';
import 'package:flutter_application_notepad/uti/textsty.dart';
import 'package:get/get.dart';

class NoteDtPg extends StatelessWidget {
  Notecont notecont = Get.put(Notecont());

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> note = Get.arguments;
    String title = note['Title'];
    String description = note['Description'];
    String Create_At = note['Create_At'];

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Mycolor.white,
        actions: [
          InkWell(
            onTap: () {
              notecont.addfavitem(NoteMo(title, description, Create_At));
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(
                Myicon.fav,
                color: Mycolor.red,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Create_At,
                style: TxtStys.dataTxtSty,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                description,
                style: TxtStys.desTxtSty,
              )
            ],
          ),
        ),
      ),
    );
  }
}
