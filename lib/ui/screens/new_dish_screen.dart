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

  final List<String> _steps = [];
  final List<String> _ingredients = [];

  void _addStep() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Dodaj krok'),
          content: TextField(
            controller: _instructionController,
            decoration: const InputDecoration(
              hintText: 'Wpisz krok',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  final int stepNumber = _steps.length + 1;
                  _steps
                      .add('Krok $stepNumber: ${_instructionController.text}');
                  _instructionController.clear();
                });
                Navigator.pop(context);
              },
              child: const Text('Dodaj'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Anuluj'),
            ),
          ],
        );
      },
    );
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
              ListView.builder(
                shrinkWrap: true,
                itemCount: _steps.length,
                itemBuilder: (BuildContext context, int index) {
                  final String step = _steps[index];
                  return Row(
                    children: [
                      Expanded(
                        child: Text(step),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            _steps.removeAt(index);
                          });
                        },
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 16.0),
              Row(
                children: [
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
              const SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _durationController,
                      decoration: const InputDecoration(
                        hintText: 'Czas przygotowania (w minutach)',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _quantityController,
                      decoration: const InputDecoration(
                        hintText: 'Ilość porcji',
                      ),
                    ),
                  ),
                ],
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
