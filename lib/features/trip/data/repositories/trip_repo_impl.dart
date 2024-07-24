import 'package:dartz/dartz.dart';
import 'package:travel_app/core/error/failures.dart';
import 'package:travel_app/features/trip/data/models/trip_model.dart';
import 'package:travel_app/features/trip/data/sources/trip_local_datasource.dart';
import 'package:travel_app/features/trip/domain/entities/trip.dart';
import 'package:travel_app/features/trip/domain/repositories/trip_repo.dart';

class TripRepoImpl implements TripRepo {
  final TripLocalDatasource tripLocalDatasource;

  TripRepoImpl({required this.tripLocalDatasource});

  @override
  Future<void> addTrip(Trip trip) async {
    final tripModel = TripModel.fromEntity(trip);
    tripLocalDatasource.addTrip(tripModel);
  }

  @override
  Future<void> deleteTrip(int tripIndex) async {
    tripLocalDatasource.deleteTrip(tripIndex);
  }

  @override
  Future<Either<Failure, List<Trip>>> getTrips() async {
    try {
      final tripModels = tripLocalDatasource.getTrips();

      // Map it to an Entity
      List<Trip> trips = tripModels.map((model) => model.toEntity()).toList();
      return Right(trips);
    } on Exception catch (e) {
      return Left(SomeSpecificError(e.toString()));
    }
  }
}
