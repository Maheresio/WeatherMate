import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helpers/format_day.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/widgets/styled_circular_progress_indicator.dart';
import '../../../../../core/widgets/styled_error_widget.dart';
import '../../controller/weather/weather_cubit.dart';

class MobileHeaderSection extends StatelessWidget {
  const MobileHeaderSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit, WeatherState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        if (state is WeatherFailed) {
          return StyledErrorWidget(
            message: state.message,
          );
        }

        if (state is WeatherSuccess) {
          return Column(
            children: [
              Text(
                textAlign: TextAlign.center,
                state.weather.cityName,
                style: AppStyles.textStyleBold55(context).copyWith(
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '${formatDay(state.weather.localTime)}, ${state.weather.localTime.split(' ')[1]}',
                style: AppStyles.textStyleBold18(context).copyWith(
                  color: Colors.white54,
                ),
              ),
              const SizedBox(height: 12),

              // Weather Icon
              Image.network(
                state.weather.weatherConditionIcon,
                scale: .45,
              ),

              // Temperature
              Text(
                '${state.weather.temperature.toInt()}° C',
                style: AppStyles.textStyleBold55(context).copyWith(
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                state.weather.weatherCondition,
                style: AppStyles.textStyleBold18(context).copyWith(
                  color: Colors.white54,
                ),
              ),
            ],
          );
        }

        return const StyledCircularProgressIndicator();
      },
    );
  }
}
