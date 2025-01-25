import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import '../widgets/bottom_menu.dart';
import '../core/themes.dart';
import '../widgets/bottom_menu.dart';

class HomeScreen extends StatefulWidget {
  final void Function() onThemeChange; // Tema değiştirme fonksiyonu

  const HomeScreen({super.key, required this.onThemeChange});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> tasks = []; // Görev listesi (metin + durum)
  final TextEditingController taskController = TextEditingController();
  bool _isDarkMode = false; // Dark mode durumunu tutan değişken

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'H O M E',
          style: TextStyle(
            color: Colors.deepPurpleAccent,
          ),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.calendar_today),
            color: Theme.of(context).colorScheme.onPrimary,
            onPressed: () {}, // Takvim işlevi henüz tanımlanmamış
          ),
          // Tema değiştirme butonu
          IconButton(
            icon: Icon(
              _isDarkMode ? CupertinoIcons.sun_max : CupertinoIcons.moon_fill,
            ),
            color: Colors.deepPurpleAccent,
            onPressed: () {
              setState(() {
                _isDarkMode = !_isDarkMode; // Tema durumu değiştiriliyor
              });
              widget.onThemeChange(); // Tema değiştirme fonksiyonu çağrılıyor
            },
          ),
        ],
      ),

      // Sol üstteki 3 çizgili menü simgesi
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                child: Icon(
                  CupertinoIcons.person_circle,
                  size: 50,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
              accountName: const Text(
                "Hoşgeldiniz",
              ),
              accountEmail: null,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary, // Tema rengi
              ),
            ),
            // Ana Sayfa menüsü
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Theme.of(context).colorScheme.primary, // Yazının rengi
              ),
              title: Text(
                'Ana Sayfa',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary, // Yazının rengi
                ),
              ),
              onTap: () => Navigator.pop(context),
            ),
            // Arama Geçmişi menüsü

            // Profil menüsü
            ListTile(
              leading: Icon(
                CupertinoIcons.person,
                color: Theme.of(context).colorScheme.primary, // Yazının rengi
              ),
              title: Text(
                'Profil',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary, // Yazının rengi
                ),
              ),
              onTap: () => context.push("/profile"),
            ),
            // Ayarlar menüsü
            ListTile(
              leading: Icon(
                CupertinoIcons.settings,
                color: Theme.of(context).colorScheme.primary, // Yazının rengi
              ),
              title: Text(
                'Ayarlar',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary, // Yazının rengi
                ),
              ),
              onTap: () => context.push("/settings"),
            ),
            const Spacer(),
            const Divider(),
            // Çıkış Yap menüsü
            ListTile(
              leading: Icon(
                Icons.logout,
                color: Theme.of(context).colorScheme.primary, // Yazının rengi
              ),
              title: Text(
                'Çıkış Yap',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary, // Yazının rengi
                ),
              ),
              onTap: () => context.go("/loading"),
            ),
          ],
        ),
      ),

      // Görev Listesi ve Arka Plan Rengi
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            // Görev Listesi
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      CheckboxListTile(
                        title: Text(
                          tasks[index]['text'],
                          style: const TextStyle(color: Colors.white),
                        ),
                        value: tasks[index]['completed'],
                        onChanged: (bool? value) {
                          setState(() {
                            tasks[index]['completed'] = value!;
                          });
                        },
                        secondary: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            setState(() {
                              tasks.removeAt(index);
                            });
                          },
                        ),
                        activeColor: Colors.green,
                      ),
                      const Divider(
                        color: Colors.white,
                        thickness: 2,
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),

      // Alt menü (BottomMenu)
      bottomNavigationBar: const BottomMenu(),

      // Artı Tuşu (FloatingActionButton)
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddTaskDialog(
              context); // Yeni görev eklemek için diyalog kutusunu aç
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  // Görev ekleme diyalog kutusu
  void _showAddTaskDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Görev Ekle'),
        content: TextField(
          controller: taskController,
          decoration: const InputDecoration(
            hintText: 'Görev yazınız',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Diyalog kutusunu kapat
            },
            child: const Text('İptal'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                tasks.add({
                  'text': taskController.text,
                  'completed': false,
                });
              });
              taskController.clear(); // TextField temizlenir
              Navigator.of(context).pop(); // Diyalog kutusunu kapat
            },
            child: const Text('Ekle'),
          ),
        ],
      ),
    );
  }
}
