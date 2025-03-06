import 'package:hooks_riverpod/hooks_riverpod.dart';

final homeIndexProvider = StateNotifierProvider<HomeIndexProvider, int>(
  (ref) => HomeIndexProvider(0),
);

class HomeIndexProvider extends StateNotifier<int> {
  HomeIndexProvider(super.state);

  changeTheIndex(int currentIndex) {
    state = currentIndex;
  }
}
