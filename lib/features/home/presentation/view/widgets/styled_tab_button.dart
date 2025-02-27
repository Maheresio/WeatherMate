import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../controller/weather/weather_provider.dart';


class StyledTabButton extends StatelessWidget {
  const StyledTabButton({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<WeatherProvider>();
    return TextButton(
      child: Text(
        title,
        style: AppStyles.textStyleBold18(context).copyWith(
          color: provider.activeTab == title ? Colors.white : Colors.white54,
        ),
      ),
      onPressed: () => provider.setActiveTab(title),
    );
  }
}
