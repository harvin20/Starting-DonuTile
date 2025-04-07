
import 'package:appdona/utils/burger_tile.dart';
import 'package:flutter/material.dart';

class BurgerTab extends StatelessWidget {
  final Function(double, String) onAddToCart;
  
  final List burgersOnSale = [
    ["single Burger", "80", Colors.amber, "lib/images/burger/burger1.png"],
    ["combo Burger", "125", Colors.brown, "lib/images/burger/burger2.png"],
    ["double Burger", "100", Colors.red, "lib/images/burger/burger3.png"],
    ["onlyBurger", "50", Colors.green, "lib/images/burger/burger5.png"],
  ];
  
  BurgerTab({super.key, required this.onAddToCart});

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
        return BurgerTile(
          burgerName: burgersOnSale[index][0],
          burgerPrice: burgersOnSale[index][1],
          burgerColor: burgersOnSale[index][2],
          imageName: burgersOnSale[index][3],
          onTap: () => onAddToCart(
            double.parse(burgersOnSale[index][1]),
            burgersOnSale[index][0]
          ),
        );
      },
      itemCount: burgersOnSale.length,
    );
  }
}