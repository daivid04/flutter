import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:yobo_app/domain/entities/entities.dart';
import 'package:yobo_app/presentation/provider/provider_products.dart';
import 'package:yobo_app/presentation/widgets/shared/place_holder_format.dart';
import 'package:yobo_app/presentation/widgets/shared/rating_scale.dart';

class ProductsScreen extends StatelessWidget {
  final ProductsPost product;
  static const String name = 'Products_Screen';
  const ProductsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final productProvider = context.watch<ProviderProducts>();
    final opiniones = productProvider.opinions[product.id - 1];
    const double space = 14;
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.black)),
          child: TextFormField(
            autofocus: false,
            decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
                border: InputBorder.none,
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                )),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          width: double.infinity,
          child: Column(
            children: [
              Text(
                product.name,
                style: const TextStyle(fontSize: 23),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: space,
              ),
              _ImageProduct(product: product),
              const SizedBox(
                height: space,
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text('\$/${product.price}',
                    style: const TextStyle(fontSize: 20),
                    textAlign: TextAlign.end),
              ),
              const SizedBox(
                height: space,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                decoration: BoxDecoration(
                    color: colors.primary.withRed(90).withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20)),
                width: double.infinity,
                // height: 1,
                // color: Colors.deepOrange,
                child: const TextWeight(
                  text1: '¡ENVÍO GRATIS A TODO EL PAÍS',
                  text2:
                      ' en todas tus compras! ¡Aprovecha esta oferta ahora y ahorra aún más!',
                ),
              ),
              const SizedBox(
                height: space * 2,
              ),
              const Align(
                  //Descripción
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Descripción',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                  )),
              Text(product.description), //Descripción
              const SizedBox(
                height: space,
              ),
              RatingScale(
                rating: product.assessment,
              ), //Escala de valoración
              TextFormField(
                //Cantidad de comprar
                decoration: const InputDecoration(
                  icon: Text('Cantidad: '),
                  hintText: '1',
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  PlaceHolderFormat(cant: (product.stock ~/ 5))
                ],
              ),
              const SizedBox(
                height: space,
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text('Comprar ahora')), //botón de compra
              const SizedBox(
                height: space * 2,
              ),
              const ReturnText(),
              const SizedBox(
                height: space,
              ),
              Container(
                height: 1,
                width: double.infinity,
                color: Colors.black.withOpacity(0.5),
              ),
              const SizedBox(
                height: space * 2,
              ), //Texto de devolución
              ListTile(
                title: const Text('Productos del vendedor'),
                onTap: () {},
                trailing: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 15,
                ),
              ),
              //TODO: productos del vendedor
              Align(
                  //Opiniones
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Opiniones del producto (${opiniones.length})',
                    style: const TextStyle(fontSize: 18),
                  )),
              const SizedBox(
                height: 15,
              ),
              Container(
                constraints: const BoxConstraints(maxHeight: 500),
                child: ListView.builder(
                  // shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),

                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Comment(opinion: opiniones[index]));
                  },
                  itemCount: min(3, opiniones.length),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ImageProduct extends StatelessWidget {
  const _ImageProduct({
    required this.product,
  });

  final ProductsPost product;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Image.network(
          product.url,
          width: width,
          height: height * .45,
          fit: BoxFit.fitHeight,
        ),
        Positioned(
            right: width * 0.02,
            bottom: 15,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: const Color.fromARGB(255, 204, 204, 204),
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.favorite_border),
              ),
            )),
      ],
    );
  }
}

class TextWeight extends StatelessWidget {
  const TextWeight({
    super.key,
    required this.text1,
    required this.text2,
  });
  final String text1;
  final String text2;
  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
      style: const TextStyle(fontSize: 15, color: Colors.black),
      children: <TextSpan>[
        TextSpan(
            text: text1, style: const TextStyle(fontWeight: FontWeight.w600)),
        TextSpan(
          text: text2,
        )
      ],
    ));
  }
}

class ReturnText extends StatelessWidget {
  const ReturnText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: <TextSpan>[
      TextSpan(
          text: 'Devolución gratis',
          onEnter: (event) {},
          style: const TextStyle(color: Colors.blueAccent)),
      const TextSpan(
          text: ' tienes 30 días para devolver el producto',
          style: TextStyle(color: Colors.black))
    ]));
  }
}

class Comment extends StatelessWidget {
  const Comment({
    super.key,
    required this.opinion,
  });
  final OpinionsPost opinion;

  @override
  Widget build(BuildContext context) {
    final int cantLinea = opinion.opinion.length ~/ 50;
    return Container(
      height:80 + ((((cantLinea + 1 > 3) ? 2 : cantLinea) + 1)* 25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromARGB(66, 155, 155, 155),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          RatingScale(rating: opinion.qualification),
          Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                '${opinion.user} | ${opinion.date}',
              )),
          Text(((cantLinea + 1 <= 3) ? opinion.opinion : '${opinion.opinion.substring(0,140)}...')),
        ],
      ),
    );
  }
}
