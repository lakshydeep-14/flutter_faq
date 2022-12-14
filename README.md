# Flutter FAQs [Frequently Asked Question]

This plugin helps you to display FAQs in your Flutter projects as a custom widget.

## Table of contents

- [Features](#features)
- [Installation](#installation)
- [Usages](#usages)
- [Support and feedback](#support-and-feedback)


## Features

You can:
*  use this for showing FAQs.
*  add textstyle for both questions and answers.
*  give your icons on expnding and collasped.
*  give padding to answers.
*  show divider or not or your own widget as a separator.


## Installation

Add package to the the pubspec.yaml.

```dart
flutter_faq:
```

## Usages

Import the package.

```dart
import 'package:flutter_faq/flutter_faq.dart';
```

Add FAQ widget to the widget tree

```dart
FAQ(question: "Question 1", answer: "data"),
```

For Styling Questions and Answers

```dart
FAQ(
    question: "Question",
    answer: "data",
    ansStyle: const TextStyle(color: Colors.blue, fontSize: 15),
    queStyle: const TextStyle(color: Colors.green, fontSize: 35),
    ),
```

For giving padding in answer

```dart
FAQ(
    question: "Question",
    answer: "data",
    ansPadding: const EdgeInsets.all(50),
    ),
```

For giving custom divider

```dart
FAQ(
    question: "Question",
    answer: "data",
    separator: Container(
        height: 5,
        width: double.infinity,
        color: Colors.purple,
    ),
    ),
```

For giving custom expanded and collapsed icon

```dart
FAQ(
    question: "Question",
    answer: "data",
    expandedIcon: const Icon(Icons.minimize),
    collapsedIcon: const Icon(Icons.add),
    ),
```

For no showing divider

```dart
FAQ(
    question: "Question",
    answer: "data",
    separator:false
    ),
```


## Support and feedback

If I miss to add some feature, feel free to open a ticket or contribute!
You can reach me here:
[LinkedIn](https://www.linkedin.com/in/lakshydeep-14/) | 
[GitHub](https://github.com/lakshydeep-14) | 
[Medium](https://lakshydeep-14.medium.com/) | 
[Google DevLibrary](https://devlibrary.withgoogle.com/authors/lakshydeep-14)