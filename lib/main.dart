import 'package:flutter/material.dart';
import 'package:flutter_application_notepad/model/notem.dart';
import 'package:flutter_application_notepad/routes/routes.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteMoAdapter());
  await Hive.openBox("Notes");
  await Hive.openBox("FavNotes");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: getpages,
      initialRoute: NavBar,
    );
  }
}
