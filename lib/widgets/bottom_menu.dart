import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomMenu extends StatelessWidget {
  const BottomMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white, // Alt menünün arka plan rengi
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Ana Sayfa
          IconButton(
            onPressed: () {
              context.go("/home");
            },
            icon: const Icon(
              CupertinoIcons.home,
              color: Colors.black, // İkon rengi
            ),
          ),
          // Arama
          IconButton(
            onPressed: () {
              context.go("/search");
            },
            icon: const Icon(
              CupertinoIcons.search,
              color: Colors.black,
            ),
          ),
          // Sesli Asistan
          IconButton(
            onPressed: () {
              context.go("/voice");
            },
            icon: const Icon(
              Icons.mic, // Sesli asistan için mikrofon ikonu
              color: Colors.black,
            ),
          ),
          // Geçmiş
          IconButton(
            onPressed: () {
              context.go("/history");
            },
            icon: const Icon(
              Icons.history,
              color: Colors.black,
            ),
          ),
          // Profil
          IconButton(
            onPressed: () {
              context.go("/profile");
            },
            icon: const Icon(
              CupertinoIcons.person,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
