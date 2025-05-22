import 'package:flutter/material.dart';
import 'package:sesi5/screens/QuoteHomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        appBarTheme: AppBarTheme(
          backgroundColor: const Color.fromARGB(255, 255, 188, 210),
          foregroundColor: Colors.white,
        ),
      ),
      home: QuoteHomePage(),
    );
  }
}
