import 'pizza.dart';

class CartItem {
  final Pizza pizza;
  int quantity;

  CartItem({required this.pizza, this.quantity = 1});
}

class Cart {
  static final List<CartItem> _items = [];

  static void addItem(Pizza pizza) {
    for (var item in _items) {
      if (item.pizza.name == pizza.name) {
        item.quantity++;
        return;
      }
    }
    _items.add(CartItem(pizza: pizza));
  }

  static void removeItem(Pizza pizza) {
    _items.removeWhere((item) => item.pizza.name == pizza.name);
  }

  static void updateQuantity(Pizza pizza, int quantity) {
    for (var item in _items) {
      if (item.pizza.name == pizza.name) {
        item.quantity = quantity;
        return;
      }
    }
  }

  static List<CartItem> getItems() {
    return _items;
  }
}
