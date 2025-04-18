import 'package:apple_market/presentation/app/stringprice.dart';
import 'package:flutter/material.dart';

class DetailBottombar extends StatelessWidget {
  const DetailBottombar({super.key, required this.price});

  final int price;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 좋아요 아이콘
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite_border, color: Colors.grey),
            ),
            // 가격
            Text(formatPrice(price), style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            // 채팅하기 버튼
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                backgroundColor: WidgetStatePropertyAll(Colors.orange),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  '채팅하기',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
