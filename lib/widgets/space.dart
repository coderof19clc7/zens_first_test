import 'package:flutter/material.dart';

class SpaceByPercent extends StatelessWidget {
  const SpaceByPercent({
    super.key,
    this.percentWidth = 0,
    this.percentHeight = 0,
  });

  final double percentWidth;
  final double percentHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * percentHeight,
      width: MediaQuery.sizeOf(context).width * percentWidth,
    );
  }
}