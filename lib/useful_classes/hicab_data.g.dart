// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hicab_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HicabDataAdapter extends TypeAdapter<HicabData> {
  @override
  final int typeId = 0;

  @override
  HicabData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HicabData(
      text: fields[1] as dynamic,
      ImageAsset: fields[0] as dynamic,
      Icona: fields[2] as dynamic,
      id: fields[3] as dynamic,
      price: fields[4] as dynamic,
      counter: fields[5] as dynamic,
      count: fields[6] as dynamic,
      toplam: fields[8] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, HicabData obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.ImageAsset)
      ..writeByte(1)
      ..write(obj.text)
      ..writeByte(2)
      ..write(obj.Icona)
      ..writeByte(3)
      ..write(obj.id)
      ..writeByte(4)
      ..write(obj.price)
      ..writeByte(5)
      ..write(obj.counter)
      ..writeByte(6)
      ..write(obj.count)
      ..writeByte(8)
      ..write(obj.toplam);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HicabDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
