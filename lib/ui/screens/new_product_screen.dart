import 'package:flutter/material.dart';

class NewProductScreen extends StatefulWidget {
  const NewProductScreen({super.key});

  @override
  _NewProductScreenState createState() => _NewProductScreenState();
}

class _NewProductScreenState extends State<NewProductScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _brandController = TextEditingController();
  final TextEditingController _packageSizeController = TextEditingController();
  final TextEditingController _fatController = TextEditingController();
  final TextEditingController _carbsController = TextEditingController();
  final TextEditingController _proteinController = TextEditingController();
  final TextEditingController _barcodeController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _brandController.dispose();
    _packageSizeController.dispose();
    _fatController.dispose();
    _carbsController.dispose();
    _proteinController.dispose();
    _barcodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nowy produkt'),
        actions: [
          ElevatedButton(
            child: const Text('Zapisz'),
            onPressed: () {
              // kod do zapisania produktu
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Nazwa'),
            ),
            TextFormField(
              controller: _brandController,
              decoration: const InputDecoration(labelText: 'Marka'),
            ),
            TextFormField(
              controller: _packageSizeController,
              decoration: const InputDecoration(
                labelText: 'Opakowanie (gram/ml)',
                hintText: 'np. 500 g, 1 l',
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _fatController,
                    decoration:
                        const InputDecoration(labelText: 'Tłuszcze (g)'),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: TextFormField(
                    controller: _carbsController,
                    decoration:
                        const InputDecoration(labelText: 'Węglowodany (g)'),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: TextFormField(
                    controller: _proteinController,
                    decoration: const InputDecoration(labelText: 'Białka (g)'),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                  ),
                ),
              ],
            ),
            TextFormField(
              controller: _barcodeController,
              decoration: InputDecoration(
                labelText: 'Kod kreskowy',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.camera_alt),
                  onPressed: () {
                    // kod do skanowania kodu kreskowego
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
