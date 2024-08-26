import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key, required this.choosenAnswer, required this.onRestart});

  final List<String> choosenAnswer;
  final VoidCallback onRestart;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenAnswer.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'user_answer': choosenAnswer[i],
          'correct_answer': questions[i].answers[0],
        },
      );
    }
    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
        width: double.infinity,
        child: Container(
            margin: const EdgeInsets.all(60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    "You answered $numCorrectQuestions out of $numTotalQuestions correctly ! ",
                    style: const TextStyle(
                      color: Color.fromARGB(211, 255, 255, 255),
                      fontSize: 23,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                QuestionsSummary(summaryData),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: onRestart,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(215, 210, 124, 185),
                      foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: const Text("Restart Quiz"),
                )
              ],
            )));
  }
}
