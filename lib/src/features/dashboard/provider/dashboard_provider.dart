import 'package:flutter_riverpod/legacy.dart';
import '../models/dasgboard_state.dart';



class DashboardNotifier extends StateNotifier<DashboardState> {
  DashboardNotifier() : super(DashboardState());

  void toggleMenu() {
    state = state.copyWith(
      showAllMenus: !state.showAllMenus,
    );
  }
}

final dashboardProvider =
    StateNotifierProvider<DashboardNotifier, DashboardState>(
        (ref) => DashboardNotifier());


// Riverpod provider to hold current slider index
final sliderIndexProvider = StateProvider<int>((ref) => 0);

  final List<String> images = [
    'assets/svg/slider.png',
    'assets/svg/slider.png',
    'assets/svg/slider.png',
  ];

final navIndexProvider = StateProvider<int>((ref) => 0);