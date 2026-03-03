
class DashboardState {
  final bool showAllMenus;

  DashboardState({this.showAllMenus = false});

  DashboardState copyWith({bool? showAllMenus}) {
    return DashboardState(
      showAllMenus: showAllMenus ?? this.showAllMenus,
    );
  }
}