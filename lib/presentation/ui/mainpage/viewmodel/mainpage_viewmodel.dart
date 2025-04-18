import 'dart:developer';

import 'package:apple_market/data/dto/dto_product.dart';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainState {
  List<Product> product;

  MainState(this.product);
}

class MainPageViewmodel extends AsyncNotifier<MainState> {
  @override
  Future<MainState> build() async {
    try {
      final raw = await rootBundle.loadString('assets/data/dummy_data.csv');
      final rows = const CsvToListConverter(
        eol: '\n',
        shouldParseNumbers: false,
        textDelimiter: '"',
      ).convert(raw);

      final filteredRows =
          rows
              .where((row) => row.any((e) => e.toString().trim().isNotEmpty))
              .toList();
      final dataRows = filteredRows.skip(1).toList();
      final product =
          dataRows.map((row) => Product.fromCsv(row.cast<String>())).toList();

      return MainState(product);
    } catch (e, stack) {
      log('csv 읽기 실패: $e\n$stack');
      return MainState([Product()]);
    }
  }

  // 상품 삭제
  void deleteProduct(int index) {
    final currentState = state.value;
    if (currentState == null) return;

    final newProduct = List<Product>.from(currentState.product)
      ..removeAt(index);
    state = AsyncValue.data(MainState(newProduct));
  }
}

final mainPageViewModelProvider =
    AsyncNotifierProvider<MainPageViewmodel, MainState>(() {
      return MainPageViewmodel();
    });
