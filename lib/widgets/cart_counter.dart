import 'package:flutter/material.dart';
import 'package:paginatopicos/utils/cart.dart';
import 'package:provider/provider.dart';


class CartCounter extends StatelessWidget {
  const CartCounter({super.key});

  @override
  Widget build(BuildContext context) {
    final cartManager = Provider.of<CartManager>(context, listen: true);

    return GestureDetector(
      onTap: () {
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                const Icon(Icons.shopping_cart, size: 24),
                if (cartManager.itemCount > 0)
                  Positioned(
                    right: -8,
                    top: -8,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 16,
                        minHeight: 16,
                      ),
                      child: Text(
                        cartManager.itemCount.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 8),
            Text(
              '\$${cartManager.totalPrice.toStringAsFixed(2)}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}