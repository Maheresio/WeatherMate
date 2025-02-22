import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class MobileForecastItem extends StatelessWidget {
  const MobileForecastItem({
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
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.crystalColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                time,
                style: AppStyles.textStyle13(context).copyWith(
                  color: Colors.white54,
                ),
              ),
              Image.network(
                imageUrl,
                scale: 1.5,
              ),
              Text(
                '$temperature°',
                style: AppStyles.textStyle13(context).copyWith(
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
