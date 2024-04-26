import 'package:flutter/material.dart';
import 'package:test_project/extensions/context_extenstions.dart';
import 'package:test_project/views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          background: const Color(0xffb6e4fe),
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(
            color: const Color(0xff401bb9),
            fontFamily: 'Anglecia Pro',
            fontSize: context.mqSize.height * 0.054,
          ),
          bodySmall: TextStyle(
            color: const Color(0xff401bb9),
            fontFamily: 'Anglecia Pro',
            fontSize: context.mqSize.height * 0.038,
          ),
        ),
        useMaterial3: true,
      ),
      home: const HomeView(),
    );
  }
}
