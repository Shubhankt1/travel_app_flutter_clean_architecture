import 'package:travel_app/features/trip/domain/entities/trip.dart';
import 'package:travel_app/features/trip/domain/repositories/trip_repo.dart';

class GetTrips {
  final TripRepo tripRepo;

  GetTrips({required this.tripRepo});

  Future<List<Trip>> call() {
    return tripRepo.getTrips();
  }
}
