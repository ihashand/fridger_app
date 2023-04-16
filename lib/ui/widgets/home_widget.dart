import 'package:flutter/material.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          MealButton(name: 'Sniadanie', meals: <Meal>[
            Meal(
                name: 'Omlet z szynką',
                calories: 300,
                protein: 20,
                carbs: 5,
                fat: 22),
            Meal(
              name: 'Kanapka z awokado',
              calories: 400,
              protein: 10,
              carbs: 30,
              fat: 25,
            )
          ]),
          SizedBox(height: 16), // <-- Odstęp między elementami
          MealButton(name: 'Obiad', meals: <Meal>[
            Meal(
                name: 'Schabowy',
                calories: 300,
                protein: 20,
                carbs: 5,
                fat: 22),
            Meal(
              name: 'Sałatka z warzywami',
              calories: 350,
              protein: 8,
              carbs: 25,
              fat: 25,
            ),
          ]),
          SizedBox(height: 16),
          MealButton(name: 'Kolacja', meals: <Meal>[
            Meal(
                name: 'Schabowy',
                calories: 300,
                protein: 20,
                carbs: 5,
                fat: 22),
            Meal(
              name: 'Sałatka z warzywami',
              calories: 350,
              protein: 8,
              carbs: 25,
              fat: 25,
            ),
          ])
        ],
      ),
    );
  }
}

class MealButton extends StatefulWidget {
  const MealButton({Key? key, required this.name, required this.meals})
      : super(key: key);
  final String name;
  final List<Meal> meals;

  @override
  MealButtonState createState() => MealButtonState();
}

class MealButtonState extends State<MealButton> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => _isExpanded = !_isExpanded),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        width: _isExpanded ? 300 : 100,
        height: _isExpanded ? 50 + widget.meals.length * 80 : 50,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 10),
            Text(
              widget.name,
              style: const TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            if (_isExpanded)
              Expanded(
                child: ListView.builder(
                  itemCount: widget.meals.length,
                  itemBuilder: (BuildContext context, int index) {
                    Meal meal = widget.meals[index];
                    return Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          child: Text(
                            meal.name,
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'kcal: ${meal.calories}',
                                style: const TextStyle(fontSize: 16),
                              ),
                              Row(
                                children: <Widget>[
                                  const SizedBox(width: 4),
                                  const Icon(Icons.local_dining, size: 16),
                                  Text(
                                    '${meal.protein}g',
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  const SizedBox(width: 4),
                                  const Icon(Icons.grain, size: 16),
                                  Text(
                                    '${meal.carbs}g',
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  const SizedBox(width: 4),
                                  const Icon(Icons.local_pizza, size: 16),
                                  Text(
                                    '${meal.fat}g',
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      // obsługa naciśnięcia przycisku opcji
                                    },
                                    icon: const Icon(Icons.settings),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              )
          ],
        ),
      ),
    );
  }
}

class Meal {
  const Meal({
    required this.name,
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.fat,
  });
  final String name;
  final int calories;
  final int protein;
  final int carbs;
  final int fat;
}
