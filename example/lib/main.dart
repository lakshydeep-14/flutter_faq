import 'package:flutter/material.dart';
import 'package:flutter_faq/flutter_faq.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(children: [
            FAQ(
              question: "Question 1",
              answer: data,
              ansDecoration: BoxDecoration(
                  color: Colors.grey[500],
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              queDecoration: BoxDecoration(
                  color: Colors.grey[500],
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
            ),
            FAQ(question: "Question2", answer: data),
            FAQ(
              question: "Question 3",
              answer: data,
              ansStyle: const TextStyle(color: Colors.blue, fontSize: 15),
              queStyle: const TextStyle(color: Colors.green, fontSize: 35),
            ),
            FAQ(
              question: "Question 4",
              answer: data,
              showDivider: false,
            ),
            FAQ(
              question: "Question 5",
              answer: data,
              expandedIcon: const Icon(Icons.minimize),
              collapsedIcon: const Icon(Icons.add),
              showDivider: false,
              ansStyle: const TextStyle(color: Colors.blue, fontSize: 15),
              ansPadding: const EdgeInsets.all(50),
            ),
            FAQ(
              question: "Question 6",
              answer: data,
              expandedIcon: const Icon(Icons.minimize),
              collapsedIcon: const Icon(Icons.add),
              ansStyle: const TextStyle(color: Colors.blue, fontSize: 15),
              ansPadding: const EdgeInsets.all(50),
              separator: Container(
                height: 5,
                width: double.infinity,
                color: Colors.purple,
              ),
            ),
            FAQ(
              question: "Question 7",
              answer: data,
              expandedIcon: const Icon(Icons.minimize),
              collapsedIcon: const Icon(Icons.add),
              showDivider: false,
              ansStyle: const TextStyle(color: Colors.blue, fontSize: 15),
              ansPadding: const EdgeInsets.all(50),
            ),
          ]),
        ),
      ),
    );
  }
}

String data = """"
Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
""";
