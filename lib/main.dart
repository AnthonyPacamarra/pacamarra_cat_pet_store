import 'package:cat_pet_store_application/provider/cart_provider.dart';
import 'package:cat_pet_store_application/screens/onboarding_screen.dart';
import 'package:provider/provider.dart';
import 'screens/main_screen.dart';
import 'screens/cart_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build (BuildContext context) {
    return MaterialApp (
      debugShowCheckedModeBanner: false,
      title: 'Cat Pet Shop ni Pacamarra',
      initialRoute: "/login",
      routes: {
        "/login": (context) => const OnboardingScren(),
        "/products": (context) => const MainScreen(),
        "/cart": (context) => const CartScreen(),
      },
    ); 
  }
}