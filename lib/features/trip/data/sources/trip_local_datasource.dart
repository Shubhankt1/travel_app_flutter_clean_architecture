import 'package:hive/hive.dart';
import 'package:travel_app/features/trip/data/models/trip_model.dart';

class TripLocalDatasource {
  final Box<TripModel> tripBox;

  TripLocalDatasource({required this.tripBox});

  /// Get all the Trips
  List<TripModel> getTrips() {
    return tripBox.values.toList();
  }

  void addTrip(TripModel trip) {
    tripBox.add(trip);
  }

  void deleteTrip(int index) {
    tripBox.deleteAt(index);
  }
}
