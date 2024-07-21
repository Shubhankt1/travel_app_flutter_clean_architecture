import 'package:hive/hive.dart';
import 'package:travel_app/features/trip/domain/entities/trip.dart';

part 'trip_model.g.dart';

@HiveType(typeId: 0)
class TripModel {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final List<String> photos;
  @HiveField(2)
  final String desc;
  @HiveField(3)
  final DateTime date;
  @HiveField(4)
  final String location;

  TripModel({
    required this.title,
    required this.photos,
    required this.desc,
    required this.date,
    required this.location,
  });

  // Convert from Entity to Model.
  factory TripModel.fromEntity(Trip trip) => TripModel(
        title: trip.title,
        photos: trip.photos,
        desc: trip.desc,
        date: trip.date,
        location: trip.location,
      );

  // Convert toEntity from Model.
  Trip toEntity() => Trip(
        title: title,
        photos: photos,
        desc: desc,
        date: date,
        location: location,
      );
}
