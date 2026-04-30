import 'package:day1_inherited_widget/counter_provider.dart';
import 'package:day1_inherited_widget/screens/counter_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      child: MaterialApp(
        title: 'DAY 1 _ InheritedWidget',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: .fromSeed(
            seedColor: Color(0xFF00E5C8),
            brightness: Brightness.dark,
          ),

          useMaterial3: true,
        ),
        home: CounterScreen(),
      ),
    );
  }
}
