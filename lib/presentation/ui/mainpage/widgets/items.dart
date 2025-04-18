import 'package:apple_market/data/dto/dto_product.dart';
import 'package:apple_market/presentation/app/stringprice.dart';
import 'package:apple_market/presentation/ui/detailpage/detailpage.dart';
import 'package:flutter/material.dart';

class Items extends StatelessWidget {
  const Items({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: GestureDetector(
        onTap: () {
          // 상세 페이지 이동
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetailPage(product: product,)),
          );
        },
        child: Container(
          height: 140,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey[200],
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withValues(alpha: 0.5),
                spreadRadius: 2,
                blurRadius: 3,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              // 이미지
              SizedBox(
                width: 100,
                height: 140,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/img/${product.imageName}.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // 데이터
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 8,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 상품명
                      Text(
                        product.title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      // 주소
                      Text(
                        product.address,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                        ),
                      ),
                      // 가격
                      Text(
                        formatPrice(product.price),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      // 댓글 좋아요 수
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.forum_outlined, size: 20),
                            SizedBox(width: 4),
                            Text(product.chats.toString()),
                            SizedBox(width: 12),
                            Icon(Icons.favorite_border, size: 20),
                            SizedBox(width: 4),
                            Text(product.likes.toString()),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
