import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../controller/weather/weather_cubit.dart';
import 'details_card_info.dart';

class MobileDetailscard extends StatelessWidget {
  const MobileDetailscard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit, WeatherState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        if (state is WeatherSuccess) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  AppColors.secondaryColor,
                  AppColors.primaryColor,
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DetailsCardInfo(
                  icon: Icons.water_drop,
                  text: '${state.weather.humidity}%',
                ),
                DetailsCardInfo(
                  text: '${state.weather.temperatureFeelsLike}',
                  icon: Icons.thermostat,
                ),
                DetailsCardInfo(
                  text: '${state.weather.windSpeed} km/h',
                  icon: Icons.air_rounded,
                )
              ],
            ),
          );
        }

        if (state is WeatherFailed) {
          return const Center(
            child: Text('Failed to load data'),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
