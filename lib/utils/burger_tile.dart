import 'package:flutter/material.dart';

class BurgerTile extends StatelessWidget {
  final String burgerName;
  final String burgerPrice;
  final dynamic burgerColor;
  final String imageName;
  final VoidCallback onTap;
  
  final double borderRadius = 24;
  
  const BurgerTile({
    super.key,
    required this.burgerName,
    required this.burgerPrice,
    this.burgerColor,
    required this.imageName,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: burgerColor[50],
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(borderRadius),
            topRight: Radius.circular(borderRadius),
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: burgerColor[100],
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
                  child: Text(
                    '\$$burgerPrice',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: burgerColor[800],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
              child: Image.asset(imageName),
            ),
            Text(
              burgerName,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const Text(
              'burguer',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.favorite, color: Colors.red[400]),
                  GestureDetector(
                    onTap: onTap,
                    child: Text(
                      "Add", 
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}