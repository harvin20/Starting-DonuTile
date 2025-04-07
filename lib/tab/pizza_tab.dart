import 'package:flutter/material.dart';
import 'package:paginatopicos/utils/pizza_tile.dart';


  class PizzaTab extends StatelessWidget {
    // List of donuts
    final List pizzasOnSale = [
      // [ donutFlavor, donutPrice, donutColor, imageName ]
      ["clasic burguer", "36", Colors.blue, "lib/images/burger/burger1.png"],
      ["burguer combo", "45", Colors.red, "lib/images/burger/burger2.png"],
      ["double meat", "84", Colors.purple, "lib/images/burger/burger3.png"],
      ["burguer hawaina", "95", Colors.brown, "lib/images/burger/burger4.png"]
    ];

    PizzaTab({super.key});

    @override
    Widget build(BuildContext context) {
      return Scaffold(
         appBar: AppBar(title: Text('burguers')),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Expanded( 
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                   childAspectRatio: 0.8,),
                  itemCount: pizzasOnSale.length, 
                  itemBuilder: (context, index) {
                    return PizzaTile(
                      donutFlavor: pizzasOnSale[index][0],
                      donutPrice: pizzasOnSale[index][1],
                      donutColor: pizzasOnSale[index][2],
                      imageName: pizzasOnSale[index][3],
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
