import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class TodayForecastItem extends StatelessWidget {
  const TodayForecastItem({
    super.key,
    required this.time,
    required this.imageUrl,
    required this.temperature,
  });

  final String time;
  final String imageUrl;
  final double temperature;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          time,
          style: AppStyles.textStyleMedium20(context).copyWith(
            color: AppColors.lightWhiteColor,
          ),
        ),
        Image.network(imageUrl),
        Text(
          '$temperature°',
          style: AppStyles.textStyleBold30(context).copyWith(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
