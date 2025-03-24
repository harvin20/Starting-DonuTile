import 'package:flutter/material.dart';
import 'package:paginatopicos/tab/burger_tab.dart';
import 'package:paginatopicos/tab/donut_tab.dart';
import 'package:paginatopicos/tab/pancakes_tab.dart';
import 'package:paginatopicos/tab/pizza_tab.dart';
import 'package:paginatopicos/tab/smoothie_tab.dart';
import 'package:paginatopicos/utils/mytab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> myTabs = [
    const Mytab(iconPath: "lib/icons/donut.png"),
    Mytab(iconPath: "lib/icons/pizza.png"),
    Mytab(iconPath: "lib/icons/smoothie.png"),
    Mytab(iconPath: "lib/icons/burger.png"),
    Mytab(iconPath: "lib/icons/pancakes.png"),
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
                    " eat",
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
              // <-- Agregamos Expanded para que TabBarView use el espacio restante
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
          ],
        ),
      ),
    );
  }
}
