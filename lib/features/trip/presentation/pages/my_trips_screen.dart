import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:travel_app/features/trip/presentation/providers/trip_provider.dart';
import 'package:travel_app/features/trip/presentation/widgets/travel_card.dart';

class MyTripsScreen extends ConsumerWidget {
  const MyTripsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tripList = ref.watch(tripListNotifierProvider);
    debugPrint("tripList: $tripList");

    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Column(
        children: [
          GridView.extent(
            childAspectRatio: 1.2,
            padding: const EdgeInsets.all(16),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            maxCrossAxisExtent: 450,
            mainAxisSpacing: 16.0,
            crossAxisSpacing: 8.0,
            children: tripList.map((trip) {
              return TravelCard(
                imgUrl: trip.photos[0],
                title: trip.title,
                desc: trip.desc,
                date: DateFormat.yMMMd().format(trip.date).toString(),
                location: trip.location,
                onDelete: () {
                  ref
                      .read(tripListNotifierProvider.notifier)
                      .deleteTrip(tripList.indexOf(trip));
                  ref.read(tripListNotifierProvider.notifier).loadTrips();
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
