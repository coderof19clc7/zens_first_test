part of 'main_cubit.dart';

class MainState extends Equatable {
  final bool isLoading;
  final List<int> listIntegers;
  final int sumMin, sumMax;
  final List<String> currentListJokes;
  final List<String> votedListJokes;

  @override
  List<Object?> get props => [
    listIntegers, sumMin, sumMax, currentListJokes, votedListJokes,
  ];

//<editor-fold desc="Data Methods">
  const MainState({
    this.isLoading = true,
    this.listIntegers = const [],
    this.sumMin = 0,
    this.sumMax = 0,
    this.currentListJokes = const [],
    this.votedListJokes = const [],
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MainState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          listEquals(listIntegers, other.listIntegers) &&
          sumMin == other.sumMin &&
          sumMax == other.sumMax &&
          listEquals(currentListJokes, other.currentListJokes) &&
          listEquals(votedListJokes, other.votedListJokes));

  @override
  int get hashCode =>
      isLoading.hashCode ^
      listIntegers.hashCode ^
      sumMin.hashCode ^
      sumMax.hashCode ^
      currentListJokes.hashCode ^
      votedListJokes.hashCode;

  @override
  String toString() {
    return 'MainState{'
        ' isLoading: $isLoading,'
        ' listIntegers: $listIntegers,'
        ' sumMin: $sumMin,'
        ' sumMax: $sumMax,'
        ' currentListJokes: $currentListJokes,'
        ' votedListJokes: $votedListJokes,'
        '}';
  }

  MainState copyWith({
    bool? isLoading,
    List<int>? listIntegers,
    int? sumMin,
    int? sumMax,
    List<String>? currentListJokes,
    List<String>? votedListJokes,
  }) {
    return MainState(
      isLoading: isLoading ?? this.isLoading,
      listIntegers: listIntegers ?? this.listIntegers,
      sumMin: sumMin ?? this.sumMin,
      sumMax: sumMax ?? this.sumMax,
      currentListJokes: currentListJokes ?? this.currentListJokes,
      votedListJokes: votedListJokes ?? this.votedListJokes,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'isLoading': isLoading,
      'listIntegers': listIntegers,
      'sumMin': sumMin,
      'sumMax': sumMax,
      'currentListJokes': currentListJokes,
      'votedListJokes': votedListJokes,
    };
  }

  factory MainState.fromMap(Map<String, dynamic> map) {
    return MainState(
      isLoading: map['isLoading'] as bool? ?? true,
      listIntegers: map['listIntegers'] != null
          ? List<int>.from((map['listIntegers'] as List<dynamic>).whereType<int>())
          : const [],
      sumMin: map['sumMin'] as int? ?? 0,
      sumMax: map['sumMax'] as int? ?? 0,
      currentListJokes: map['currentListJokes'] != null
          ? List<String>.from((map['currentListJokes'] as List<dynamic>).whereType<String>())
          : const [],
      votedListJokes: map['votedListJokes'] != null
          ? List<String>.from((map['listIntegers'] as List<dynamic>).whereType<String>())
          : const [],
    );
  }

//</editor-fold>
}
