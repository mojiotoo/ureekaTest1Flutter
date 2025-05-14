//ordering a matcha

class Matcha {
  String? _cafe;
  String? _flavour;
  int? _price;

  Matcha(this._cafe, this._flavour, this._price);

  String? getCafe() {
    return _cafe;
  }

  void setCafe(String newCafe) {
    _cafe = newCafe;
  }

  String? getFlavour() {
    return _flavour;
  }

  void setFlavour(String newFlavour) {
    _flavour = newFlavour;
  }

  int? getPrice() {
    return _price;
  }

  void setPrice(int newPrice) {
    _price = newPrice;
  }

  void review() {
    print(
      "The Matcha from $_cafe has a $_flavour flavour for the price of $_price.",
    );
  }
}

// for abstract, polymorphism, and inheritance OOP
abstract class matchaDrink {
  double getPrice(); //abstract method
}

class withToppings extends matchaDrink {
  //ini pake inheritance dengan extend
  double basePrice;

  withToppings(this.basePrice);

  @override
  double getPrice() {
    return basePrice + 7500;
  }
}

class withoutToppings extends matchaDrink {
  //ini pake inheritance dengan extend
  double basePrice;

  withoutToppings(this.basePrice);

  @override
  double getPrice() {
    return basePrice;
  }
}
