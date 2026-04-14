import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const SupportersApp());
}

class SupportersApp extends StatelessWidget {
  const SupportersApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Supporters Hub',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.grey[100],
        useMaterial3: true,
),
      home: const HomePage(),
    );
  }
}