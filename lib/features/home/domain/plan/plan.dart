import 'package:hive/hive.dart';
import 'package:trip_planner/features/home/domain/event/event.dart';
import 'package:trip_planner/features/home/domain/note/note.dart';

part 'plan.g.dart';

@HiveType(typeId: 2)
class Plan {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final Event departure;
  @HiveField(2)
  final Event arrival;
  @HiveField(3)
  final int ticketPrice;
  @HiveField(4)
  final String? hotelName;
  @HiveField(5)
  final int? hotelPrice;
  @HiveField(6)
  final List<Note>? notes;

  Plan({
    required this.title,
    required this.departure,
    required this.arrival,
    required this.ticketPrice,
    this.hotelName,
    this.hotelPrice,
    this.notes,
  });

  factory Plan.empty() {
    return Plan(
      title: '',
      departure: Event.empty(),
      arrival: Event.empty(),
      ticketPrice: 0,
    );
  }

  Plan copyWith({
    String? title,
    Event? departure,
    Event? arrival,
    int? ticketPrice,
    String? hotelName,
    int? hotelPrice,
    List<Note>? notes,
  }) {
    return Plan(
      title: title ?? this.title,
      departure: departure ?? this.departure,
      arrival: arrival ?? this.arrival,
      ticketPrice: ticketPrice ?? this.ticketPrice,
      hotelName: hotelName ?? this.hotelName,
      hotelPrice: hotelPrice ?? this.hotelPrice,
      notes: notes ?? this.notes,
    );
  }
}
