import 'package:travel_app/features/trip/domain/repositories/trip_repo.dart';

class DeleteTrip {
  final TripRepo tripRepo;

  DeleteTrip({required this.tripRepo});

  Future<void> call(int tripIndex) {
    return tripRepo.deleteTrip(tripIndex);
  }
}
