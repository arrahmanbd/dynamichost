import 'package:dynamichostbd/src/core/colors/app_color.dart';
import 'package:dynamichostbd/src/core/widgets/app_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_addons/flutter_addons.dart';
import '../models/menu_item_model.dart';

class MenuGrid extends StatelessWidget {
  final List<MenuItemModel> items;
  final bool showAll;

  const MenuGrid({super.key, required this.items, required this.showAll});

  @override
  Widget build(BuildContext context) {
    final displayItems = showAll ? items : items.take(8).toList();

    return AnimatedSize(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: displayItems.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 20,
          crossAxisSpacing: 12,
          childAspectRatio: .75,
        ),
        itemBuilder: (_, index) {
          final item = displayItems[index];

          return Column(
            children: [
              Container(
                height: 64,
                width: 64,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.textSecondary.withOpacity(0.08),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: AppSvgIcon(item.icon, size: 16),
                ),
              ),
              SizedBox(height: 8),
              Expanded(
                child: Text(
                  item.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
