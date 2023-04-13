import 'package:flutter/material.dart';

void main() => runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Fridger';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Fridge',
      style: optionStyle,
    ),
    Text(
      'Index 2: Recipes',
      style: optionStyle,
    ),
     Text(
      'Index 3: Shoop list',
      style: optionStyle,
    ),
     Text(
      'Index 4: Settings',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
      appBar: AppBar(
        title: const Text('Fridger Alpha 0.0'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
      
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank),
            label: 'Fridge',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Recipes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_outlined),
            label: 'Shoop list',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          )
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Color.fromARGB(255, 104, 197, 87),        
        selectedItemColor: Color.fromARGB(255, 255, 194, 115),
        onTap: _onItemTapped,
      ),
    );
  }
}