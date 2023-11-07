import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/app_navigation_bar.dart';
import '../widgets/cities_shows_header.dart';
import '../widgets/cities_shows_list.dart';

@RoutePage()
class CitiesShowsScreen extends StatefulWidget {
  const CitiesShowsScreen({super.key});

  @override
  State<CitiesShowsScreen> createState() => _CitiesShowsScreenState();
}

class _CitiesShowsScreenState extends State<CitiesShowsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppNavigationBar(title: 'Next Shows'),
      backgroundColor: Colors.black,
      body: Column(children: [CitiesShowsHeader(), CitiesShowsList()]),
    );
  }
}
