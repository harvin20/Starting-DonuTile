import 'package:flutter/material.dart';

class PancakeTile extends StatelessWidget {
  final String pancakeFlavor;
  final String pancakePrice;
  final dynamic pancakeColor;
  final String imageName;
  final VoidCallback onTap;
  
  final double borderRadius = 24;
  
  const PancakeTile({
    super.key,
    required this.pancakeFlavor,
    required this.pancakePrice,
    this.pancakeColor,
    required this.imageName,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: pancakeColor[50],
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
                    color: pancakeColor[100],
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
                  child: Text(
                    '\$$pancakePrice',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: pancakeColor[800],
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
              pancakeFlavor,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const Text(
              'Pancakes',
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
                  Icon(Icons.favorite, color: Colors.orange[400]),
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