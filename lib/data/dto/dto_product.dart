class Product {
  final int id;
  final String imageName;
  final String title;
  final String description;
  final String seller;
  final int price;
  final String address;
  final int likes;
  final int chats;

  Product({
    this.id = 0,
    this.imageName = '',
    this.title = '',
    this.description = '',
    this.seller = '',
    this.price = 0,
    this.address = '',
    this.likes = 0,
    this.chats = 0,
  });

  factory Product.fromCsv(List<String> row) {
    return Product(
      id: int.parse(row[0]),
      imageName: row[1],
      title: row[2],
      description: row[3],
      seller: row[4],
      price: int.parse(row[5]),
      address: row[6],
      likes: int.parse(row[7]),
      chats: int.parse(row[8]),
    );
  }
}
