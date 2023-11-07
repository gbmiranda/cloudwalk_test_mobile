import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/config/dependency_injection.dart';
import '../../../../../common/widgets/app_navigation_bar.dart';
import '../../../../../common/widgets/app_text.dart';
import '../bloc/cities_shows_bloc.dart';
import '../widgets/cities_shows_header.dart';
import '../widgets/cities_shows_list.dart';

@RoutePage()
class CitiesShowsScreen extends StatefulWidget {
  const CitiesShowsScreen({super.key});

  @override
  State<CitiesShowsScreen> createState() => _CitiesShowsScreenState();
}

class _CitiesShowsScreenState extends State<CitiesShowsScreen> {
  final _citiesShowsBloc = getIt<CitiesShowsBloc>();

  @override
  void initState() {
    _citiesShowsBloc.add(FetchCitiesShowsWeatherEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppNavigationBar(title: 'Next Shows'),
      backgroundColor: Colors.black,
      body: BlocBuilder<CitiesShowsBloc, CitiesShowsState>(
        bloc: _citiesShowsBloc,
        builder: (context, state) {
          if (state is CitiesShowsStateLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is CitiesShowsStateError) {
            return const Center(child: AppText(text: ':(', style: AppTextStyle.titleMedium));
          }
          final successState = state as CitiesShowsStateSuccess;
          return Column(children: [const CitiesShowsHeader(), CitiesShowsList(cities: successState.cities)]);
        },
      ),
    );
  }
}
