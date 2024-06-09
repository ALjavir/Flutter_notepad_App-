import 'package:flutter_application_notepad/model/notem.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class Notecont extends GetxController {
  List<NoteMo> notes = [NoteMo("Title", "sample descrip", "creatAt")];
  List<NoteMo> favlist = [];

  final Box box = Hive.box("Notes");
  final Box FavNotes = Hive.box("FavNotes");

  void addnote(NoteMo note) {
    box.add(note);
    update();
  }

  void deletNote(int index) {
    box.deleteAt(index);
    update();
  }

  void updateNote(NoteMo noteMo, int index) {
    box.putAt(index, noteMo);
    update();
  }

  void addfavitem(NoteMo note) {
    FavNotes.add(note);
    Fluttertoast.showToast(msg: "Favourite note added");
    update();
  }

  void deletfavitem(int index) {
    FavNotes.deleteAt(index);
    update();
  }
}
