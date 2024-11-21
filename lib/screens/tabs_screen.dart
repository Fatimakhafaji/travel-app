import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import './categories_screen.dart';
import './favorite_screen.dart';
import '../models/trip.dart';

class TabsScreen extends StatefulWidget {
  //const TabsScreen({super.key});

  final List<Trip> favoriteTrips;

  TabsScreen(this.favoriteTrips);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  int _selectedScreenIndex = 0;

  late List<Map<String, Widget>> _screens;

  @override
  void initState() {
    _screens = [
      {
        'Screen': const CategoriesScreen(),
        'Title': const Text('تصنيفات الرحلات '),
      },
      {
        'Screen': FavoriteScreen(widget.favoriteTrips),
        'Title': const Text('الرحلات المفضلة'),
      },
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _screens[_selectedScreenIndex]['Title'],
      ),
      drawer: const AppDrawer(),
      body: _screens[_selectedScreenIndex]['Screen'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).hintColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedScreenIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'التصنيفات',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'المفضلة',
          )
        ],
      ),
    );
  }
}
