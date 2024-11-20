import 'pizza.dart';

class Cart {
  static final List<Pizza> _items = [];

  static void addItem(Pizza pizza) {
    _items.add(pizza);
  }

  static void removeItem(Pizza pizza) {
    _items.remove(pizza);
  }

  static List<Pizza> getItems() {
    return _items;
  }
}
