import 'dart:ui';
import 'package:dynamichostbd/src/core/colors/app_color.dart';
import 'package:dynamichostbd/src/core/res/app_svgs.dart';
import 'package:dynamichostbd/src/core/widgets/app_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_addons/flutter_addons.dart';

class GlassBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const GlassBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 20,
          sigmaY: 20,
        ),
        child: Container(
          height: 75.h,
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white.withOpacity(0.95),
                Colors.white.withOpacity(0.95),
              ],
            ),
            border: Border(
              top: BorderSide(
                color: Colors.white.withOpacity(0.8),
                width: 1,
              ),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 20,
                offset: Offset(0, -4.h),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _navItem(AppSvgs.navHome, "Home", 0),
              _navItem(AppSvgs.navLiveChat, "Live Chat", 1),
              _navItem(AppSvgs.navInbox, "Inbox", 2),
              _navItem(AppSvgs.navProfile, "Profile", 3),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navItem(String icon, String label, int index) {
    final bool isSelected = currentIndex == index;

    return GestureDetector(
      onTap: () => onTap(index),
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: EdgeInsets.symmetric(
          horizontal: 14.w,
          vertical: 8.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: Colors.transparent,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppSvgIcon(
              icon,
              size: 16.sp,
              color: isSelected ? AppColors.primaryGradientEnd : Colors.black54,
            )
            ,
            SizedBox(height: 4.h),
            Text(
              label,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight:
                    isSelected ? FontWeight.w600 : FontWeight.w400,
                color: isSelected ? AppColors.primaryGradientEnd : Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}