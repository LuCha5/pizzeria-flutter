// lib/main.dart

import 'package:flutter/material.dart';
import 'models/menu.dart';
import 'ui/pizza_list.dart';
import 'ui/boisson_list.dart'; // Ajoutez cette ligne

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pizzeria',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Notre pizzeria'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  MyHomePage({super.key, required this.title});

  // Liste des menus
  final List<Menu> menuItems = [
    Menu(name: 'Pizza', price: 0.0, imagePath: 'assets/images/menus/pizza.png'),
    Menu(name: 'Boissons', price: 0.0, imagePath: 'assets/images/menus/boisson.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              if (menuItems[index].name == 'Pizza') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PizzaList()),
                );
              } else if (menuItems[index].name == 'Boissons') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BoissonList()),
                );
              }
            },
            child: buildRow(menuItems[index]),
          );
        },
      ),
    );
  }

  Widget buildRow(Menu menuItem) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 100,
              height: 100,
              child: Image.asset(menuItem.imagePath, fit: BoxFit.cover),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    menuItem.name,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}