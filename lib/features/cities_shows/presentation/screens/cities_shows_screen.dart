import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

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
      backgroundColor: Colors.red,
    );
  }
}
