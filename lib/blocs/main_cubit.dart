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

  void solveAlgorithmAssignment() {
    final listInts = <int>[];
    for (var i = 0; i < 5; i++) {
      listInts.add(random.nextInt(1000));
    }
    final listCopy = List.from(listInts);
    listCopy.sort();
    final sumMin = listCopy.sublist(0, listCopy.length - 1).reduce((a, b) => a + b);
    final sumMax = listCopy.sublist(1, listCopy.length).reduce((a, b) => a + b);

    emit(state.copyWith(
      listIntegers: List.from(listInts),
      sumMin: sumMin,
      sumMax: sumMax,
    ));
  }

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
