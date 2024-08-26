import 'package:flutter/widgets.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          //now remember that you can only pass widgets into this column section
          //but from above we know that we only accept Map values so here we use
          //map(){} which we know automatically tranforms a given set of elements
          //into another set like here we want to convert it to widget
          children: summaryData.map(
            (data) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 19),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ((data['question_index'] as int) + 1).toString(),
                      style: const TextStyle(
                        color: Color.fromARGB(210, 245, 225, 249),
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            data['question'] as String,
                            style: const TextStyle(
                              color: Color.fromARGB(210, 245, 225, 249),
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            data['user_answer'] as String,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 214, 214, 214),
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            data['correct_answer'] as String,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 134, 214, 84),
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
