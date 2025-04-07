import 'package:flutter/material.dart';

class BurguerTile extends StatelessWidget {
  final String burguerFlavor;
  final String burguerPrice;
  final dynamic burguerColor;
  final String imageName;

  const BurguerTile({
    super.key,
    required this.burguerFlavor,
    required this.burguerPrice,
    required this.burguerColor,
    required this.imageName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: burguerColor[50],
          borderRadius: BorderRadius.circular(24),
        ),
        child: SingleChildScrollView(  // Permite scroll si el contenido es grande
          child: Column(
            mainAxisSize: MainAxisSize.min,  // Evita expansión innecesaria
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: burguerColor[100],
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
                    child: Text(
                      "\$$burguerPrice",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: burguerColor[900],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),  // Padding reducido
                child: Image.asset(
                  imageName,
                  height: 70,  // Altura controlada
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: [
                    Text(
                      burguerFlavor,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "burguer's",
                      style: TextStyle(color: Colors.grey[600], fontSize: 14),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.favorite_border),
                      color: Colors.grey,
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.add),
                      color: burguerColor[100],
                      iconSize: 28,
                      onPressed: () {},
                      style: IconButton.styleFrom(
                        backgroundColor: burguerColor[000],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}