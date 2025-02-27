import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/widgets/styled_circular_progress_indicator.dart';
import '../../../../../core/widgets/styled_error_widget.dart';
import '../../controller/weather/weather_cubit.dart';

class DesktopHeaderSection extends StatelessWidget {
  const DesktopHeaderSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit, WeatherState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is WeatherFailed) {
          return StyledErrorWidget(
            message: state.message,
          );
        }

        if (state is WeatherSuccess) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      spacing: 8.0,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.weather.cityName,
                          style: AppStyles.textStyleBold55(context).copyWith(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          state.weather.region,
                          style: AppStyles.textStyleMedium20(context).copyWith(
                            color: AppColors.lightWhiteColor,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '${state.weather.temperature.toInt()}°',
                      style: AppStyles.textStyleBold70(context).copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Image.network(
                  state.weather.weatherConditionIcon,
                  scale: .4,
                )
              ],
            ),
          );
        }
        return const StyledCircularProgressIndicator();
      },
    );
  }
}
