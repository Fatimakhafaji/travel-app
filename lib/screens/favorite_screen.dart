import 'package:flutter/material.dart';
import '../widgets/trip_item.dart';
import '../models/trip.dart';

class FavoriteScreen extends StatelessWidget {
  //const FavoriteScreen({super.key});

  final List<Trip> favoriteTrips;

  FavoriteScreen(this.favoriteTrips);

  @override
  Widget build(BuildContext context) {
    if (favoriteTrips.isEmpty) {
      return const Center(
        child: Text('هذه صفحة الرحلات المفضلة '),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return TripItem(
            favoriteTrips[index].id,
            favoriteTrips[index].title,
            favoriteTrips[index].imageUrl,
            favoriteTrips[index].duration,
            favoriteTrips[index].tripType,
            favoriteTrips[index].season,
            // _removeTrip,
          );
        },
        itemCount: favoriteTrips.length,
      );
    }
  }
}
