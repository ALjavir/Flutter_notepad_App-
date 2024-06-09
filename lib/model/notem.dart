import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'notem.g.dart';

@HiveType(typeId: 0)
class NoteMo {
  @HiveField(0)
  String title;
  @HiveField(1)
  String descrip;
  @HiveField(2)
  String creatAt;
  NoteMo(this.title, this.descrip, this.creatAt);
}
