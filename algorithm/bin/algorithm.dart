import 'dart:math';

import 'package:algorithm/algorithm.dart' as algorithm;

/* Test cases
1
- [590, 59, -404, 385, 3]
--> minSum: 43, maxSum: 1037
--> sum: 633, min: -404, max: 590,
-->evens: [590, -404], odds: [59, 385, 3]

2
- [-118, -461, 427, -225, 588]
--> minSum: -377, maxSum: 672,
--> sum: 211, min: -461, max: 588,
-->evens: [-118, 588], odds: [-461, 427, -225]

3
- [284, 230, 196, 42, 325]
--> minSum: 752, maxSum: 1035
--> sum: 1077, min: 42, max: 325,
-->evens: [284, 230, 196, 42], odds: [325]

4
- [453, -473, -107, 221, 108]
--> minSum: -251, maxSum: 675
--> sum: 202, min: -473, max: 453,
-->evens: [108], odds: [453, -473, -107, 221]

5
- [-123, -316, -390, 376, -440]
--> minSum: -1269, maxSum: -453
--> sum: -893, min: -440, max: 376,
-->evens: [-316, -390, 376, -440], odds: [-123]

6
- [77, 588, 147, -186, -309]
--> minSum: -271, maxSum: 626
--> sum: 317, min: -309, max: 588,
-->evens: [588, -186], odds: [77, 147, -309]

7
- [444, -451, -77, 37, 445]
--> minSum: -47, maxSum: 849
--> sum: 398, min: -451, max: 445,
-->evens: [444], odds: [-451, -77, 37, 445]

8
- [174, -104, 189, 241, -76]
--> minSum: 183, maxSum: 528
--> sum: 452, min: -104, max: 241,
-->evens: [174, -104, -76], odds: [189, 241]

9
- [224, -485, 161, 43, 304]
--> minSum: -57, maxSum: 732
--> sum: 147, min: -485, max: 304,
-->evens: [224, 304], odds: [-485, 161, 43]

10
- [406, 176, -424, -307, -322]
--> minSum: -877, maxSum: -47
--> sum: -471, min: -424, max: 406,
-->evens: [406, 176, -424, -322], odds: [-307]
*/

List<List<int>> randomTestCases() {
  final random = Random();
  final testCases = <List<int>>[];
  for (var i = 0; i < 10; i++) {
    final arr = List.generate(5, (_) => random.nextInt(1000 + 100) - 500);
    testCases.add(arr);
  }
  return testCases;
}

List<List<int>> getTestCases() {
  return [
    [590, 59, -404, 385, 3],
    [-118, -461, 427, -225, 588],
    [284, 230, 196, 42, 325],
    [453, -473, -107, 221, 108],
    [-123, -316, -390, 376, -440],
    [77, 588, 147, -186, -309],
    [444, -451, -77, 37, 445],
    [174, -104, 189, 241, -76],
    [224, -485, 161, 43, 304],
    [406, 176, -424, -307, -322],
  ];
}

void miniMaxSum(List<int> arr) {
  // check input
  print('5 integers: $arr');

  int min = arr[0];
  int max = arr[0];
  int sum = 0;
  final evens = <int>[], odds = <int>[];
  for (int i = 0; i < arr.length; i++) {
    if (arr[i] < min) min = arr[i];
    if (arr[i] > max) max = arr[i];
    sum += arr[i];
    if (arr[i] == 0 || arr[i] % 2 == 0) {
      evens.add(arr[i]);
    } else {
      odds.add(arr[i]);
    }
  }

  // check output
  print('${sum - max} ${sum - min}');

  // bonus part
  print('sum: $sum, min: $min, max: $max');
  print('evens: $evens, odds: $odds\n');
}

void main(List<String> arguments) {
  final testCases = getTestCases();
  final length = testCases.length;
  for (var i = 0; i < length; i++) {
    miniMaxSum(testCases[i]);
  }
}
