import 'matcha.dart';

void main() {
  // 1. Encapsulation
  Matcha one = Matcha("a", "b", 100);

  print("Inputting Data: ");
  one.setCafe("ujiMatcha");
  print(one.getCafe());
  one.setFlavour("umami");
  print(one.getFlavour());
  one.setPrice(180000);
  print(one.getPrice());

  print("\nReview: ");
  one.review();

  // 2. Abstraction
  matchaDrink matchaLatte = withToppings(50000);
  print("\nTotal price with toppings: ${matchaLatte.getPrice()}");

  // 3. Inheritance => pake extend di matcha.dart

  // 4. Polymorphism
  List<matchaDrink> drinks = [withToppings(50000), withoutToppings(50000)];
  for (var drink in drinks) {
    print("total price of the drink: ${drink.getPrice()}");
  }
}
