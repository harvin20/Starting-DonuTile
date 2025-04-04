import 'package:flutter/material.dart';
import 'package:paginatopicos/tab/burger_tab.dart';
import 'package:paginatopicos/tab/donut_tab.dart';
import 'package:paginatopicos/tab/pancakes_tab.dart';
import 'package:paginatopicos/tab/pizza_tab.dart';
import 'package:paginatopicos/tab/smoothie_tab.dart';
import 'package:paginatopicos/utils/mytab.dart';
import 'package:paginatopicos/utils/shopping_cart.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> myTabs = [
    const Mytab(iconPath: "lib/icons/donut.png"),
    const Mytab(iconPath: "lib/icons/pizza.png"),
    const Mytab(iconPath: "lib/icons/smoothie.png"),
    const Mytab(iconPath: "lib/icons/burger.png"),
    const Mytab(iconPath: "lib/icons/pancakes.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: Icon(Icons.menu, color: Colors.grey[800]),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 24.0),
              child: Icon(Icons.person),
            ),
          ],
        ),
        body: Column(
          children: <Widget>[
            // 1. Texto principal
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                children: [
                  Text(
                    "I want to",
                    style: TextStyle(fontSize: 32),
                  ),
                  Text(
                    " Eat",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),

            // 2. Pestañas (TabBar)
            TabBar(tabs: myTabs),

            // 3. Contenido de pestañas (TabBarView)
            Expanded(
              child: TabBarView(
                children: [
                  DonutTab(),
                  BurgerTab(),
                  SmoothieTab(),
                  PizzaTab(),
                  PancakesTab(),
                ],
              ),
            ),
            
            //carrito
            ShoppingCart(),
          ],
        ),
      ),
    );
  }
}
