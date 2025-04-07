import 'package:flutter/material.dart';
import 'package:paginatopicos/utils/pizza_tile.dart';

 class BurguerTab extends StatelessWidget {
     // List of donuts
     final List burguersOnSale = [
       // [ donutFlavor, donutPrice, donutColor, imageName ]
     ["pizza peperoni", "36", Colors.blue, "lib/images/pizza/pepperoni_pizza.png"],
      ["pizza margarita", "45", Colors.red, "lib/images/pizza/margherita_pizza.png"],
      ["boneless pizza", "84", Colors.purple, "lib/images/pizza/boneless_pizza.png"],
      ["pizza hawaina", "95", Colors.brown, "lib/images/pizza/hawaiian_pizza.png"]
    ];
 
     BurguerTab({super.key});
 
     @override
     Widget build(BuildContext context) {
       return Scaffold(
         appBar: AppBar(title: Text('pizza')),
         body: Padding(
           padding: const EdgeInsets.all(12),
           child: Column(
             children: [
               Expanded( 
                 child: GridView.builder(
                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                    childAspectRatio: 0.8,),
                   itemCount: burguersOnSale.length, 
                   itemBuilder: (context, index) {
                     return PizzaTile(
                       donutFlavor: burguersOnSale[index][0],
                       donutPrice: burguersOnSale[index][1],
                       donutColor: burguersOnSale[index][2],
                       imageName: burguersOnSale[index][3],
                     );
                   },
                 ),
               ),
             ],
           ),
         ),
       );
     }}