import 'package:flutter/material.dart';

class StyledCircularProgressIndicator extends StatelessWidget {
  const StyledCircularProgressIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.white,
      ),
    );
  }
}
