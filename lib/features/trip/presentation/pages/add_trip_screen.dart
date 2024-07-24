import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_app/features/trip/domain/entities/trip.dart';
import 'package:travel_app/features/trip/presentation/providers/trip_provider.dart';
import 'package:travel_app/features/trip/presentation/widgets/custom_text_form_field.dart';

class AddTripScreen extends ConsumerWidget {
  const AddTripScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();

    List<String> titles = [];
    ref.watch(tripListNotifierProvider).forEach((trip) {
      titles.add(trip.title);
    });

    // Controllers for the fields.
    final titleController = TextEditingController();
    final descController = TextEditingController();
    final locationController = TextEditingController();
    final photosController = TextEditingController();

    // Pictures list
    List<String> pictures = [];
    return SingleChildScrollView(
      child: Center(
        child: SizedBox(
          width: 600,
          child: Form(
            key: formKey,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 32.0, vertical: 20),
              child: Column(
                children: [
                  // Heading
                  const Text(
                    "Let's Add a trip!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 50),

                  // Title
                  CustomTextFormField(
                    inputController: titleController,
                    labelText: 'Title',
                    autoFillHints: titles,
                  ),
                  const SizedBox(height: 16),

                  // Description
                  CustomTextFormField(
                    inputController: descController,
                    labelText: 'Description',
                    maxLines: 3,
                  ),
                  const SizedBox(height: 16),

                  // Location
                  CustomTextFormField(
                    inputController: locationController,
                    labelText: 'Location',
                  ),
                  const SizedBox(height: 16),

                  // Photos
                  CustomTextFormField(
                    inputController: photosController,
                    labelText: 'Photos',
                  ),
                  const SizedBox(height: 30),

                  // Submit
                  SizedBox(
                    width: 170,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        debugPrint(
                            "Title: ${titleController.text}\nDescription: ${descController.text}\nLocation: ${locationController.text}\nPhotos: ${photosController.text}");
                        photosController.text.split(',').forEach((image) {
                          pictures.add(image);
                        });
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
                          ref
                              .watch(tripListNotifierProvider.notifier)
                              .loadTrips();
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
          ),
        ),
      ),
    );
  }
}
