import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app/provider/slider_state.dart';
import 'app/provider/counter_state.dart';
import 'app/provider/favourite_state.dart';
import 'app/modules/favourite/favourite_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CounterProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => SliderProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => FavouriteProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Master Provider',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: const FavouriteApp(),
      ),
    );
  }
}
