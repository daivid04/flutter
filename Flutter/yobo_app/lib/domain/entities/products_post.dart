
class ProductsPost {
  final int id;
  final int idCategory;
  final String name;
  final String description;
  final double price;
  final double assessment;
  final String url;
  final int stock;

  ProductsPost(
      {required this.id,
      required this.idCategory,
      required this.name,
      required this.description,
      required this.price,
      required this.assessment,
      required this.url,
      required this.stock,
      });
}
