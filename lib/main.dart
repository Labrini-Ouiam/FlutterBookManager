import 'package:flutter/material.dart';
import 'pages/search_page.dart';
import 'pages/favorites_page.dart';

void main() {
  runApp(BookApp());
}

class BookApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Manager',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SearchPage(),
      routes: {
        '/favorites': (context) => FavoritesPage(),
      },
    );
  }
}
