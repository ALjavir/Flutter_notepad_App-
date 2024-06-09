import 'package:flutter_application_notepad/page/nav.dart';
import 'package:flutter_application_notepad/page/notes_details.dart';
import 'package:get/get.dart';

const String NavBar = "/nav";
const String noteD = "/notes_details";
List<GetPage> getpages = [
  GetPage(name: NavBar, page: () => Nav()),
  GetPage(name: noteD, page: () => NoteDtPg()),
];
