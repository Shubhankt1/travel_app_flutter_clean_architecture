import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:travel_app/features/trip/data/models/trip_model.dart';
import 'package:travel_app/features/trip/data/repositories/trip_repo_impl.dart';
import 'package:travel_app/features/trip/data/sources/trip_local_datasource.dart';
import 'package:travel_app/features/trip/domain/entities/trip.dart';
import 'package:travel_app/features/trip/domain/repositories/trip_repo.dart';
import 'package:travel_app/features/trip/domain/usecases/add_trip.dart';
import 'package:travel_app/features/trip/domain/usecases/delete_trip.dart';
import 'package:travel_app/features/trip/domain/usecases/get_trips.dart';

// Trip Local Datasource Provider
final tripLocalDatasourceProvider = Provider<TripLocalDatasource>((ref) {
  final Box<TripModel> tripBox = Hive.box('trips');
  return TripLocalDatasource(tripBox: tripBox);
});

// Trip Repository
final tripRepoProvider = Provider<TripRepo>((ref) {
  final tripLocalDatasource = ref.watch(tripLocalDatasourceProvider);
  return TripRepoImpl(tripLocalDatasource: tripLocalDatasource);
});

final addTripProvider = Provider<AddTrip>((ref) {
  final repo = ref.watch(tripRepoProvider);
  return AddTrip(tripRepo: repo);
});

final getTripsProvider = Provider<GetTrips>((ref) {
  final repo = ref.watch(tripRepoProvider);
  return GetTrips(tripRepo: repo);
});

final deleteTripProvider = Provider<DeleteTrip>((ref) {
  final repo = ref.watch(tripRepoProvider);
  return DeleteTrip(tripRepo: repo);
});

final tripListNotifierProvider =
    StateNotifierProvider<TripListNotifier, List<Trip>>((ref) {
  final getTrips = ref.read(getTripsProvider);
  final addTrip = ref.read(addTripProvider);
  final deleteTrip = ref.read(deleteTripProvider);

  return TripListNotifier(getTrips, addTrip, deleteTrip);
});

class TripListNotifier extends StateNotifier<List<Trip>> {
  final GetTrips _getTrips;
  final AddTrip _addTrip;
  final DeleteTrip _deleteTrip;

  TripListNotifier(this._getTrips, this._addTrip, this._deleteTrip) : super([]);

  Future<void> addNewTrip(Trip trip) async {
    await _addTrip(trip);
  }

  Future<void> deleteTrip(int index) async {
    await _deleteTrip(index);
  }

  Future<void> loadTrips() async {
    final tripsOrFailure = await _getTrips();
    tripsOrFailure.fold((error) => state = [], (trips) => state = trips);
  }
}
