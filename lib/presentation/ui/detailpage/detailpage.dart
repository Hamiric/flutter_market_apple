import 'package:apple_market/data/dto/dto_product.dart';
import 'package:apple_market/presentation/ui/detailpage/widgets/bottombar.dart';
import 'package:apple_market/presentation/ui/detailpage/widgets/content.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.product, required this.index});

  final Product product;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back)),
        title: Text('상품 상세'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // 
            Expanded(
              child: Content(product: product,),
            ),
            // 하단바
            DetailBottombar(price: product.price, index: index),
          ],
        ),
      ),
    );
  }
}