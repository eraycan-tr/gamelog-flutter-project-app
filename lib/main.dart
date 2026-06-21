import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/detail_page.dart';
import 'pages/cart_page.dart';

void main() {
  runApp(const GamerLogApp());
}

class GamerLogApp extends StatelessWidget {
  const GamerLogApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GamerLog App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/detail': (context) => const DetailPage(),
        '/cart': (context) => const CartPage(),
      },
    );
  }
}
