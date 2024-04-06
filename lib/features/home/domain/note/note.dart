import 'package:hive/hive.dart';

part 'note.g.dart';

@HiveType(typeId: 1)
class Note {
  @HiveField(0)
  final String description;
  @HiveField(1)
  final int? price;

  Note({
    required this.description,
    this.price,
  });

  Note copyWith({
    String? description,
    int? price,
  }) {
    return Note(
      description: description ?? this.description,
      price: price ?? this.price,
    );
  }
}
