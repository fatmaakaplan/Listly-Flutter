import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_app/screens/loading_screen.dart';
import 'package:flutter_app/screens/home_screen.dart';
import 'package:flutter_app/screens/login_screen.dart';

// Tema değiştirme fonksiyonu
void toggleTheme(BuildContext context) {
  final appState = context.findAncestorStateOfType<
      _MyAppState>(); // _MyAppState tipinde olan state'i bulmaya çalışıyoruz
  if (appState != null) {
    appState.toggleTheme(); // Tema değiştir
  }
}

// Router yapılandırması
final router = GoRouter(
  initialLocation: '/', // Başlangıç rotası
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoadingScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) {
        // HomeScreen'e onThemeChange fonksiyonu geçiyoruz
        return HomeScreen(onThemeChange: () => toggleTheme(context));
      },
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const LoginScreen(),
    ),
  ],
);

// MyApp StatefulWidget ve State sınıfı
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false;

  void toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode; // Tema durumunu değiştir
    });
  }

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
}
