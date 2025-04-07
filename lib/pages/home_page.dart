
import 'package:appdona/Tabs/burger_tab.dart';
import 'package:appdona/Tabs/donut_tab.dart';
import 'package:appdona/Tabs/pancake_tab.dart';
import 'package:appdona/Tabs/pizza_tab.dart';
import 'package:appdona/Tabs/smoothie_tab.dart';
import 'package:flutter/material.dart';
import '../utils/cart_manager.dart';
import '../utils/my_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CartManager _cartManager = CartManager();

  List<Widget> myTabs = [
    const MyTab(iconPath: 'lib/icons/donut.png', tabName: 'Donuts'),
    const MyTab(iconPath: 'lib/icons/burger.png', tabName: 'Burger'),
    const MyTab(iconPath: 'lib/icons/smoothie.png', tabName: 'Smoothie'),
    const MyTab(iconPath: 'lib/icons/pancakes.png', tabName: 'Pancakes'),
    const MyTab(iconPath: 'lib/icons/pizza.png', tabName: 'Pizza'),
  ];

  void _addToCart(double price, String name) {
    setState(() {
      _cartManager.addItem(name, price);
    });
  }

  void _showCartModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => Container(
        padding: const EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height * 0.8,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
        ),
        ),
        child: Column(
          children: [
            Container(
              height: 5,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              'Your Cart',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: _cartManager.items.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.shopping_cart_outlined,
                            size: 50,
                            color: Colors.grey[400],
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Your cart is empty',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: _cartManager.items.length,
                      itemBuilder: (ctx, index) {
                        final item = _cartManager.items[index];
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.grey[50],
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 3,
                                offset: const Offset(0, 1),
                              ),
                            ],
                          ),
                          child: ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 5,
                            ),
                            title: Text(
                              item.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              'Quantity: ${item.quantity}',
                              style: TextStyle(
                                color: Colors.grey[600],
                              ),
                            ),
                            trailing: Text(
                              '\$${(item.price * item.quantity).toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            leading: IconButton(
                              icon: Icon(
                                Icons.remove_circle_outline,
                                color: Colors.red[400],
                              ),
                              onPressed: () {
                                setState(() {
                                  _cartManager.removeItem(item.name);
                                });
                              },
                            ),
                          ),
                        );
                      },
                    ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total: \$${_cartManager.totalPrice.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          _cartManager.clearCart();
                          Navigator.pop(context);
                          setState(() {});
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red[400],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 10,
                          ),
                        ),
                        child: const Text(
                          'Clear Cart',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                        ),
                        child: const Text(
                          'Checkout',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.grey[800],
              ),
              onPressed: () {},
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: IconButton(
                icon: Icon(
                  Icons.person,
                  color: Colors.grey[800],
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            //Texto "I want to Eat"
            Padding(
              padding: const EdgeInsets.only(left: 32.0),
              child: Row(
                children: [
                  Text("I want to ", style: TextStyle(fontSize: 32)),
                  Text("Eat", style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline
                  ))
                ],
              ),
            ),
            //Tab bar
            TabBar(
              tabs: myTabs,
              labelColor: Colors.pink,
              unselectedLabelColor: Colors.grey,
            ),
            //Tab bar view
            Expanded(
              child: TabBarView(
                children: [
                  DonutTab(onAddToCart: (price, name) => _addToCart(price, name)),
                  BurgerTab(onAddToCart: (price, name) => _addToCart(price, name)),
                  SmoothieTab(onAddToCart: (price, name) => _addToCart(price, name)),
                  PancakeTab(onAddToCart: (price, name) => _addToCart(price, name)),
                  PizzaTab(onAddToCart: (price, name) => _addToCart(price, name)),
                ],
              ),
            ),
            //Carrito
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 28),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${_cartManager.itemCount} Items | \$${_cartManager.totalPrice.toStringAsFixed(2)}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Delivery Charges Included',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => _showCartModal(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
                    ),
                    child: const Text(
                      "View Cart",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}