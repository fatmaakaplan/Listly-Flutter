import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart'; // GoRouter kullanarak yönlendirme yapacağız

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
        titleTextStyle: TextStyle(color: Colors.white),
        backgroundColor: Colors.deepPurpleAccent, // Profil ekranı için renk
        leading: IconButton(
          icon: const Icon(Icons.home), // Sol üstte "Home" ikonu
          onPressed: () {
            // Ana sayfaya yönlendir
            GoRouter.of(context).go('/home'); // Ana sayfaya git
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Kullanıcı adı ve şifre girişi
            TextField(
              decoration: InputDecoration(
                labelText: 'Kullanıcı Adı',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Şifre',
                border: OutlineInputBorder(),
              ),
              obscureText: true, // Şifreyi gizler
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Giriş yapma işlemi burada yapılabilir
                GoRouter.of(context).go('/home'); // Ana sayfaya yönlendirme
              },
              child: const Text('Giriş Yap'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple[50], // Düğme rengi
              ),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                // Yeni hesap oluştur sayfasına yönlendirme
                GoRouter.of(context).go(
                    '/profile_screen'); // 'profile_screen' yoluna yönlendirme
              },
              child: const Text('Yeni hesap oluştur'),
            ),
          ],
        ),
      ),
    );
  }
}
