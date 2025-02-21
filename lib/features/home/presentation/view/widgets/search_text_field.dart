import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_mate/core/utils/app_colors.dart';
import 'package:weather_mate/features/home/presentation/controller/location/location_cubit.dart';
import 'package:weather_mate/features/home/presentation/controller/weather/weather_cubit.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({
    super.key,
  });

  @override
  SearchTextFieldState createState() => SearchTextFieldState();
}

class SearchTextFieldState extends State<SearchTextField> {
  bool _isTapped = false;
  final TextEditingController _controller = TextEditingController();

  void _handleTap() {
    setState(() {
      _isTapped = !_isTapped;
    });
    // Handle search icon press
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _controller,
            decoration: InputDecoration(
              hintText: 'Search for a city',
              hintStyle: TextStyle(color: Colors.blueGrey[300]),
              suffixIcon: InkWell(
                onTap: () {
                  _handleTap();
                  if (_controller.text.isNotEmpty) {
                    context.read<WeatherCubit>().getWeather(_controller.text);
                  }
                },
                borderRadius: BorderRadius.circular(16),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  transform: Matrix4.translationValues(_isTapped ? 2 : 0, 0, 0),
                  decoration: BoxDecoration(
                    color: Colors.blue[200],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Icon(Icons.search, color: Colors.white),
                ),
              ),
              filled: true,
              fillColor: Colors.blue[50],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: Colors.blue,
                ),
              ),
            ),
            onSubmitted: (value) {
              if (_controller.text.isNotEmpty) {
                context.read<WeatherCubit>().getWeather(_controller.text);
              }
            },
          ),
        ),
        const SizedBox(width: 8),
        BlocConsumer<LocationCubit, LocationState>(
          listener: (context, state) {
            if (state is LocationFailed) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.red,
                ),
              );
            }
            if(state is LocationSuccess){
             context.read<WeatherCubit>().getWeather('');
            }
          },
          builder: (context, state) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(16),
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.location_on_rounded,
                  color: AppColors.secondaryColor,
                ),
                onPressed: () {},
              ),
            );
          },
        ),
      ],
    );
  }
}
