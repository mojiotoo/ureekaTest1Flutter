import '../models/cart.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/cart_item.dart';
import 'dart:convert';

class CartProvider with ChangeNotifier {
  Map<String, CartItem> _items = {};
  Map<String, CartItem> get items => _items;

  CartProvider() {
    loadCart();
  }

  Future<void> loadCart() async {
    final prefs = await SharedPreferences.getInstance();
    final savedCart = prefs.getString('cart_items');
    if (savedCart != null) {
      final decoded = json.decode(savedCart) as Map<String, dynamic>;
      _items = decoded.map(
        (key, value) => MapEntry(
          key,
          CartItem(
            id: value['id'],
            title: value['title'],
            price: value['price'],
            quantity: value['quantity'],
          ),
        ),
      );
      notifyListeners();
    }
  }

  Future<void> saveCart() async {
    final prefs = await SharedPreferences.getInstance();
    final data = _items.map(
      (key, item) => MapEntry(key, {
        'id': item.id,
        'title': item.title,
        'price': item.price,
        'quantity': item.quantity,
      }),
    );
    await prefs.setString('cart_items', json.encode(data));
  }

  void addItem(String productId, String title, double price) {
    if (_items.containsKey(productId)) {
      _items[productId]!.quantity += 1;
    } else {
      _items[productId] = CartItem(
        id: productId,
        title: title,
        price: price,
        quantity: 1,
      );
    }
    notifyListeners();
  }

  double get totalPrice =>
      _items.values.fold(0, (sum, item) => sum + (item.price * item.quantity));
}
