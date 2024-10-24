// lib/models/pizza_data.dart

import 'pizza.dart';

class PizzaData {
  static List<Pizza> getPizzas() {
    return [
      Pizza(
        name: 'Barbecue',
        price: 8.99,
        imagePath: 'assets/images/pizza/pizza-bbq.jpg',
        description: 'Sauce tomate, mozzarella, basilic frais',
      ),
      Pizza(
        name: 'Capers',
        price: 10.99,
        imagePath: 'assets/images/pizza/pizza-capers.png',
        description: 'Sauce tomate, mozzarella, pepperoni',
      ),
      Pizza(
        name: 'Frankfurt',
        price: 12.99,
        imagePath: 'assets/images/pizza/pizza-frankfurt.png',
        description: 'Mozzarella, gorgonzola, parmesan, chèvre',
      ),
      Pizza(
        name: 'Merguez',
        price: 10.99,
        imagePath: 'assets/images/pizza/pizza-merguez.png',
        description: 'Sauce tomate, mozzarella, merguez, oignons',
      ),
      Pizza(
        name: 'Hawai',
        price: 11.99,
        imagePath: 'assets/images/pizza/pizza-hawai.jpg',
        description: 'Sauce tomate, mozzarella, jambon, ananas',
      ),
      Pizza(
        name: 'Salami',
        price: 9.99,
        imagePath: 'assets/images/pizza/pizza-salami.png',
        description: 'Sauce tomate, mozzarella, salami',
      ),
      Pizza(
        name: 'Sausage',
        price: 12.49,
        imagePath: 'assets/images/pizza/pizza-sausage.png',
        description: 'Sauce tomate, mozzarella, saucisse, poivrons',
      ),
      Pizza(
        name: 'Spinach',
        price: 10.49,
        imagePath: 'assets/images/pizza/pizza-spinach.jpg',
        description: 'Sauce tomate, mozzarella, épinards, ail',
      ),
      Pizza(
        name: 'Vegetable',
        price: 9.49,
        imagePath: 'assets/images/pizza/pizza-vegetable.jpg',
        description: 'Sauce tomate, mozzarella, légumes variés',
      ),
    ];
  }
}

