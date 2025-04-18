import 'package:apple_market/presentation/app/stringprice.dart';
import 'package:apple_market/presentation/ui/mainpage/viewmodel/mainpage_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailBottombar extends ConsumerStatefulWidget {
  const DetailBottombar({super.key, required this.price, required this.index});

  final int price;
  final int index;

  @override
  ConsumerState<DetailBottombar> createState() => _DetailBottombarState();
}

class _DetailBottombarState extends ConsumerState<DetailBottombar> {
  @override
  Widget build(BuildContext context) {
    bool isfavorite = ref.read(mainPageViewModelProvider.notifier).setOnLikesBtn(widget.index);
    
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
              onPressed: () {
                setState(() {
                  if (isfavorite == false) {
                    ref
                        .read(mainPageViewModelProvider.notifier)
                        .favoritCountChange(widget.index, true);
                  } else {
                    ref
                        .read(mainPageViewModelProvider.notifier)
                        .favoritCountChange(widget.index, false);
                  }
                  isfavorite = !isfavorite;
                });
              },
              icon: Icon(
                isfavorite ? Icons.favorite : Icons.favorite_border,
                color: isfavorite ? Colors.red : Colors.grey,
              ),
            ),
            // 가격
            Text(
              formatPrice(widget.price),
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
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
