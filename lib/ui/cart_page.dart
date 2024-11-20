import 'package:flutter/material.dart';
import '../../models/cart.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cartItems = Cart.getItems();
    final totalPrice = cartItems.fold(0.0, (sum, item) => sum + item.pizza.price * item.quantity);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Panier'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(cartItems[index].pizza.name),
                  subtitle: Text('${cartItems[index].pizza.price.toStringAsFixed(2)} € x ${cartItems[index].quantity}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          setState(() {
                            if (cartItems[index].quantity > 1) {
                              cartItems[index].quantity--;
                            } else {
                              Cart.removeItem(cartItems[index].pizza);
                            }
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            cartItems[index].quantity++;
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            Cart.removeItem(cartItems[index].pizza);
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('${cartItems[index].pizza.name} supprimé du panier'),
                              duration: Duration(seconds: 1),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Total: ${totalPrice.toStringAsFixed(2)} €',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
