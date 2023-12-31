import 'package:flutter/material.dart';

import '../../../../../common/generated/assets.gen.dart';
import '../../../../common/config/dependency_injection.dart';
import '../bloc/cities_shows_bloc.dart';

class CitiesShowsHeader extends StatefulWidget {
  const CitiesShowsHeader({super.key});

  @override
  State<CitiesShowsHeader> createState() => _CitiesShowsHeaderState();
}

class _CitiesShowsHeaderState extends State<CitiesShowsHeader> {
  final _citiesShowsBloc = getIt<CitiesShowsBloc>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: TextFormField(
        keyboardType: TextInputType.text,
        textCapitalization: TextCapitalization.words,
        style: const TextStyle(color: Colors.white),
        cursorColor: Colors.white,
        maxLines: 1,
        textInputAction: TextInputAction.search,
        onChanged: (value) => _citiesShowsBloc.add(SearchCitiesShowsWeatherEvent(value)),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(10.0),
          isDense: true,
          filled: true,
          fillColor: Colors.white.withOpacity(0.1),
          focusedBorder: _inputBorder(isFocused: true),
          enabledBorder: _inputBorder(),
          disabledBorder: _inputBorder(),
          border: null,
          hintText: 'Search cities',
          hintStyle: const TextStyle(color: Colors.white),
          suffixIcon: SizedBox(
            width: 15,
            child: Center(child: Assets.icons.iconeSearch.svg(color: Colors.white.withOpacity(0.3))),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder _inputBorder({bool isFocused = false}) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: isFocused ? Colors.white.withOpacity(0.1) : Colors.transparent, width: 1.0),
      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      gapPadding: 15.0,
    );
  }
}
