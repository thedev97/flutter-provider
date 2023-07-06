import 'package:flutter/material.dart';
import 'app/modules/auth/login.dart';
import 'app/provider/auth_state.dart';
import 'app/provider/theme_state.dart';
import 'package:provider/provider.dart';
import 'app/provider/slider_state.dart';
import 'app/provider/counter_state.dart';
import 'app/provider/favourite_state.dart';

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
          ChangeNotifierProvider(
            create: (_) => ThemeProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => AuthProvider(),
          ),
        ],
        child: Builder(
          builder: (BuildContext context) {
            var themeChangerProvider = Provider.of<ThemeProvider>(context);
            return MaterialApp(
              title: 'Master Provider',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                brightness: Brightness.light,
                primarySwatch: Colors.red,
              ),
              themeMode: themeChangerProvider.themeMode,
              darkTheme: ThemeData(brightness: Brightness.dark),
              home: const Login(),
            );
          },
        ));
  }
}
