import 'package:apple_market/presentation/ui/main/widgets/items.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('르탄동'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications_none, size: 28,)),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: ListView.builder(
            itemCount: 4,
            itemBuilder: (BuildContext context, int index){
              return Items();
            }
          ),
        ),
      ),
    );
  }
}
