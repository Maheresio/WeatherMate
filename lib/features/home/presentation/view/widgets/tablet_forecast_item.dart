import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class TabletForecastItem extends StatelessWidget {
  const TabletForecastItem({
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.crystalColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                time,
                style: AppStyles.textStyleBold18(context).copyWith(
                  color: Colors.white54,
                ),
              ),
              Image.network(
                imageUrl,
                scale: .8,
              ),
              Text(
                '$temperature°',
                style: AppStyles.textStyleBold18(context).copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
