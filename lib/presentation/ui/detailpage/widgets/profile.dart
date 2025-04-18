import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key, required this.title, required this.address});

  final String title;
  final String address;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Row(
        children: [
          SizedBox(width: 16),
          CircleAvatar(
            radius: 26,
            backgroundColor: Colors.orange,
            child: Icon(Icons.person, color: Colors.white, size: 32),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(),
              Text(
                title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                address,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
              Spacer(),
            ],
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(),
              // 매너온도
              Text(
                '39.3 °C',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              Text(
                '매너온도',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                  decoration: TextDecoration.underline,
                ),
              ),
              Spacer(),
            ],
          ),
          SizedBox(width: 16),
        ],
      ),
    );
  }
}
