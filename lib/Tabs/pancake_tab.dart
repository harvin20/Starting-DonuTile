
import 'package:appdona/utils/pancake_tile.dart';
import 'package:flutter/material.dart';

class PancakeTab extends StatelessWidget {
  final Function(double, String) onAddToCart;
  
  final List pancakesOnSale = [
    ["bluemorning", "30", Colors.blue, "lib/images/pancakes/pancakes1.png"],
    ["pancakes con fresas", "35", Colors.red, "lib/images/pancakes/pancakes2.png"],
    ["more moras", "40", Colors.brown, "lib/images/pancakes/pancakes3.png"],
    ["con chocolate", "45", Colors.yellow, "lib/images/pancakes/pancakes4.png"],
  ];

  PancakeTab({super.key, required this.onAddToCart});

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
        return PancakeTile(
          pancakeFlavor: pancakesOnSale[index][0],
          pancakePrice: pancakesOnSale[index][1],
          pancakeColor: pancakesOnSale[index][2],
          imageName: pancakesOnSale[index][3],
          onTap: () => onAddToCart(
            double.parse(pancakesOnSale[index][1]),
            pancakesOnSale[index][0]
          ),
        );
      },
      itemCount: pancakesOnSale.length,
    );
  }
}