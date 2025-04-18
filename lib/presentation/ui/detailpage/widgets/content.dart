import 'package:apple_market/data/dto/dto_product.dart';
import 'package:apple_market/presentation/ui/detailpage/widgets/profile.dart';
import 'package:flutter/material.dart';

class Content extends StatelessWidget {
  const Content({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 상품 이미지
          SizedBox(
            width: double.maxFinite,
            height: 250,
            child: Image.asset('assets/img/${product.imageName}.png', fit: BoxFit.cover,)
          ),
          SizedBox(height: 8,),
          // 프로필(판매자)
          Profile(title: product.seller, address: product.address),
          // Divider
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Divider(thickness: 2, color: Colors.grey, height: 8,),
          ),
          SizedBox(height: 8,),
          // 상품명
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(product.title, style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
          ),
          SizedBox(height: 16,),
          // 상품소개
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(product.description, style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),),
          ),
          SizedBox(height: 16,),
        ],
      ),
    );
  }
}