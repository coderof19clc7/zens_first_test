## How I solve the problem
To solve the required algorithmic problem, I did the following steps:
1. Get 10 test cases (by generating 10 list of 5 integers between -500 and 1000 with function `randomTestCases` or using the constants list list with function `getTestCases`).
2. Run for loop to get through all test cases.
3. Call function `miniMaxSum` with the current list as parameter.
4. Implement the `miniMaxSum` function:
   - Prepare 5 variables: _min_, _max_ and _sum_ (all initial values are 0) and 2 empty lists int _evens_ and _odds_.
   - Make 1 for loop through the list to find _min_ value, _max_ value and the _sum_, also find even and odd elements.
   - Print the `min sum` is the result of `sum - max` value and `max sum` is the result of `sum - min` value.
   - Print the _sum_, _min_, _max_ and the 2 lists _evens_ and _odds_.

## The code is implemented in bin/algorithm.dart file
