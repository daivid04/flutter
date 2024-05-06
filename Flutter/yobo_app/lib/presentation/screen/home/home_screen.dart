import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yobo_app/domain/entities/categories_post.dart';
import 'package:yobo_app/presentation/provider/provider_categories.dart';
import 'package:yobo_app/presentation/provider/provider_products.dart';
import 'package:yobo_app/presentation/screen/home/content_home.dart';
import 'package:yobo_app/presentation/widgets/function/list_random.dart';
// import 'package:yobo_app/presentation/screen/security/security_screen.dart';
import 'package:yobo_app/presentation/widgets/shared/navigation_bar.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'Home_Screen';
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final categoryProvider = context.watch<ProviderCategories>();
    final productProvider = context.watch<ProviderProducts>();
    return Scaffold(
      appBar: AppBar(
        actions: const [
          // SizedBox(width: 4,),
          IconBar(icon: Icons.notifications),
          SizedBox(width: 15)
        ],
        title: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(30)),
          padding: const EdgeInsets.all(2),
          child: TextFormField(
            decoration: InputDecoration(
                border: InputBorder.none,
                suffixIcon: TextButton(
                    style: const ButtonStyle(
                        iconColor: MaterialStatePropertyAll(Colors.white),
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.black)),
                    onPressed: () {},
                    child: const Icon(Icons.search_outlined))),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 17),
          child: Column(
            children: [
              CategoryIcons(categoryProvider: categoryProvider),
              Offers(productProvider: productProvider),
              const SizedBox(
                height: 30,
              ),
              Products(
                productProvider: productProvider,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const ButtonNavigationBar(),
    );
  }
}

class CategoryIcons extends StatelessWidget {
  const CategoryIcons({
    super.key,
    required this.categoryProvider,
  });

  final ProviderCategories categoryProvider;

  @override
  Widget build(BuildContext context) {
    return Container(
      //ofertas
      alignment: Alignment.topCenter,
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: min(5, categoryProvider.listCategories.length),
        itemBuilder: (context, index) {
          final categories = categoryProvider.listCategories[index];
          return IconCategory(categories: categories);
        },
        // itemCount: categoryProvider.listCategories.length,
      ),
    );
  }
}

class IconCategory extends StatelessWidget {
  const IconCategory({
    super.key,
    required this.categories,
  });

  final CategoriesPost categories;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SizedBox(
        width: 120,
        height: double.infinity,
        // decoration:const BoxDecoration(color: Colors.blue),
        child: IconBar(
          sizeIcon: 30,
          paddingIcon: 42,
          icon: categories.icon,
          label: categories.label,
          horizontal: 20,
          colorIcon: colors.primary.withRed(100).withOpacity(0.5),
          colorText: Colors.black,
        ));
  }
}

class Offers extends StatelessWidget {
  const Offers({
    super.key,
    required this.productProvider,
  });

  final ProviderProducts productProvider;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      height: 230,
      color: colors.primary.withRed(100).withOpacity(0.3),
      child: Column(children: [
        ListTile(
          title: const Text(
            'Ofertas',
            style: TextStyle(fontSize: 22),
          ),
          trailing: const Icon(Icons.arrow_forward_ios_rounded),
          onTap: () {},
        ),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final product = productProvider.products[index];
              return Row(children: [
                ContentHome(product: product),
                const SizedBox(
                  width: 10,
                )
              ]);
            },
            itemCount: min(5, productProvider.products.length),
          ),
        ),
      ]),
    );
  }
}

class Products extends StatelessWidget {
  const Products({
    super.key,
    required this.productProvider,
  });
  final ProviderProducts productProvider;

  @override
  Widget build(BuildContext context) {
    final productos = productProvider.products;
    final indice = listRandom(productos.length);
    return Column(
      children: [
        ListTile(
          title: const Text(
            'Productos',
            style: TextStyle(fontSize: 24),
          ),
          onTap: () {},
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 1),
          itemBuilder: (context, index) {
            final product = productos[indice[index]];
            return ContentHome(product: product);
          },
          itemCount: productos.length,
        ),
      ],
    );
  }
}
