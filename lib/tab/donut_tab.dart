import 'package:flutter/material.dart';
import 'package:paginatopicos/utils/cart.dart';
import 'package:paginatopicos/utils/donut_tile.dart';
import 'package:provider/provider.dart';

class DonutTab extends StatelessWidget {
  // List of donuts
  final List donutsOnSale = [
    // [ donutFlavor, donutPrice, donutColor, imageName ]
    ["Ice Cream", 36, Colors.blue, "lib/images/donut/icecream_donut.png"],
    ["Strawberry", 45, Colors.red, "lib/images/donut/strawberry_donut.png"],
    ["Grape Ape", 84, Colors.purple, "lib/images/donut/grape_donut.png"],
    ["Choco", 95, Colors.brown, "lib/images/donut/chocolate_donut.png"]
  ];

  DonutTab({super.key});

  @override
  Widget build(BuildContext context) {
    final cartManager = Provider.of<CartManager>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Donuts')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                ),
                itemCount: donutsOnSale.length,
                itemBuilder: (context, index) {
                  return DonutTile(
                    donutFlavor: donutsOnSale[index][0],
                    donutPrice: donutsOnSale[index][1],
                    donutColor: donutsOnSale[index][2],
                    imageName: donutsOnSale[index][3],
                     onAddToCart: () => cartManager.addItem(
                      donutsOnSale[index][0],
                      donutsOnSale[index][1].toDouble(),
                    ), onTap: () { print('dona seleccionada'); },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}