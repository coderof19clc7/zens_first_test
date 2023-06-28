import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zens_first_test/blocs/main_cubit.dart';
import 'package:zens_first_test/widgets/space.dart';

class AlgorithmAssignment extends StatelessWidget {
  const AlgorithmAssignment({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      buildWhen: (previous, current) => previous.listIntegers != current.listIntegers,
      builder: (contextCubit, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Algorithm assignment',
              textAlign: TextAlign.center,
              softWrap: true,
              style: TextStyle(
                fontSize: MediaQuery.sizeOf(context).width * 0.055,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SpaceByPercent(percentHeight: 0.004),
            Text(
              '5 integers: ${state.listIntegers.join(', ')}',
              textAlign: TextAlign.center,
              softWrap: true,
              style: TextStyle(
                fontSize: MediaQuery.sizeOf(context).width * 0.05,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SpaceByPercent(percentHeight: 0.003),
            Text(
              'Min sum is ${state.sumMin}, max sum is ${state.sumMax}',
              textAlign: TextAlign.center,
              softWrap: true,
              style: TextStyle(
                fontSize: MediaQuery.sizeOf(context).width * 0.045,
              ),
            ),
          ],
        );
      },
    );
  }
}
