// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PatientLocalAdapter extends TypeAdapter<PatientLocal> {
  @override
  final int typeId = 0;

  @override
  PatientLocal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PatientLocal(
      abhaId: fields[0] as String,
      name: fields[1] as String,
      age: fields[2] as int,
      synced: fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, PatientLocal obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.abhaId)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.age)
      ..writeByte(3)
      ..write(obj.synced);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PatientLocalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
