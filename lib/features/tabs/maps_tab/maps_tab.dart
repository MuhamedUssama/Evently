import 'package:evently/features/tabs/maps_tab/provider/maps_tab_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MapsTab extends StatelessWidget {
  const MapsTab({super.key});

  @override
  Widget build(BuildContext context) {
    MapsTabProvider provider = Provider.of<MapsTabProvider>(context);
    return Center(child: Text(provider.locationMessage));
  }
}
