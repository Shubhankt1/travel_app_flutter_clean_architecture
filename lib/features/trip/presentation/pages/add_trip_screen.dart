import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_app/features/trip/domain/entities/trip.dart';
import 'package:travel_app/features/trip/presentation/providers/trip_provider.dart';

class AddTripScreen extends ConsumerWidget {
  const AddTripScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();

    // Controllers for the fields.
    final titleController = TextEditingController();
    final descController = TextEditingController();
    final locationController = TextEditingController();
    final photosController = TextEditingController();

    // Pictures list
    List<String> pictures = [];
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 20),
        child: Column(
          children: [
            const Text(
              "Let's Add a trip!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: descController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: locationController,
              decoration: const InputDecoration(labelText: 'Location'),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: photosController,
              decoration: const InputDecoration(labelText: 'Photos'),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 170,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  debugPrint(
                      "Title: ${titleController.text}\nDescription: ${descController.text}\nLocation: ${locationController.text}\nPhotos: ${photosController.text}");
                  pictures.add(photosController.text);
                  if (formKey.currentState!.validate()) {
                    final newTrip = Trip(
                      title: titleController.text,
                      photos: pictures,
                      desc: descController.text,
                      date: DateTime.now(),
                      location: locationController.text,
                    );
                    ref
                        .read(tripListNotifierProvider.notifier)
                        .addNewTrip(newTrip);
                    ref.watch(tripListNotifierProvider.notifier).loadTrips();
                    formKey.currentState!.reset();
                  }
                },
                child: const Text(
                  'Add Trip',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
