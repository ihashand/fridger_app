import 'package:flutter/material.dart';

class AddFoodToMealWidget extends StatelessWidget {
  const AddFoodToMealWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Szukaj',
                  border: InputBorder.none,
                  icon: Icon(Icons.search),
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.camera_alt),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Obsługa naciśnięcia przycisku sortowania
                    },
                    icon: const Icon(Icons.sort),
                    label: const Text('Sortuj'),
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Obsługa naciśnięcia przycisku filtrowania
                    },
                    icon: const Icon(Icons.filter_list),
                    label: const Text('Filtruj'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5, // Liczba pozycji do wyświetlenia
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text('Posiłek ${index + 1}'),
                  onTap: () {
                    // Obsługa naciśnięcia pozycji na liście
                  },
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Obsługa naciśnięcia przycisku Ulubione
                },
                child: const Text('Ulubione'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Obsługa naciśnięcia przycisku Własne
                },
                child: const Text('Własne'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Obsługa naciśnięcia przycisku Nowa potrawa
                },
                child: const Text('Nowa potrawa'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Obsługa naciśnięcia przycisku Nowy produkt
                },
                child: const Text('Nowy produkt'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
