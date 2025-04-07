import 'package:flutter/material.dart';
import 'package:paginatopicos/utils/pancakes_tile.dart';

  class  PancakesTab extends StatelessWidget {
    // List of donuts
    final List pancakesOnSale = [
      // [ donutFlavor, donutPrice, donutColor, imageName ]
      ["single", "36", Colors.blue, "lib/images/pancakes/pancakes1.png"],
      ["more love", "45", Colors.red, "lib/images/pancakes/pancakes2.png"],
      ["more blue", "84", Colors.purple, "lib/images/pancakes/pancakes3.png"],
      ["more Choco", "95", Colors.brown, "lib/images/pancakes/pancakes4.png"]
    ];

      PancakesTab({super.key});

    @override
    Widget build(BuildContext context) {
      return Scaffold(
         appBar: AppBar(title: Text('pancakes')),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Expanded( 
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                   childAspectRatio: 0.8,),
                  itemCount: pancakesOnSale.length, 
                  itemBuilder: (context, index) {
                    return PancakesTile(
                      pancakesFlavor: pancakesOnSale[index][0],
                      donutPrice: pancakesOnSale[index][1], 
                      donutColor: pancakesOnSale[index][2],
                      imageName: pancakesOnSale[index][3],
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
