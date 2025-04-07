import 'package:appdona/utils/donut_tile.dart';
import 'package:flutter/material.dart';

class DonutTab extends StatelessWidget {
  final Function(double, String) onAddToCart;
  
  final List donutsOnSale = [
    ["Ice Cream", "36", Colors.blue, "lib/images/donuts/icecream_donut.png"],
    ["Strawberry", "45", Colors.red, "lib/images/donuts/strawberry_donut.png"],
    ["Grape Ape", "84", Colors.purple, "lib/images/donuts/grape_donut.png"],
    ["Chocolate", "95", Colors.brown, "lib/images/donuts/chocolate_donut.png"],
  ];

  DonutTab({super.key, required this.onAddToCart});

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
        return DonutTile(
          donutFlavor: donutsOnSale[index][0],
          donutPrice: donutsOnSale[index][1],
          donutColor: donutsOnSale[index][2],
          imageName: donutsOnSale[index][3],
          onTap: () => onAddToCart(
            double.parse(donutsOnSale[index][1]),
            donutsOnSale[index][0]
          ),
        );
      },
      itemCount: donutsOnSale.length,
    );
  }
}