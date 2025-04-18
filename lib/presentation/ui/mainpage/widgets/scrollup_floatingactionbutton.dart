import 'package:flutter/material.dart';

class ScrollupFloatingactionbutton extends StatelessWidget {
  const ScrollupFloatingactionbutton({
    super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        scrollController.animateTo(
          0,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeOut,
        );
      },
      child: Icon(Icons.arrow_upward),
    );
  }
}
