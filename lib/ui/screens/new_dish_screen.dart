import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NewDishScreen extends StatefulWidget {
  const NewDishScreen({super.key});

  @override
  _NewDishScreenState createState() => _NewDishScreenState();
}

class _NewDishScreenState extends State<NewDishScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ingredientController = TextEditingController();
  final TextEditingController _instructionController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _youtubeController = TextEditingController();
  final TextEditingController _instagramController = TextEditingController();

  List<String> _steps = [];
  List<String> _ingredients = [];
  List<String> _photos = [];

  void _addStep() {
    setState(() {
      _steps.add(_instructionController.text);
      _instructionController.clear();
    });
  }

  void _addIngredient() {
    setState(() {
      _ingredients.add(_ingredientController.text);
      _ingredientController.clear();
    });
  }

  void _addPhoto() {
    // Do implementacji
  }

  void _saveDish() {
    // Do implementacji
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Nowa potrawa'),
          actions: [
            ElevatedButton(
              onPressed: _saveDish,
              child: const Text('Zapisz'),
            ),
          ],
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const FaIcon(FontAwesomeIcons.superscript),
                    onPressed: () {
                      // Tu dodana
                    },
                  ),
                  Expanded(
                    child: TextField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        hintText: 'Wpisz nazwe dla Twojej potrawy!',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              ElevatedButton(
                onPressed: _addPhoto,
                child: const Text('Dodaj zdjęcie'),
              ),
              const SizedBox(height: 8.0),
              ElevatedButton(
                onPressed: _addIngredient,
                child: const Text('Dodaj składniki'),
              ),
              const SizedBox(height: 8.0),
              ElevatedButton(
                onPressed: _addStep,
                child: const Text('Dodaj kroki'),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Czas przygotowania (w minutach)',
                style: TextStyle(fontSize: 16.0),
              ),
              TextField(
                controller: _durationController,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Ilość porcji',
                style: TextStyle(fontSize: 16.0),
              ),
              TextField(
                controller: _quantityController,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  IconButton(
                    icon: const FaIcon(FontAwesomeIcons.youtube),
                    onPressed: () {
                      // Tu dodana
                    },
                  ),
                  Expanded(
                    child: TextField(
                      controller: _youtubeController,
                      decoration: const InputDecoration(
                        hintText: 'Wklej link do Twojego YouTube ',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  IconButton(
                    icon: const FaIcon(FontAwesomeIcons.instagram),
                    onPressed: () {
                      // Tu dodana
                    },
                  ),
                  Expanded(
                    child: TextField(
                      controller: _instagramController,
                      decoration: const InputDecoration(
                        hintText:
                            'Wklej link do Twojego profilu na Instagramie',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        )));
  }
}
