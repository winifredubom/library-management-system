import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:library_system/presentation/Books/books_inventory.dart';
import 'package:library_system/presentation/Home/home.dart';
import 'package:library_system/presentation/Users/user_profile.dart'; 


void main() {
  runApp(
    const ProviderScope(child:  MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Library System',
      theme: ThemeData(
    
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/book_inventory': (context) => const BookInventory(),
        '/user_profile': (context) => const UserProfile(),
      },
    );
  }
}

