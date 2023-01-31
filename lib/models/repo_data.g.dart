// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RepoDataAdapter extends TypeAdapter<RepoData> {
  @override
  final int typeId = 1;

  @override
  RepoData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RepoData(
      repoName: fields[1] as String,
      repoDescription: fields[2] as String,
      starsCount: fields[3] as int,
      username: fields[4] as String,
      avatar: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, RepoData obj) {
    writer
      ..writeByte(5)
      ..writeByte(1)
      ..write(obj.repoName)
      ..writeByte(2)
      ..write(obj.repoDescription)
      ..writeByte(3)
      ..write(obj.starsCount)
      ..writeByte(4)
      ..write(obj.username)
      ..writeByte(5)
      ..write(obj.avatar);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RepoDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
