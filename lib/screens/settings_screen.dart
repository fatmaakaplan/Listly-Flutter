import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/themes.dart'; // ThemeProvider'ı import et

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ayarlar',
          style: TextStyle(
            color: Colors.deepPurpleAccent,
          ),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: [
            // Tema Ayarı
            ListTile(
              leading: Icon(Icons.palette,
                  color: Theme.of(context).colorScheme.primary),
              title: Text('Tema',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary)),
              trailing: Switch(
                value: Theme.of(context).brightness == Brightness.dark,
                onChanged: (value) {
                  context
                      .read<ThemeProvider>()
                      .toggleTheme(); // Tema değiştirme
                },
              ),
            ),
            const Divider(),

            // Bildirim Ayarı
            ListTile(
              leading: Icon(Icons.notifications,
                  color: Theme.of(context).colorScheme.primary),
              title: Text('Bildirimler',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary)),
              trailing: Switch(
                value: true,
                onChanged: (value) {},
              ),
            ),
            const Divider(),

            // Dil Ayarı
            ListTile(
              leading: Icon(Icons.language,
                  color: Theme.of(context).colorScheme.primary),
              title: Text('Dil',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary)),
              trailing: DropdownButton<String>(
                value: 'TR',
                items: ['TR', 'EN'].map((String value) {
                  return DropdownMenuItem<String>(
                      value: value, child: Text(value));
                }).toList(),
                onChanged: (String? newValue) {},
              ),
            ),
            const Divider(),

            // Uygulama Hakkında
            ListTile(
              leading: Icon(Icons.info,
                  color: Theme.of(context).colorScheme.primary),
              title: Text('Uygulama Hakkında',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary)),
              trailing: Icon(Icons.arrow_forward_ios,
                  size: 16, color: Theme.of(context).colorScheme.primary),
              onTap: () {},
            ),
            const Divider(),

            // Gizlilik Politikası
            ListTile(
              leading: Icon(Icons.privacy_tip,
                  color: Theme.of(context).colorScheme.primary),
              title: Text('Gizlilik Politikası',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary)),
              trailing: Icon(Icons.arrow_forward_ios,
                  size: 16, color: Theme.of(context).colorScheme.primary),
              onTap: () {},
            ),
            const Divider(),

            // Hesabı Sil
            ListTile(
              leading: Icon(Icons.delete, color: Colors.red),
              title: Text('Hesabı Sil', style: TextStyle(color: Colors.red)),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
