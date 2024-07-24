import 'package:dartz/dartz.dart';
import 'package:travel_app/core/error/failures.dart';
import 'package:travel_app/features/trip/domain/entities/trip.dart';
import 'package:travel_app/features/trip/domain/repositories/trip_repo.dart';

class GetTrips {
  final TripRepo tripRepo;

  GetTrips({required this.tripRepo});

  Future<Either<Failure, List<Trip>>> call() {
    return tripRepo.getTrips();
  }
}
