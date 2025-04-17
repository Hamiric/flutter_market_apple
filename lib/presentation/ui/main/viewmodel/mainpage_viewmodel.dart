import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainState {
  
}

class MainPageViewmodel extends Notifier<MainState> {
  @override
  MainState build() {
    return MainState();
  }
}

final mainPageViewModelProvider =
    NotifierProvider<MainPageViewmodel, MainState>(() {
      return MainPageViewmodel();
    });
