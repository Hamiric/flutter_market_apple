class Product {
  int id;
  String imageName;
  String title;
  String description;
  String seller;
  int price;
  String address;
  int likes;
  int chats;
  bool onlikesbtn;

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
    this.onlikesbtn = false,
  });

  factory Product.fromCsv(List<String> row) {
    return Product(
      id: int.parse(row[0]),
      imageName: row[1],
      title: row[2],
      description: row[3].replaceAll(r'\n', '\n'),
      seller: row[4],
      price: int.parse(row[5]),
      address: row[6],
      likes: int.parse(row[7]),
      chats: int.parse(row[8]),
      onlikesbtn: false,
    );
  }
}
