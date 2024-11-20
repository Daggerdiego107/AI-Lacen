import 'package:flutter/material.dart';
import 'pages/home_page_widget.dart';
import 'pages/recetas.dart';
import 'pages/sidemnu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navigation Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/home', // Initial route to HomePageWidget
      routes: {
        '/home': (context) => const HomePageWidget(),
        '/recetas': (context) => const RecetasWidget(),
        '/sidemnu': (context) => const SidemnuWidget(),
      },
    );
  }
}
