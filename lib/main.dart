
import 'package:flutter/material.dart';
import 'models/menu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pizzeria',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Notre pizzéria'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  MyHomePage({required this.title});

  // Liste des menus (ici, des exemples en "dur")
  final List<Menu> menuItems = [
    Menu(name: 'Pizza Barbecue', price: 8.99, imagePath: 'assets/images/pizza/pizza-bbq.jpg'),
    Menu(name: 'Pizza Frankfurt', price: 10.99, imagePath: 'assets/images/pizza/pizza-frankfurt.png'),
    Menu(name: 'Boisson', price: 2.50, imagePath: 'assets/images/menus/boisson.png'),
    Menu(name: 'Opera', price: 5.50, imagePath: 'assets/images/menus/dessert.png'),
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
          return buildRow(menuItems[index]);
        },
      ),
    );
  }

  // Méthode pour construire chaque élément du menu
  Widget buildRow(Menu menuItem) {
    return Container(
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Container(
              width: 100,
              height: 100,
              child: Image.asset(menuItem.imagePath, fit: BoxFit.cover),
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    menuItem.name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${menuItem.price.toStringAsFixed(2)} €',
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
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
