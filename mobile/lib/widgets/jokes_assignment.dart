import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zens_first_test/blocs/main_cubit.dart';
import 'package:zens_first_test/widgets/space.dart';

class JokesAssignment extends StatelessWidget {
  const JokesAssignment({super.key,});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Jokes assignment',
          textAlign: TextAlign.center,
          softWrap: true,
          style: TextStyle(
            fontSize: MediaQuery.sizeOf(context).width * 0.055,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SpaceByPercent(percentHeight: 0.01),

        // solve jokes assignment
        BlocBuilder<MainCubit, MainState>(
          buildWhen: (previous, current) {
            return previous.isLoading != current.isLoading
                || previous.currentListJokes != current.currentListJokes;
          },
          builder: (contextCubit, state) {
            contextCubit.read<MainCubit>().solveAlgorithmAssignment();
            if (state.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            // prepare data to display
            final random = contextCubit.read<MainCubit>().random;
            final noJoke = state.currentListJokes.isEmpty;
            final joke = noJoke
                ? 'That\'s all the jokes for today! Come back another day!'
                : state.currentListJokes[random.nextInt(state.currentListJokes.length)];

            // display as requirements
            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  joke,
                  textAlign: TextAlign.center,
                  softWrap: true,
                  style: const TextStyle(fontSize: 20),
                ),
                const SpaceByPercent(percentHeight: 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: buildButton(
                        text: noJoke ? 'Clear votes' : 'This is Funny!',
                        onPressed: () {
                          if (noJoke) {
                            contextCubit.read<MainCubit>().clearVotes();
                          } else {
                            contextCubit.read<MainCubit>().onVoteJoke(joke);
                          }
                        },
                        color: noJoke
                            ? Theme.of(context).colorScheme.inversePrimary
                            : Colors.blue,
                      ),
                    ),

                    if (!noJoke) ...[
                      const SpaceByPercent(percentWidth: 0.05),
                      Flexible(
                        child: buildButton(
                          text: 'This is not funny.',
                          onPressed: () {
                            contextCubit.read<MainCubit>().onVoteJoke(joke);
                          },
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  Widget buildButton({
    required String text,
    required VoidCallback onPressed,
    Color? color,
  }) {
    return FilledButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(color),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
