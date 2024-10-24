// lib/ui/pizza_list.dart

import 'package:flutter/material.dart';
import '../../models/pizza.dart';
import '../../models/pizza_data.dart';
import 'pizza_detail.dart'; // Ajoutez cette ligne

class PizzaList extends StatefulWidget {
  const PizzaList({super.key});

  @override
  _PizzaListState createState() => _PizzaListState();
}

class _PizzaListState extends State<PizzaList> {
  @override
  Widget build(BuildContext context) {
    final pizzas = PizzaData.getPizzas(); // Liste des pizzas

    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste des Pizzas'),
      ),
      body: ListView.builder(
        itemCount: pizzas.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PizzaDetail(pizza: pizzas[index]),
                ),
              );
            },
            child: _buildRow(pizzas[index]),
          );
        },
      ),
    );
  }

  Widget _buildRow(Pizza pizza) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              title: Text(pizza.name),
              subtitle: Text('${pizza.price.toStringAsFixed(2)} €'),
            ),
            SizedBox(
              width: double.infinity,
              height: 200, // Définir une hauteur fixe pour les images
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  pizza.imagePath,
                  fit: BoxFit.contain, // Affiche l'image en entier sans zoom
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}