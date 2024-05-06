import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yobo_app/presentation/screen/home/home_screen.dart';
import 'package:yobo_app/presentation/screen/security/security_screen.dart';

class ButtonNavigationBar extends StatelessWidget {
  const ButtonNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
      color: colors.primary.withBlue(150).withOpacity(0.9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconBar(
            icon: Icons.home,
            label: 'Home',
            onTap: () {
              context.pushNamed(HomeScreen.name);
            },
          ),
          const IconBar(icon: Icons.search_outlined, label: 'Comprar'),
          Image.network(
            'https://cdn.pixabay.com/animation/2023/03/22/04/48/04-48-41-618_512.gif',
            width: 40,
          ),
          const IconBar(icon: Icons.shopping_cart, label: 'Carrito'),
          IconBar(
            icon: Icons.person,
            label: 'Mi cuenta',
            onTap: () {
              context.pushNamed(SecurityScreen.name);
            },
          ),
        ],
      ),
    );
  }
}

class IconBar extends StatelessWidget {
  final IconData icon;
  final String label;
  final double horizontal;
  final double vertical;
  final Color colorIcon;
  final Color colorText;
  final double sizeIcon;
  final double paddingIcon;
  final VoidCallback? onTap;
  const IconBar({
    super.key,
    required this.icon,
    this.label = '',
    this.horizontal = 0,
    this.vertical = 0,
    this.colorIcon = Colors.transparent,
    this.colorText = Colors.white,
    this.sizeIcon = 24,
    this.paddingIcon = 40,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (onTap == null) ? () {} : onTap,
        child: Padding(
          padding:
              EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                    width: paddingIcon + sizeIcon * 0.1,
                    height: paddingIcon + sizeIcon * 0.1,
                    decoration:
                        BoxDecoration(shape: BoxShape.circle, color: colorIcon),
                    child: Icon(
                      icon,
                      size: sizeIcon,
                    )),
                const SizedBox(
                  height: 3,
                ),
                if (label.isNotEmpty)
                  Text(
                    (label.length < 18)
                        ? label
                        : '${label.substring(0, 16)}...',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: colorText),
                  )
              ]),
        ));
  }
}
