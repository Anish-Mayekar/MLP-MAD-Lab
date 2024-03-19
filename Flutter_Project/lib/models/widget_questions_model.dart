class WidgetQuestion {
  final int id;
  final String text;
  final List<WiidgetOption> options;
  bool isLocked;
  WiidgetOption? selectedWiidgetOption;
  WiidgetOption correctAnswer;

  WidgetQuestion({
    required this.text,
    required this.options,
    this.isLocked = false,
    this.selectedWiidgetOption,
    required this.id,
    required this.correctAnswer,
  });

  WidgetQuestion copyWith() {
    return WidgetQuestion(
      id: id,
      text: text,
      options: options
          .map((option) =>
              WiidgetOption(text: option.text, isCorrect: option.isCorrect))
          .toList(),
      isLocked: isLocked,
      selectedWiidgetOption: selectedWiidgetOption,
      correctAnswer: correctAnswer,
    );
  }
}

class WiidgetOption {
  final String? text;
  final bool? isCorrect;

  const WiidgetOption({
    this.text,
    this.isCorrect,
  });
}

final widgetQuestionsList = [
  WidgetQuestion(
    text: "Attain",
    options: [
      const WiidgetOption(text: "succeed in achieving", isCorrect: true),
      const WiidgetOption(text: "at the side of; next to", isCorrect: false),
      const WiidgetOption(text: "help or support", isCorrect: false),
      const WiidgetOption(text: "reasonably priced", isCorrect: false),
    ],
    id: 0,
    correctAnswer:
        const WiidgetOption(text: "succeed in achieving", isCorrect: true),
  ),
  WidgetQuestion(
      text: "Collide",
      options: [
        const WiidgetOption(text: "Flexible", isCorrect: false),
        const WiidgetOption(text: "hit with force", isCorrect: true),
        const WiidgetOption(text: "in a warm way", isCorrect: false),
        const WiidgetOption(text: "remove or obliterate", isCorrect: false),
      ],
      id: 1,
      correctAnswer:
          const WiidgetOption(text: "hit with force", isCorrect: true)),
  WidgetQuestion(
      text: "Effective",
      options: [
        const WiidgetOption(text: "completely remove", isCorrect: false),
        const WiidgetOption(text: "recognize", isCorrect: false),
        const WiidgetOption(text: "very large", isCorrect: false),
        const WiidgetOption(text: "successful", isCorrect: true),
      ],
      id: 2,
      correctAnswer: const WiidgetOption(
          text: "successful in producing a desired or intended result",
          isCorrect: true)),
  WidgetQuestion(
      text:
          "I am a widget that creates a button with an icon and a label. What am I?",
      options: [
        const WiidgetOption(text: "Elevated Button", isCorrect: false),
        const WiidgetOption(text: "TextButton", isCorrect: false),
        const WiidgetOption(text: "IconButton", isCorrect: true),
        const WiidgetOption(text: "TextButton.icon", isCorrect: false),
      ],
      id: 3,
      correctAnswer: const WiidgetOption(text: "IconButton", isCorrect: true)),
  WidgetQuestion(
      text: "Enormous",
      options: [
        const WiidgetOption(text: "ListTile", isCorrect: false),
        const WiidgetOption(
            text: "completely remove or get rid of something",
            isCorrect: false),
        const WiidgetOption(text: "ListView", isCorrect: false),
        const WiidgetOption(text: "happening often", isCorrect: true),
      ],
      id: 4,
      correctAnswer: const WiidgetOption(text: "GridView", isCorrect: true)),
  WidgetQuestion(
      text: "collapsible",
      options: [
        const WiidgetOption(text: "ExpansionTile", isCorrect: true),
        const WiidgetOption(text: "DropdownButton", isCorrect: false),
        const WiidgetOption(text: "Card", isCorrect: false),
        const WiidgetOption(text: "AppBar", isCorrect: false),
      ],
      id: 5,
      correctAnswer:
          const WiidgetOption(text: "ExpansionTile", isCorrect: true)),
  WidgetQuestion(
      text:
          " I am a widget that provides a rectangular box with a specified width, height, and color. What am I?",
      options: [
        const WiidgetOption(text: "Container", isCorrect: true),
        const WiidgetOption(text: "Card", isCorrect: false),
        const WiidgetOption(text: "SizedBox", isCorrect: false),
        const WiidgetOption(text: "Padding", isCorrect: false),
      ],
      id: 6,
      correctAnswer: const WiidgetOption(text: "Container", isCorrect: true)),
  WidgetQuestion(
      text:
          "I am a widget that displays an image from the specified network URL. What am I?",
      options: [
        const WiidgetOption(text: "Image.network", isCorrect: true),
        const WiidgetOption(text: "AssetImage", isCorrect: false),
        const WiidgetOption(text: "Image.asset", isCorrect: false),
        const WiidgetOption(text: "Image.file", isCorrect: false),
      ],
      id: 7,
      correctAnswer:
          const WiidgetOption(text: "Image.network", isCorrect: true)),
  WidgetQuestion(
      text:
          "I give Material apps their signature reactive ink splash effect. Who am I?",
      options: [
        const WiidgetOption(text: "InkWell", isCorrect: true),
        const WiidgetOption(text: "GestureDetector", isCorrect: false),
        const WiidgetOption(text: "AbsorbPointer", isCorrect: false),
        const WiidgetOption(text: "IgnorePointer", isCorrect: false),
      ],
      id: 8,
      correctAnswer: const WiidgetOption(text: "InkWell", isCorrect: true)),
  WidgetQuestion(
      text:
          "I am a widget that provides a material design styled line divider. What am I?",
      options: [
        const WiidgetOption(text: "Divider", isCorrect: true),
        const WiidgetOption(text: "SizedBox", isCorrect: false),
        const WiidgetOption(text: "Container", isCorrect: false),
        const WiidgetOption(text: "ListTile", isCorrect: false),
      ],
      id: 9,
      correctAnswer: const WiidgetOption(text: "Divider", isCorrect: true)),
  WidgetQuestion(
      text:
          "I am a widget that displays a circular material design spinner to indicate loading. What am I?",
      options: [
        const WiidgetOption(text: "LinearProgressIndicator", isCorrect: false),
        const WiidgetOption(text: "RefreshIndicator", isCorrect: false),
        const WiidgetOption(text: "CircularProgressIndicator", isCorrect: true),
        const WiidgetOption(text: "LoadingIndicator", isCorrect: false),
      ],
      id: 10,
      correctAnswer: const WiidgetOption(
          text: "CircularProgressIndicator", isCorrect: true)),
  WidgetQuestion(
      text:
          "I am a widget that displays a material design styled tooltip when the user hovers over it. What am I?",
      options: [
        const WiidgetOption(text: "Popover", isCorrect: false),
        const WiidgetOption(text: "Tooltip", isCorrect: true),
        const WiidgetOption(text: "Snackbar", isCorrect: false),
        const WiidgetOption(text: "HintText", isCorrect: false),
      ],
      id: 11,
      correctAnswer: const WiidgetOption(text: "Tooltip", isCorrect: true)),
  WidgetQuestion(
      text:
          "I am the folder containing assets like images, fonts, json files etc. What am I?",
      options: [
        const WiidgetOption(text: "static", isCorrect: false),
        const WiidgetOption(text: "assets", isCorrect: true),
        const WiidgetOption(text: "resources", isCorrect: false),
        const WiidgetOption(text: "images", isCorrect: false),
      ],
      id: 12,
      correctAnswer: const WiidgetOption(text: "assets", isCorrect: true)),
  WidgetQuestion(
      text:
          "I am the programming language used to build Flutter apps. What am I?",
      options: [
        const WiidgetOption(text: "Dart", isCorrect: true),
        const WiidgetOption(text: "Java", isCorrect: false),
        const WiidgetOption(text: "Swift", isCorrect: false),
        const WiidgetOption(text: "Kotlin", isCorrect: false),
      ],
      id: 13,
      correctAnswer: const WiidgetOption(text: "Dart", isCorrect: true)),
  WidgetQuestion(
    text:
        "I am a mechanism that allows you to incorporate platform-specific UI elements into a Flutter app. What am I?",
    options: [
      const WiidgetOption(text: "Native view", isCorrect: false),
      const WiidgetOption(text: "Platform channels", isCorrect: true),
      const WiidgetOption(text: "JNI", isCorrect: false),
      const WiidgetOption(text: "Bridge", isCorrect: false),
    ],
    id: 14,
    correctAnswer:
        const WiidgetOption(text: "Platform channels", isCorrect: true),
  ),
  WidgetQuestion(
    text:
        "I am a property that uniquely identifies a widget and allows it to be updated efficiently. What am I?",
    options: [
      const WiidgetOption(text: "key", isCorrect: true),
      const WiidgetOption(text: "id", isCorrect: false),
      const WiidgetOption(text: "name", isCorrect: false),
      const WiidgetOption(text: "tag", isCorrect: false),
    ],
    id: 15,
    correctAnswer: const WiidgetOption(text: "key", isCorrect: true),
  ),
];
