import 'package:flutter/material.dart';
import 'package:paginatopicos/utils/smoothie_tile.dart';

class SmoothieTab extends StatelessWidget {
    // List of donuts
    final List smoothiesOnSale = [
      // [ donutFlavor, donutPrice, donutColor, imageName ]
      ["arandanos", "36", Colors.blue, "lib/images/smoothie/smoothie_arandanos.png"],
      ["frambuesa", "45", Colors.red, "lib/images/smoothie/smoothie_arandanosframbuesa.png"],
      ["naranja", "84", Colors.purple,"lib/images/smoothie/smoothie_naranja.png"],
      ["pera", "95", Colors.brown, "lib/images/smoothie/smoothie_pera.png"]
    ];

    SmoothieTab({super.key});

    @override
    Widget build(BuildContext context) {
      return Scaffold(
         appBar: AppBar(title: Text('smoothies')),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Expanded( 
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                   childAspectRatio: 0.8,),
                  itemCount: smoothiesOnSale.length, 
                  itemBuilder: (context, index) {
                    return SmoothieTile(
                      donutFlavor: smoothiesOnSale[index][0],
                      donutPrice: smoothiesOnSale[index][1],
                      donutColor: smoothiesOnSale[index][2],
                      imageName: smoothiesOnSale[index][3],
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