import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home_max_outlined,
            ),
            label: 'Inicio'),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.label_outlined,
          ),
          label: 'Categorías',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.favorite_border_outlined,
          ),
          label: 'Favoritos',
        ),
      ],
    );
  }
}