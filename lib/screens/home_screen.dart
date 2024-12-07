import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

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
            color: Color.fromRGBO(139, 21, 58, 1),
          ),
        ),
        backgroundColor: const Color.fromARGB(0, 219, 27, 184),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.calendar_today),
            color: Colors.deepPurpleAccent,
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

      // Görev Listesi
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
                        thickness: 1,
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),

      // Alt navigasyon çubuğu
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Ana Sayfa',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            label: 'Profil',
          ),
        ],
        onTap: (index) {
          if (index == 1) {
            // Profil sayfasına yönlendirme işlemi
            GoRouter.of(context).go('/profile');
          }
        },
      ),

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
