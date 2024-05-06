import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yobo_app/domain/entities/products_post.dart';
import 'package:yobo_app/presentation/screen/products/products_screen.dart';

class ContentHome extends StatelessWidget {
  final ProductsPost product;
  const ContentHome({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //       Navigator.of(context).push( //avanzar hacia otra pantalla
        //       //replace ayuda a eliminar la ruta anterior
        //       MaterialPageRoute(
        //         builder: (context) => const ProductsScreen(),
        //       ),
        context.pushNamed(ProductsScreen.name, extra: product);
        // );
      },
      child: SizedBox(
        width: 140,
        child: Column(
          children: [
            Image.network(
              product.url,
              width: 150,
              height: 100,
            ),
            Text(product.name),
            Text('Precio: ${product.price}'),
            Text('Valoracion: ${product.assessment}'),
          ],
        ),
      ),
    );
  }
}
