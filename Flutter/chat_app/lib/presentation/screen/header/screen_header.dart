import 'package:flutter/material.dart';

class AppBarHeader extends StatelessWidget implements PreferredSizeWidget {
  const AppBarHeader({super.key});

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      leadingWidth: 70,
      leading:const Padding(
        padding: EdgeInsets.all(5),
        child: CircleAvatar(
          backgroundImage: NetworkImage('https://www.altonivel.com.mx/wp-content/uploads/2024/03/akira-toriyama-creador-de-dragon-ball.jpg'),
          ),
      ),
      title: const Text('Akira Toriyama'),
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
