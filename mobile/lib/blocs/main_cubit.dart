import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zens_first_test/constants/strings.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(const MainState()) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      prefs = await SharedPreferences.getInstance();
      final listVotedJokes = prefs!.getStringList('votedListJokes') ?? <String>[];
      final currentListJokes = StringConstants.listJokes.where(
        (e) => !listVotedJokes.contains(e),
      ).toList();

      emit(state.copyWith(
        isLoading: false,
        currentListJokes: currentListJokes,
        votedListJokes: listVotedJokes,
      ));
    });
  }

  final random = Random();
  late final SharedPreferences? prefs;

  // void solveAlgorithmAssignment() {
  //   final listInts = <int>[];
  //   for (var i = 0; i < 5; i++) {
  //     listInts.add(random.nextInt(1000));
  //   }
  //
  //   // check input
  //   print('5 integers: $listInts');
  //
  //   // solving problem
  //   int min = listInts[0];
  //   int max = listInts[0];
  //   int sum = 0;
  //   final evens = <int>[], odds = <int>[];
  //   for (int i = 0; i < listInts.length; i++) {
  //     if (listInts[i] < min) min = listInts[i];
  //     if (listInts[i] > max) max = listInts[i];
  //     sum += listInts[i];
  //     if (listInts[i] == 0 || listInts[i] % 2 == 0) {
  //       evens.add(listInts[i]);
  //     } else {
  //       odds.add(listInts[i]);
  //     }
  //   }
  //
  //   // check output
  //   print('${sum - max} ${sum - min}');
  //
  //   // bonus part
  //   print('sum: $sum, min: $min, max: $max');
  //   print('evens: $evens, odds: $odds\n');
  // }

  Future<void> onVoteJoke(String joke) async {
    emit(state.copyWith(isLoading: true));

    final listVotedJokes = [...state.votedListJokes];
    final currentListJokes = [...state.currentListJokes];

    listVotedJokes.add(joke);
    currentListJokes.remove(joke);

    await prefs!.setStringList('votedListJokes', listVotedJokes);

    emit(state.copyWith(
      currentListJokes: currentListJokes,
      votedListJokes: listVotedJokes,
      isLoading: false,
    ));
  }

  Future<void> clearVotes() async {
    emit(state.copyWith(isLoading: true));

    await Future.delayed(const Duration(milliseconds: 200), () async {
      await prefs!.remove('votedListJokes');
    });

    emit(state.copyWith(
      currentListJokes: [...StringConstants.listJokes],
      votedListJokes: <String>[],
      isLoading: false,
    ));
  }
}
