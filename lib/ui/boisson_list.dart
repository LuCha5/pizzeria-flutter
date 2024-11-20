// lib/ui/boisson_list.dart

import 'package:flutter/material.dart';
import 'cart_page.dart'; // Ajoutez cette ligne
import '../../models/cart.dart'; // Ajoutez cette ligne
import '../../models/pizza.dart'; // Ajoutez cette ligne

class Boisson {
  final String name;
  final double price;
  final String imagePath;

  Boisson({
    required this.name,
    required this.price,
    required this.imagePath,
  });
}

class BoissonData {
  static List<Boisson> getBoissons() {
    return [
      Boisson(
        name: 'Coca',
        price: 1.99,
        imagePath: 'assets/images/boissons/coca.png',
      ),
      Boisson(
        name: 'Fanta',
        price: 1.99,
        imagePath: 'assets/images/boissons/fanta.png',
      ),
    ];
  }
}

class BoissonList extends StatefulWidget {
  const BoissonList({super.key});

  @override
  _BoissonListState createState() => _BoissonListState();
}

class _BoissonListState extends State<BoissonList> {
  @override
  Widget build(BuildContext context) {
    final boissons = BoissonData.getBoissons(); // Liste des boissons

    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste des Boissons'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: boissons.length,
        itemBuilder: (context, index) {
          return _buildRow(boissons[index]);
        },
      ),
    );
  }

  Widget _buildRow(Boisson boisson) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              title: Text(boisson.name),
              subtitle: Text('${boisson.price.toStringAsFixed(2)} €'),
            ),
            SizedBox(
              width: double.infinity,
              height: 200, // Définir une hauteur fixe pour les images
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  boisson.imagePath,
                  fit: BoxFit.contain, // Affiche l'image en entier sans zoom
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  Cart.addItem(Pizza(
                    name: boisson.name,
                    price: boisson.price,
                    imagePath: boisson.imagePath,
                    description: '',
                  ));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${boisson.name} ajouté au panier'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.shopping_cart),
                    SizedBox(width: 8),
                    Text('Commander'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}