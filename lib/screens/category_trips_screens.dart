import 'package:flutter/material.dart';
//import 'package:travel/app_data.dart';
import '../models/trip.dart';
import '../widgets/trip_item.dart';

class CategoryTripsScreens extends StatefulWidget {
  // ignore: constant_identifier_names
  static const ScreenRoute = '/category-trips';

  final List<Trip> availableTrips;

  const CategoryTripsScreens(this.availableTrips, {super.key});

  @override
  State<CategoryTripsScreens> createState() => _CategoryTripsScreensState();
}

class _CategoryTripsScreensState extends State<CategoryTripsScreens> {
  late String categoryTitle;
  late List<Trip> displayTrips;

  @override
  void initState() {
    //..
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final routeArgument =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    // ignore: non_constant_identifier_names
    final CategoryId = routeArgument['id'];
    categoryTitle = routeArgument['title']!;
    displayTrips = widget.availableTrips.where((trip) {
      return trip.categories.contains(CategoryId);
    }).toList();
    super.didChangeDependencies();
  }

  void _removeTrip(String tripId) {
    setState(() {
      displayTrips.removeWhere((trip) => trip.id == tripId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return TripItem(
            displayTrips[index].id,
            displayTrips[index].title,
            displayTrips[index].imageUrl,
            displayTrips[index].duration,
            displayTrips[index].tripType,
            displayTrips[index].season,
            //_removeTrip,
          );
        },
        itemCount: displayTrips.length,
      ),
    );
  }
}
