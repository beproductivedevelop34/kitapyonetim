// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kitap.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AlinanKitapAdapter extends TypeAdapter<AlinanKitap> {
  @override
  final int typeId = 0;

  @override
  AlinanKitap read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AlinanKitap(
      fields[0] as int,
      fields[1] as String,
      fields[2] as String,
      fields[3] as DateTime,
      fields[4] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, AlinanKitap obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.urunno)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.yazar)
      ..writeByte(3)
      ..write(obj.time)
      ..writeByte(4)
      ..write(obj.kayittime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AlinanKitapAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class VerilenKitapAdapter extends TypeAdapter<VerilenKitap> {
  @override
  final int typeId = 1;

  @override
  VerilenKitap read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VerilenKitap(
      fields[0] as int,
      fields[1] as String,
      fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, VerilenKitap obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.urunno)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.yazar);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VerilenKitapAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
