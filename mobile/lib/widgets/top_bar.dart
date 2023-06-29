import 'package:flutter/material.dart';
import 'package:zens_first_test/constants/colors.dart';
import 'package:zens_first_test/constants/dimens.dart';
import 'package:zens_first_test/widgets/space.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key,});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.inversePrimary,
      padding: EdgeInsets.only(
        top: Dimens.getTopSafeAreaHeight(context)
            + Dimens.getScreenHeight(context)* 0.03,
        bottom: Dimens.getScreenHeight(context)* 0.05,
      ),
      width: Dimens.getScreenWidth(context),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'A joke a day keeps the doctor away',
            style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.sizeOf(context).width * 0.055
            ),
          ),
          const SpaceByPercent(percentHeight: 0.025),
          Text(
            'If you joke wrong way, your teeth have to pay. (Serious)',
            style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.sizeOf(context).width * 0.037
            ),
          ),
        ],
      ),
    );
  }
}
