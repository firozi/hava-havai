class Product {
  final String title;
  final double discountPercentage;
  final String brand;
  final double price;
  final double discountedPrice;
  final String image;

  Product({
    required this.title,
    required this.discountPercentage,
    required this.brand,
    required this.price,
    required this.image
  }) : discountedPrice = price - (price * discountPercentage / 100);


}