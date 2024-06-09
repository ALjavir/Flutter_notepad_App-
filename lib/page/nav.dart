import 'package:flutter/material.dart';
import 'package:flutter_application_notepad/controler/notecontro.dart';
import 'package:flutter_application_notepad/model/notem.dart';
import 'package:flutter_application_notepad/page/fav.dart';
import 'package:flutter_application_notepad/page/home.dart';
import 'package:flutter_application_notepad/uti/color.dart';
import 'package:flutter_application_notepad/uti/icon.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Nav extends StatefulWidget {
  const Nav({super.key});

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  List<Widget> page = [Home(), Fav()];
  int index = 0;
  TextEditingController titlec = TextEditingController();
  TextEditingController dis = TextEditingController();
  Notecont notecont = Get.put(Notecont());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          shape: CircleBorder(),
          mini: true,
          backgroundColor: Mycolor.white,
          child: (Myicon.add),
          onPressed: () {
            openDialog(context);
          }),
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Myicon.home), label: "Note"),
            BottomNavigationBarItem(icon: Icon(Myicon.fav), label: "Favorite")
          ],
          selectedItemColor: Colors.pink,
          unselectedItemColor: Mycolor.black.withOpacity(0.5),
          onTap: (int value) {
            setState(() {
              index = value;
            });
          }),
      body: page.elementAt(index),
    );
  }

  openDialog(BuildContext context) {
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
                        var outputFormat = DateFormat('MM/dd/yy hh:mm a');
                        String creatAt = outputFormat.format(DateTime.now());
                        notecont
                            .addnote(NoteMo(titlec.text, dis.text, creatAt));
                        Navigator.pop(context);
                      },
                      child: Text("save")),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Mycolor.white.withOpacity(0.5)),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Cancel"))
                ],
              ),
            ),
          );
        });
  }
}
