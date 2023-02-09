import 'package:crypto_list/screens/crypto_details.dart';
import 'package:crypto_list/screens/home_screen.dart';
import 'package:flutter/material.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeSreen(),
      onGenerateRoute: (RouteSettings settings) {
        debugPrint('build route for ${settings.name}');
        var routes = <String, WidgetBuilder>{
          '/home': (BuildContext context) => const HomeSreen(),
          '/detail': (BuildContext context) => CryptoDetailsScreen(
              details: settings.arguments as Map<String, dynamic>),
        };
        WidgetBuilder builder = routes[settings.name]!;
        return MaterialPageRoute(
          builder: (ctx) => builder(ctx),
        );
      },
    );
  }
}
