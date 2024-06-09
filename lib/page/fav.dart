// ignore_for_file: must_be_immutable, unnecessary_import

import 'package:flutter/material.dart';
import 'package:flutter_application_notepad/controler/notecontro.dart';
import 'package:flutter_application_notepad/model/notem.dart';
import 'package:flutter_application_notepad/uti/color.dart';
import 'package:flutter_application_notepad/uti/icon.dart';
import 'package:flutter_application_notepad/uti/textsty.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Fav extends StatelessWidget {
  Notecont notec = Get.put(Notecont());
  final Box FavNotes = Hive.box("FavNotes");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite"),
        backgroundColor: Mycolor.white,
      ),
      body: GetBuilder<Notecont>(
        builder: (_) {
          return ValueListenableBuilder(
              valueListenable: FavNotes.listenable(),
              builder: (context, FavNotes, child) {
                return ListView.builder(
                    itemCount: FavNotes.keys.length,
                    itemBuilder: (context, index) {
                      NoteMo not = FavNotes.getAt(index);
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      not.title,
                                      style: TxtStys.titleTxtSty,
                                    ),
                                  ),
                                  Container(
                                      width: 90,
                                      child: InkWell(
                                        onTap: () {
                                          notec.deletfavitem(index);
                                        },
                                        child: Icon(
                                          Myicon.fav,
                                          color: Mycolor.red,
                                        ),
                                      ))
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                not.descrip,
                                style: TxtStys.desTxtSty,
                              ),
                              Text(
                                not.creatAt,
                                style: TxtStys.dataTxtSty,
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              });
        },
      ),
    );
  }
}
