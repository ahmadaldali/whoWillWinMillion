import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:who_will_win_million/home.dart';
import 'package:who_will_win_million/provider_class.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ProviderClass(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'من سيربح المليون',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}
