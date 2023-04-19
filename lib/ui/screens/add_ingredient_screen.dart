import 'package:flutter/material.dart';

class AddIngredientScreen extends StatelessWidget {
  const AddIngredientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Expanded(
              child: TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.search),
                  hintText: 'Wyszukaj składnik',
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.camera_alt),
              onPressed: () {
                // Tutaj można dodać funkcjonalność przycisku aparatu
              },
            ),
          ],
        ),
      ),
      body: Container(
        child: Column(
          children: const [
            // Tutaj można dodać pozostałe elementy interfejsu użytkownika
          ],
        ),
      ),
    );
  }
}
