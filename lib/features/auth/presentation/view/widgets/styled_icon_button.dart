import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:weather_mate/core/utils/app_constants.dart';

class StyledIconButton extends StatelessWidget {
  const StyledIconButton({
    super.key,
    required this.image,
    this.onPressed,
  });
  final String image;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.radius10),
        ),
        backgroundColor: Colors.white,
        padding: EdgeInsets.zero,
      ),
      onPressed: onPressed,
      child: SvgPicture.asset(
        image,
        width: 24,
        height: 24,
      ),
      ),
    );
  }
}
