import 'package:flutter/material.dart';

class ScrollupFloatingactionbutton extends StatefulWidget {
  const ScrollupFloatingactionbutton({
    super.key,
    required this.scrollController,
  });

  final ScrollController scrollController;

  @override
  State<ScrollupFloatingactionbutton> createState() =>
      _ScrollupFloatingactionbuttonState();
}

class _ScrollupFloatingactionbuttonState
    extends State<ScrollupFloatingactionbutton> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTapDown: (_) {
        setState(() {
          isClicked = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          isClicked = false;
        });

        widget.scrollController.animateTo(
          0,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeOut,
        );
      },
      onTapCancel: () {
        setState(() {
          isClicked = false;
        });
      },
      child: CircleAvatar(
        radius: 30,
        backgroundColor: isClicked ? Colors.blue : Colors.white,
        child: Icon(Icons.arrow_circle_up, size: 60, color: Colors.grey),
      ),
    );
  }
}
