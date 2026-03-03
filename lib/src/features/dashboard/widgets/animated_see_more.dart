import 'package:flutter/material.dart';
import 'package:flutter_addons/flutter_addons.dart';

class AnimatedSeeMore extends StatelessWidget {
  final bool expanded;
  final VoidCallback onTap;

  const AnimatedSeeMore({
    super.key,
    required this.expanded,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: 14.px + 6.py,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                expanded ? "See Less" : "See More",
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.deepPurple,
                  letterSpacing: .35
                ),
              ),
              SizedBox(width: 4),
              AnimatedRotation(
                duration: const Duration(milliseconds: 300),
                turns: expanded ? 0.5 : 0,
                child: const Icon(Icons.keyboard_arrow_down, color: Colors.deepPurple,size: 20,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
