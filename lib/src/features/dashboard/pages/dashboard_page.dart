import 'package:dynamichostbd/src/core/colors/app_color.dart';
import 'package:dynamichostbd/src/core/res/app_svgs.dart';
import 'package:dynamichostbd/src/features/dashboard/widgets/slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_addons/flutter_addons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/menu_item_model.dart';
import '../provider/dashboard_provider.dart';
import '../widgets/animated_see_more.dart';
import '../widgets/bottom_navbar.dart';
import '../widgets/menu_grid.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  Widget _header() {
    return Container(
      padding: EdgeInsets.all(20),
      color: AppColors.primary,
      child: Row(
        children: [
          CircleAvatar(
            radius: 28,
            foregroundColor: Colors.white,
            backgroundColor: AppColors.textPrimary,
            backgroundImage: NetworkImage('https://picsum.photos/200'),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: .start,
              children: [
                Text(
                  "ABU SAYEED SHEIKH",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "Department of Bangla\nHons 4th Year (2013-2014)",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 10.sp,
                    letterSpacing: .25,
                    height: 1.2,
                  ),
                ),
              ],
            ),
          ),
          Row(
            spacing: 12.w,
            children: [
              Container(
                padding: 8.p,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100.r),
                ),
                child: const Icon(
                  Icons.search_outlined,
                  color: Color.fromARGB(255, 79, 79, 79),
                  size: 32,
                ),
              ),
              Container(
                padding: 8.p,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100.r),
                ),
                child: Image.asset(AppSvgs.clgLogo, width: 32, height: 32),
              ).stackedWith([
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 14,
                    height: 14,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 1.5),
                    ),
                    child: Icon(Icons.menu, size: 8, color: Colors.grey),
                  ),
                ),
              ]),
            ],
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
        ),
        Text(
          "See All",
          style: TextStyle(
            color: AppColors.primary,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  // --- Refined Notice Card (Matches the PDF/JPG UI) ---
  Widget _buildNoticeList() {
    // Sample notice data , I just created random data for testing purpose
    //  Best palace to put this data is in the provider but I just put it here for fast development
    final notices = [
      {
        'type': 'PDF',
        'color': Colors.red,
        'text':
            'অনার্স ৩য় বর্ষ পরীক্ষা- ২০২৪ এর প্রবেশপত্র বিতরণ সংক্রান্ত বিজ্ঞপ্তি',
      },
      {
        'type': 'JPG',
        'color': Colors.blue,
        'text': 'উচ্চ মাধ্যমিক দ্বাদশ শ্রেণির নির্বাচনী পরীক্ষার সময়-সূচি',
      },
      {
        'type': 'PDF',
        'color': Colors.red,
        'text': 'দ্বাদশ শ্রেণির চলমান ক্লাস স্থগিত সংক্রান্ত বিজ্ঞপ্তি',
      },
    ];

    return SizedBox(
      height: 110.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: notices.length,
        itemBuilder: (context, index) {
          final notice = notices[index];
          return Container(
            width: 180,
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 5),
                    Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          // color: notice['color'] as Color,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Image.asset(
                          notice['type'] as String == 'PDF'
                              ? 'assets/svg/pdf.png'
                              : 'assets/svg/jpg.png',
                          width: 48,
                          height: 48,
                        ),
                      ),
                    ),
                    Divider(height: 10, color: Colors.grey.shade300),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        notice['text'] as String,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 47.h,
                  right: 0,
                  child: Container(
                    padding: 1.py + 4.px,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(2.r),
                      ),
                    ),
                    child: Icon(
                      Icons.visibility_outlined,
                      size: 12,
                      color: const Color.fromARGB(255, 15, 15, 15),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // --- Refined Transaction Card ---
  Widget _buildTransactionList() {
    final transactions = [
      {
        'amount': '5,500.00',
        'title': 'অনার্স ৩য় বর্ষ নিয়মিত ভর্তি ও ফরম পূরণ',
      },
      {
        'amount': '2,700.00',
        'title': 'অনার্স ৩য় বর্ষ ফরম পূরণ (গ্রেড/মানোন্নয়ন)',
      },
      {'amount': '450.00', 'title': 'সেমিনার ফি '},
    ];

    return SizedBox(
       height:80.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.zero,
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          final trans = transactions[index];
          return Container(
            width: 180,
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: 12.px + 4.py,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${trans['amount']} ৳ ",
                        style: const TextStyle(
                          color: Color(0xFF00897B),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const Icon(
                        Icons.access_time,
                        size: 20,
                        color: AppColors.textSecondary,
                      ),
                    ],
                  ),
                ),
                 Divider(height: 10, color: Colors.grey.shade300),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    trans['title'] as String,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 11, color: Colors.black87),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(dashboardProvider);
    final notifier = ref.read(dashboardProvider.notifier);
    final menus = ref.watch(menuProvider);

    return Scaffold(
      backgroundColor: AppColors.primary,
      bottomNavigationBar: Consumer(
        builder: (context, ref, _) {
          final index = ref.watch(navIndexProvider);

          return GlassBottomNavBar(
            currentIndex: index,
            onTap: (i) => ref.read(navIndexProvider.notifier).state = i,
          );
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // HEADER
              _header(),

              // CONTENT CONTAINER
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30.r),
                  ),
                ),
                child: Column(
                  children: [
                    MenuGrid(items: menus, showAll: state.showAllMenus),

                    SizedBox(height: 16.h),
                    // After opening Bkash, I saw that their "See More" button just expands the bottom section to show more items.
                    // I hadn’t used Bkash before starting this task, so I made an expandable animated button that toggles the menu grid height.
                    //
                    // It’s not exactly like Bkash, but it works and looks good.
                    AnimatedSeeMore(
                      expanded: state.showAllMenus,
                      onTap: notifier.toggleMenu,
                    ),

                    SizedBox(height: 24.h),
                    // Slider images
                    ImageSliderPage(),

                    SizedBox(height: 24.h),

                    _sectionTitle("Latest Notice"),
                    SizedBox(height: 12.h),
                    _buildNoticeList(),

                    SizedBox(height: 24.h),

                    _sectionTitle("Recent Transaction"),

                    SizedBox(height: 12.h),

                    _buildTransactionList(),
                    SizedBox(height: 24.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
