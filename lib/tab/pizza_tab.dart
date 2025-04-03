import 'package:flutter/material.dart';
import 'package:paginatopicos/utils/pizza_tile.dart';


  class PizzaTab extends StatelessWidget {
    // List of donuts
    final List donutsOnSale = [
      // [ donutFlavor, donutPrice, donutColor, imageName ]
      ["Ice Cream", "36", Colors.blue, "lib/images/icecream_donut.png"],
      ["Strawberry", "45", Colors.red, "lib/images/strawberry_donut.png"],
      ["Grape Ape", "84", Colors.purple, "lib/images/grape_donut.png"],
      ["Choco", "95", Colors.brown, "lib/images/chocolate_donut.png"]
    ];

    PizzaTab({super.key});

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Expanded( 
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                   childAspectRatio: 0.8,),
                  itemCount: donutsOnSale.length, 
                  itemBuilder: (context, index) {
                    return PizzaTile(
                      donutFlavor: donutsOnSale[index][0],
                      donutPrice: donutsOnSale[index][1],
                      donutColor: donutsOnSale[index][2],
                      imageName: donutsOnSale[index][3],
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
