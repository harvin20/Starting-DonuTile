import 'package:appdona/utils/pizza_tile.dart';
import 'package:flutter/material.dart';

class PizzaTab extends StatelessWidget {
  final Function(double, String) onAddToCart;
  
  final List pizzasOnSale = [
    ["Pepperoni", "100", Colors.red, "lib/images/pizza/pepperoni_pizza.png"],
    ["Margariña", "175", Colors.orange, "lib/images/pizza/margherita_pizza.png"],
    ["pizza Boneless", "120", Colors.brown, "lib/images/pizza/boneless_pizza.png"],
    ["pizza Vegana", "90", Colors.green, "lib/images/pizza/veggie_pizza.png"],
  ];

  PizzaTab({super.key, required this.onAddToCart});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1/1.5,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12
      ),
      itemBuilder: (context, index) {
        return PizzaTile(
          pizzaFlavor: pizzasOnSale[index][0],
          pizzaPrice: pizzasOnSale[index][1],
          pizzaColor: pizzasOnSale[index][2],
          imageName: pizzasOnSale[index][3],
          onTap: () => onAddToCart(
            double.parse(pizzasOnSale[index][1]),
            pizzasOnSale[index][0]
          ),
        );
      },
      itemCount: pizzasOnSale.length,
    );
  }
}