import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const screenRoute = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  const FiltersScreen(this.currentFilters, this.saveFilters, {super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _summer = false;
  var _winter = false;
  var _famliy = false;

  @override
  initState() {
    _summer = widget.currentFilters['summer']!;
    _winter = widget.currentFilters['winter']!;
    _famliy = widget.currentFilters['family']!;
    super.initState();
  }

  Widget buildSwitchListTile(
      String title, String subtitle, var currentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: currentValue,
      onChanged: updateValue(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الفلترة'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              final selectFilters = {
                'summer': _summer,
                'Winter': _winter,
                'family': _famliy,
              };
              widget.saveFilters(selectFilters);
            },
          )
        ],
      ),
      drawer: const AppDrawer(),
      body: Column(
        children: [
          const SizedBox(height: 50),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile(
                    'الرحلات الصيفية', 'إظهار الرحلات الصيفية', _summer,
                    (newValue) {
                  setState(() {
                    _summer = newValue;
                  });
                }),
                buildSwitchListTile(
                    'الرحلات الشتوية', 'إظهار الرحلات الشتوية فقط', _winter,
                    (newValue) {
                  setState(() {
                    _winter = newValue;
                  });
                }),
                buildSwitchListTile(
                    'العائلية', 'إظهار الرحلات العائلية', _famliy, (newValue) {
                  setState(() {
                    _famliy = newValue;
                  });
                })
              ],
            ),
          )
        ],
      ),
    );
  }
}
