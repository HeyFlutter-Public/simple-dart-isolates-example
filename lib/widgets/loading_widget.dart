import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key, this.dimension, this.strokeWidth = 4.0});
  final double? dimension;
  final double strokeWidth;

  @override
  Widget build(BuildContext context) => Center(
        child: SizedBox.square(
          dimension: dimension,
          child: CircularProgressIndicator(strokeWidth: strokeWidth),
        ),
      );
}
