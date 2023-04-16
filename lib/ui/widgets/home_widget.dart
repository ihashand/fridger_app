import 'package:flutter/material.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          MealButton(name: 'Sniadanie', meals: [
            Meal(
                name: "Omlet z szynką",
                calories: 300,
                protein: 20,
                carbs: 5,
                fat: 22),
            Meal(
              name: "Kanapka z awokado",
              calories: 400,
              protein: 10,
              carbs: 30,
              fat: 25,
            )
          ]),
          SizedBox(height: 16), // <-- Odstęp między elementami
          MealButton(name: 'Obiad', meals: []),
          SizedBox(height: 16),
          MealButton(name: 'Kolacja', meals: [
            Meal(
                name: "Schabowy",
                calories: 300,
                protein: 20,
                carbs: 5,
                fat: 22),
          ])
        ],
      ),
    );
  }
}

class MealButton extends StatefulWidget {
  final String name;
  final List<Meal> meals;

  const MealButton({Key? key, required this.name, required this.meals})
      : super(key: key);

  @override
  _MealButtonState createState() => _MealButtonState();
}

class _MealButtonState extends State<MealButton> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final kcalSum =
        widget.meals.fold<int>(0, (prev, curr) => prev + curr.calories);
    final proteinSum =
        widget.meals.fold<int>(0, (prev, curr) => prev + curr.protein);
    final carbsSum =
        widget.meals.fold<int>(0, (prev, curr) => prev + curr.carbs);
    final fatSum = widget.meals.fold<int>(0, (prev, curr) => prev + curr.fat);

    return GestureDetector(
      onTap: () => setState(() => _isExpanded = !_isExpanded),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        width: _isExpanded
            ? 500
            : 300, // Odpowiada za rozmiary wyswietlanych okien, przed otwarciem i po otwarciu
        height: _isExpanded ? 100 + widget.meals.length * 80 : 60,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Text(
              widget.name,
              style: const TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            if (!_isExpanded)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('kcal: $kcalSum B: $proteinSum W: $carbsSum T: $fatSum'),
                ],
              ),
            if (_isExpanded)
              Expanded(
                child: ListView.builder(
                  itemCount: widget.meals.length,
                  itemBuilder: (BuildContext context, int index) {
                    Meal meal = widget.meals[index];
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(),
                          child: Text(
                            meal.name,
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 13),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  const SizedBox(width: 4),
                                  const Icon(Icons.local_dining, size: 11),
                                  Text(
                                    'kcal: ${meal.calories}',
                                    style: const TextStyle(fontSize: 11),
                                  ),
                                  const Icon(Icons.ac_unit_sharp, size: 11),
                                  Text(
                                    '${meal.protein}g',
                                    style: const TextStyle(fontSize: 11),
                                  ),
                                  const SizedBox(width: 4),
                                  const Icon(Icons.grain, size: 11),
                                  Text(
                                    '${meal.carbs}g',
                                    style: const TextStyle(fontSize: 11),
                                  ),
                                  const SizedBox(width: 4),
                                  const Icon(Icons.local_pizza, size: 11),
                                  Text(
                                    '${meal.fat}g',
                                    style: const TextStyle(fontSize: 11),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      // obsługa naciśnięcia przycisku opcji
                                    },
                                    icon: const Icon(Icons.settings, size: 11),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        if (index ==
                            widget.meals.length -
                                1) // sprawdza czy to ostatni posiłek
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const SizedBox(height: 16),
                                const Text(
                                  'kcal:',
                                  style: TextStyle(fontSize: 16),
                                ),
                                Text(
                                  '${_calculateTotalCalories()}',
                                  style: const TextStyle(fontSize: 16),
                                ),
                                const Text(
                                  'Białko:',
                                  style: TextStyle(fontSize: 16),
                                ),
                                Text(
                                  '${_calculateTotalProtein()}g',
                                  style: const TextStyle(fontSize: 16),
                                ),
                                const Text(
                                  'Węglowodany:',
                                  style: TextStyle(fontSize: 16),
                                ),
                                Text(
                                  '${_calculateTotalCarbs()}g',
                                  style: const TextStyle(fontSize: 16),
                                ),
                                const Text(
                                  'Tłuszcz:',
                                  style: TextStyle(fontSize: 16),
                                ),
                                Text(
                                  '${_calculateTotalFat()}g',
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }

  int _calculateTotalCalories() {
    int totalCalories = 0;
    for (Meal meal in widget.meals) {
      totalCalories += meal.calories;
    }
    return totalCalories;
  }

  int _calculateTotalProtein() {
    int totalProtein = 0;
    for (Meal meal in widget.meals) {
      totalProtein += meal.protein;
    }
    return totalProtein;
  }

  int _calculateTotalCarbs() {
    int totalCarbs = 0;
    for (Meal meal in widget.meals) {
      totalCarbs += meal.carbs;
    }
    return totalCarbs;
  }

  int _calculateTotalFat() {
    int totalFat = 0;
    for (Meal meal in widget.meals) {
      totalFat += meal.fat;
    }
    return totalFat;
  }
}

class Meal {
  final String name;
  final int calories;
  final int protein;
  final int carbs;
  final int fat;

  const Meal({
    required this.name,
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.fat,
  });
}
