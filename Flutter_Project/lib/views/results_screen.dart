import 'package:flutter/material.dart';
import 'package:flashcards_quiz/views/home_screen.dart';
import 'package:flashcards_quiz/widgets/results_card.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    Key? key,
    required this.score,
    required this.totalQuestions,
    required this.whichTopic,
  }) : super(key: key);

  final int score;
  final int totalQuestions;
  final String whichTopic;

  @override
  Widget build(BuildContext context) {
    const Color bgColor3 = Color.fromARGB(255, 128, 17, 17);
    final double percentageScore = (score / totalQuestions) * 100;
    final int roundedPercentageScore = percentageScore.round();
    const Color cardColor = Color.fromARGB(255, 215, 1, 11);
    return PopScope(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: bgColor3,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {
                // Navigate to the home screen when the close button is pressed
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                  (route) => false,
                );
              },
              icon: const Icon(
                Icons.close,
                color: Colors.white,
              ),
            ),
          ],
        ),
        backgroundColor: bgColor3,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Results On Your ",
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                    ),
                    for (var i = 0; i < "Riddles!!!".length; i++) ...[
                      TextSpan(
                        text: "Riddles!!!"[i],
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  fontSize: 18 + i.toDouble(),
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                      ),
                    ]
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  whichTopic.toUpperCase(),
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                ),
              ),
              ResultsCard(
                roundedPercentageScore: roundedPercentageScore,
                bgColor3: bgColor3,
              ),
              const SizedBox(
                height: 25,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(cardColor),
                  fixedSize: MaterialStateProperty.all(
                    Size(MediaQuery.of(context).size.width * 0.80, 40),
                  ),
                  elevation: MaterialStateProperty.all(4),
                ),
                onPressed: () {
                  // Navigate to the home screen when the button is clicked
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                    (route) => false,
                  );
                },
                child: const Text(
                  "Take another test",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
