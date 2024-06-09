// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application_notepad/controler/notecontro.dart';
import 'package:flutter_application_notepad/model/notem.dart';
import 'package:flutter_application_notepad/routes/routes.dart';
import 'package:flutter_application_notepad/uti/color.dart';
import 'package:flutter_application_notepad/uti/icon.dart';
import 'package:flutter_application_notepad/uti/textsty.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

class Home extends StatelessWidget {
  final Box box = Hive.box("Notes");
  Notecont notec = Get.put(Notecont());
  TextEditingController titlec = TextEditingController();
  TextEditingController dis = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Note"),
        backgroundColor: Mycolor.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: GetBuilder<Notecont>(builder: (_) {
          return box.keys.length == 0
              ? Container(
                  width: Get.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.note,
                        size: 30.0,
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        "Empty Notes",
                        style: TxtStys.emptyTxtSty,
                      )
                    ],
                  ),
                )
              : ValueListenableBuilder(
                  valueListenable: box.listenable(),
                  builder: (context, Box, child) {
                    return ListView.builder(
                        itemCount: box.keys.length,
                        itemBuilder: (context, index) {
                          NoteMo not = box.getAt(index);
                          return InkWell(
                            onTap: () {
                              Get.toNamed(noteD, arguments: {
                                "Title": not.title,
                                "Description": not.descrip,
                                "Create_At": not.creatAt
                              });
                            },
                            child: Card(
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
                                          child: Row(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  notec.deletNote(index);
                                                },
                                                child: Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30),
                                                        color: Mycolor.red),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10.0),
                                                      child: Icon(
                                                        Myicon.delet,
                                                        color: Mycolor.white,
                                                        size: 18,
                                                      ),
                                                    )),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  openDialog(context, index);
                                                },
                                                child: Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30),
                                                        color: Mycolor.red),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10.0),
                                                      child: Icon(
                                                        Myicon.edit,
                                                        color: Mycolor.white,
                                                        size: 18,
                                                      ),
                                                    )),
                                              )
                                            ],
                                          ),
                                        )
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
                            ),
                          );
                        });
                  });
        }),
      ),
    );
  }

  openDialog(BuildContext context, int index) {
    showDialog(
        context: context,
        builder: (_) {
          return Center(
            child: SingleChildScrollView(
              child: AlertDialog(
                content: Column(
                  children: [
                    TextField(
                      controller: titlec,
                      decoration: InputDecoration(hintText: "Title"),
                    ),
                    TextField(
                      controller: dis,
                      decoration: InputDecoration(hintText: "Description"),
                    ),
                  ],
                ),
                actions: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Mycolor.white),
                      onPressed: () {
                        notec.updateNote(
                            NoteMo(titlec.text, dis.text,
                                DateTime.now().toString()),
                            index);
                        Navigator.pop(context);
                      },
                      child: Text("Cancle")),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Mycolor.white.withOpacity(0.5)),
                      onPressed: () {
                        var outputFormat = DateFormat('MM/dd/yy hh:mm a');
                        String creatAt = outputFormat.format(DateTime.now());
                        notec.updateNote(
                            NoteMo(titlec.text, dis.text, creatAt), index);
                        Navigator.pop(context);
                      },
                      child: Text("Update"))
                ],
              ),
            ),
          );
        });
  }
}
