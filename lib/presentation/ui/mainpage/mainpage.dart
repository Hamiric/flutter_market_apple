import 'package:apple_market/presentation/ui/mainpage/viewmodel/mainpage_viewmodel.dart';
import 'package:apple_market/presentation/ui/mainpage/widgets/items.dart';
import 'package:apple_market/presentation/ui/mainpage/widgets/scrollup_floatingactionbutton.dart';
import 'package:apple_market/presentation/ui/mainpage/widgets/snackBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  final ScrollController _scrollController = ScrollController();
  bool _isfade = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      final shouldShow = _scrollController.offset > 10;
      if (_isfade != shouldShow) {
        setState(() {
          _isfade = shouldShow;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                controller: _scrollController,
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
      floatingActionButton: IgnorePointer(
        ignoring: !_isfade,
        child: AnimatedOpacity(
          opacity: _isfade ? 1.0 : 0.0,
          duration: Duration(milliseconds: 300),
          child: ScrollupFloatingactionbutton(
            scrollController: _scrollController,
          ),
        ),
      ),
    );
  }
}
