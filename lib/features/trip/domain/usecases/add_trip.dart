import 'package:travel_app/features/trip/domain/entities/trip.dart';
import 'package:travel_app/features/trip/domain/repositories/trip_repo.dart';

class AddTrip {
  final TripRepo tripRepo;

  AddTrip({required this.tripRepo});

  Future<void> call(Trip trip) {
    return tripRepo.addTrip(trip);
  }
}
