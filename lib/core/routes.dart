import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/loading_screen.dart';
import '../screens/home_screen.dart';
import '../screens/login_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/settings_screen.dart';

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
      path: '/loading',
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
      builder: (context, state) =>
          const ProfileScreen(), // Profil ekranını doğru şekilde tanımlayın
    ),

    // Settings ekranı için rota
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsScreen(),
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

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profil')),
      body: Center(child: Text('Profil Ekranı')),
    );
  }
}
