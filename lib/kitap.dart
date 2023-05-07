import 'package:hive/hive.dart';
part "kitap.g.dart";

@HiveType(typeId: 0)
class AlinanKitap extends HiveObject {
  @HiveField(0)
  int urunno;
  @HiveField(1)
  String name;
  @HiveField(2)
  String yazar;
  @HiveField(3)
  DateTime time;
  @HiveField(4)
  DateTime kayittime;
  AlinanKitap(this.urunno, this.name, this.yazar, this.time,this.kayittime);
}

@HiveType(typeId: 1)
class VerilenKitap extends HiveObject {
  @HiveField(0)
  int urunno;
  @HiveField(1)
  String name;
  @HiveField(2)
  String yazar;

  VerilenKitap(this.urunno, this.name, this.yazar);
}
