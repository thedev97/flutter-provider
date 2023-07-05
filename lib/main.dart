import 'package:flutter/material.dart';
import 'package:master_provider/app/modules/counter/counter.dart';
import 'package:provider/provider.dart';
import 'app/provider/counter_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CounterProvider(),
      child: MaterialApp(
        title: 'Master Provider',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: const Counter(),
      ),
    );
  }
}
