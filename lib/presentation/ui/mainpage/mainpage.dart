import 'package:apple_market/presentation/ui/mainpage/viewmodel/mainpage_viewmodel.dart';
import 'package:apple_market/presentation/ui/mainpage/widgets/items.dart';
import 'package:apple_market/presentation/ui/mainpage/widgets/snackBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mainState = ref.watch(mainPageViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('르탄동'),
        actions: [
          IconButton(
            onPressed: () {
              showSnackBar(context);
            },
            icon: Icon(Icons.notifications_none, size: 28),
          ),
        ],
      ),
      body: mainState.when(
        data: (state) {
          final products = state.product;

          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (BuildContext context, int index) {
                  return Items(product: products[index]);
                },
              ),
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('에러: $error')),
      ),
    );
  }
}
