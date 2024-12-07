import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'screens/loading_screen.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false; // Temanın durumu

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter App',
      themeMode:
          _isDarkMode ? ThemeMode.dark : ThemeMode.light, // Temayı ayarlama
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }

  // Tema değiştirme fonksiyonu
  void toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode; // Temayı değiştir
    });
  }
}

// Router yapılandırması
final router = GoRouter(
  initialLocation: '/', // Başlangıç yolu
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoadingScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) {
        return HomeScreen(
          onThemeChange: () {
            // Tema değiştirme işlevini tetikleme
            final appState = context.findAncestorStateOfType<_MyAppState>();
            appState?.toggleTheme(); // Tema değiştir
          },
        );
      },
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const LoginScreen(),
    ),
  ],
);
