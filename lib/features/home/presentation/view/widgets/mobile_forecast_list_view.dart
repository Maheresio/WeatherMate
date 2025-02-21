import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../controller/weather/weather_provider.dart';
import '../../controller/weather/weather_cubit.dart';
import 'package:weather_mate/features/home/presentation/view/widgets/mobile_forecast_item.dart';

class MobileForecastListView extends StatelessWidget {
  const MobileForecastListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<WeatherProvider>();
    return SizedBox(
      height: 120,
      child: BlocConsumer<WeatherCubit, WeatherState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is WeatherFailed) {
            return const Center(
              child: Text('Failed to load data'),
            );
          }

          if (state is WeatherSuccess) {
            return provider.activeTab == AppStrings.today
                ? ListView(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      ...List.generate(
                        7,
                        (index) => MobileForecastItem(
                          time: state.weather.hourlyForecast[index].time,
                          imageUrl: state.weather.hourlyForecast[index].iconUrl,
                          temperature:
                              state.weather.hourlyForecast[index].temperature,
                        ),
                      ),
                    ],
                  )
                : ListView(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      ...List.generate(
                        7,
                        (index) => MobileForecastItem(
                          time: state.weather.weeklyForecast[index].day,
                          imageUrl: state.weather.weeklyForecast[index].iconUrl,
                          temperature:
                              state.weather.weeklyForecast[index].maxTemp,
                        ),
                      ),
                    ],
                  );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
