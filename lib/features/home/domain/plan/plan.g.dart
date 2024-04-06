// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PlanAdapter extends TypeAdapter<Plan> {
  @override
  final int typeId = 2;

  @override
  Plan read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Plan(
      title: fields[0] as String,
      departure: fields[1] as Event,
      arrival: fields[2] as Event,
      ticketPrice: fields[3] as int,
      hotelName: fields[4] as String?,
      hotelPrice: fields[5] as int?,
      notes: (fields[6] as List?)?.cast<Note>(),
    );
  }

  @override
  void write(BinaryWriter writer, Plan obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.departure)
      ..writeByte(2)
      ..write(obj.arrival)
      ..writeByte(3)
      ..write(obj.ticketPrice)
      ..writeByte(4)
      ..write(obj.hotelName)
      ..writeByte(5)
      ..write(obj.hotelPrice)
      ..writeByte(6)
      ..write(obj.notes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlanAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
