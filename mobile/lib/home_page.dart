import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zens_first_test/blocs/main_cubit.dart';
import 'package:zens_first_test/constants/dimens.dart';
import 'package:zens_first_test/widgets/algorithm_assignment.dart';
import 'package:zens_first_test/widgets/jokes_assignment.dart';
import 'package:zens_first_test/widgets/space.dart';
import 'package:zens_first_test/widgets/top_bar.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCubit(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const TopBar(),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimens.getScreenWidth(context) * 0.05,
                  vertical: Dimens.getScreenHeight(context) * 0.05,
                ),
                child: const Column(
                  children: [
                    AlgorithmAssignment(),
                    SpaceByPercent(percentHeight: 0.07),
                    JokesAssignment(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}