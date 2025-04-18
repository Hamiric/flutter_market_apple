import 'package:flutter/material.dart';

showSnackBar(BuildContext context) {
  final snackBar = SnackBar(
    content: Text(
      '알람이 설정되었습니다.',
      style: TextStyle(color: Colors.white, fontSize: 16, height: 1),
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    backgroundColor: const Color(0xff9E9E9E),
    behavior: SnackBarBehavior.floating,
    duration: const Duration(seconds: 2),
    action: SnackBarAction(
      label: '',
      textColor: Colors.white,
      onPressed: () {},
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
