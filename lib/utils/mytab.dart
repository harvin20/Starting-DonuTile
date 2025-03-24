import 'package:flutter/material.dart';

class Mytab extends StatelessWidget {
  //ruta del archivo
  final String iconPath;  
  
  const Mytab({super.key, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return Tab(
      height: 50,
      child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.grey, borderRadius: BorderRadius.circular(16)
              //Borde redondeado
              ),
          //ruta del archivo
          child: Image.asset(
            iconPath,
            color: Colors.grey[600],
          )),
    );
  }
}
