class LayOutQuestion {
  final int id;
  final String text;
  final List<LayOutOption> options;
  bool isLocked;
  LayOutOption? selectedWiidgetOption;
  LayOutOption? correctAnswer;
  // final int timeSeconds;

  LayOutQuestion({
    required this.text,
    required this.options,
    this.isLocked = false,
    this.selectedWiidgetOption,
    required this.id,
    required this.correctAnswer,
    //  required this.timeSeconds
  });

  LayOutQuestion copyWith() {
    return LayOutQuestion(
      id: id,
      text: text,
      options: options
          .map(
            (option) =>
                LayOutOption(text: option.text, isCorrect: option.isCorrect),
          )
          .toList(),
      isLocked: isLocked,
      selectedWiidgetOption: selectedWiidgetOption,
      correctAnswer: correctAnswer,
    );
  }
}

class LayOutOption {
  final String text;
  final bool isCorrect;

  const LayOutOption({
    required this.text,
    required this.isCorrect,
  });
}

final layOutQuestionsList = [
  LayOutQuestion(
    text: "Heiritage",
    options: [
      const LayOutOption(text: "MainAxisAlignment", isCorrect: true),
      const LayOutOption(text: "Row", isCorrect: false),
      const LayOutOption(text: "CrossAxisAlignment", isCorrect: false),
      const LayOutOption(text: "mainAxisSize", isCorrect: false),
    ],
    id: 0,
    correctAnswer:
        const LayOutOption(text: "MainAxisAlignment", isCorrect: true),
  ),
  LayOutQuestion(
    text: "Seldomly",
    options: [
      const LayOutOption(text: "Flexible ", isCorrect: true),
      const LayOutOption(text: "Expanded", isCorrect: false),
      const LayOutOption(text: "Flex", isCorrect: false),
      const LayOutOption(text: "mainAxisSpacing", isCorrect: false),
    ],
    id: 1,
    correctAnswer: const LayOutOption(text: "Flexible", isCorrect: true),
  ),

  LayOutQuestion(
    text: "Adverse",
    options: [
      const LayOutOption(text: "Container ", isCorrect: true),
      const LayOutOption(text: "SizedBox", isCorrect: false),
      const LayOutOption(text: "Card", isCorrect: false),
      const LayOutOption(text: "Row", isCorrect: false),
    ],
    id: 2,
    correctAnswer: const LayOutOption(text: "Container", isCorrect: true),
  ),

  LayOutQuestion(
    text: "Leisure",
    options: [
      const LayOutOption(text: "SingleChildScrollView", isCorrect: false),
      const LayOutOption(text: "crossAxisCount", isCorrect: false),
      const LayOutOption(text: "MainAxisAlignment ", isCorrect: true),
      const LayOutOption(text: "crossAxisSpacing", isCorrect: false),
    ],
    id: 3,
    correctAnswer:
        const LayOutOption(text: "MainAxisAlignment ", isCorrect: true),
  ),
  // other 4
  LayOutQuestion(
    text: "Optimizing",
    options: [
      const LayOutOption(text: "Align", isCorrect: false),
      const LayOutOption(text: "FittedBox", isCorrect: false),
      const LayOutOption(text: "Postioned", isCorrect: false),
      const LayOutOption(text: "Stack ", isCorrect: true),
    ],
    id: 4,
    correctAnswer: const LayOutOption(text: "Stack ", isCorrect: true),
  ),
  LayOutQuestion(
    text: "Adverse",
    options: [
      const LayOutOption(text: "Row ", isCorrect: true),
      const LayOutOption(text: "Divider", isCorrect: false),
      const LayOutOption(text: "Column", isCorrect: false),
      const LayOutOption(text: "Stack", isCorrect: false),
    ],
    id: 5,
    correctAnswer: const LayOutOption(text: "Row", isCorrect: true),
  ),

  LayOutQuestion(
    text: "Context",
    options: [
      const LayOutOption(text: "Row", isCorrect: false),
      const LayOutOption(text: "Align", isCorrect: false),
      const LayOutOption(text: "Spacer", isCorrect: false),
      const LayOutOption(text: "MainAxisAlignment ", isCorrect: true),
    ],
    id: 6,
    correctAnswer:
        const LayOutOption(text: "MainAxisAlignment ", isCorrect: true),
  ),
  LayOutQuestion(
    text: "Align",
    options: [
      const LayOutOption(text: "Expanded", isCorrect: false),
      const LayOutOption(text: "Flex ", isCorrect: true),
      const LayOutOption(text: "FittedBox", isCorrect: false),
      const LayOutOption(text: "Wrap", isCorrect: false),
    ],
    id: 7,
    correctAnswer: const LayOutOption(text: "Scoped Model", isCorrect: true),
  ),
];
