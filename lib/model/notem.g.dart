// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notem.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NoteMoAdapter extends TypeAdapter<NoteMo> {
  @override
  final int typeId = 0;

  @override
  NoteMo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NoteMo(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, NoteMo obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.descrip)
      ..writeByte(2)
      ..write(obj.creatAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NoteMoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
