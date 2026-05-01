import 'package:day2_provider_migration/notifiers/counter_notifier.dart';
import 'package:day2_provider_migration/screens/counter_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CounterNotifier(),
      child: MaterialApp(
        title: 'Day 2 _ Provider',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: .fromSeed(seedColor: Color(0xFF7B61FF),
          brightness: Brightness.dark
          ),
          useMaterial3: true,
        ),
        home: CounterScreen(),
      ),
    );
  }
}
