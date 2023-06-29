import 'dart:math';

import 'package:algorithm/algorithm.dart' as algorithm;

void miniMaxSum(List<int> arr) {
  int min = arr[0];
  int max = arr[0];
  int sum = 0;
  for (int i = 0; i < arr.length; i++) {
    if (arr[i] < min) min = arr[i];
    if (arr[i] > max) max = arr[i];
    sum += arr[i];
  }
  print('${sum - max} ${sum - min}');
}

void main(List<String> arguments) {
  final random = Random();
  final arr = List.generate(5, (_) => random.nextInt(1000));
  print('5 integers: $arr');
  miniMaxSum(arr);
}
