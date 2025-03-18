import 'package:flutter/material.dart';

import 'mobile_forecast_list_view.dart';
import 'mobile_forecast_tab_view.dart';

class MobileForecastSection extends StatelessWidget {
  const MobileForecastSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        MobileForecastTabView(),
        SizedBox(height: 10),
        MobileForecastListView()
      ],
    );
  }
}
