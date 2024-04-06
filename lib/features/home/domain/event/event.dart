import 'package:hive/hive.dart';

part 'event.g.dart';

@HiveType(typeId: 0)
class Event {
  @HiveField(0)
  final String country;
  @HiveField(1)
  final String city;
  @HiveField(2)
  final DateTime dateTime;
  @HiveField(3)
  final String airport;

  Event({
    required this.country,
    required this.city,
    required this.dateTime,
    required this.airport,
  });

  factory Event.empty() {
    return Event(
      country: '',
      city: '',
      dateTime: DateTime.now(),
      airport: '',
    );
  }

  Event copyWith({
    String? country,
    String? city,
    DateTime? dateTime,
    String? airport,
  }) {
    return Event(
      country: country ?? this.country,
      city: city ?? this.city,
      dateTime: dateTime ?? this.dateTime,
      airport: airport ?? this.airport,
    );
  }
}
