import 'package:dynamichostbd/src/core/res/app_svgs.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MenuItemModel {
  final String title;
  final String icon;
  final Color color;

  MenuItemModel({required this.title, required this.icon, required this.color});
}

final menuProvider = Provider<List<MenuItemModel>>((ref) {
  return [
    MenuItemModel(
      title: "My Profile",
      icon: AppSvgs.myProfile,
      color: Colors.blue,
    ),
    MenuItemModel(
      title: "Fees List",
      icon: AppSvgs.feesList,
      color: Colors.pink,
    ),
    MenuItemModel(title: "Pay Now", icon: AppSvgs.payNow, color: Colors.green),
    MenuItemModel(
      title: "Payment History",
      icon: AppSvgs.paymentHistory,
      color: Colors.orange,
    ),
    MenuItemModel(
      title: "Hostel Fees",
      icon: AppSvgs.hostelFees,
      color: Colors.purple,
    ),
    MenuItemModel(
      title: "College Notice",
      icon: AppSvgs.collegeNotice,
      color: Colors.teal,
    ),
    MenuItemModel(
      title: "Attendance",
      icon: AppSvgs.attendance,
      color: Colors.red,
    ),
    MenuItemModel(
      title: "Class Routine",
      icon: AppSvgs.classRoutine,
      color: Colors.blueGrey,
    ),

    MenuItemModel(
      title: "Exam Routine",
      icon: AppSvgs.examRoutine,
      color: Colors.orange,
    ),
    MenuItemModel(
      title: "Admit Card",
      icon: AppSvgs.admitCard,
      color: Colors.purple,
    ),
    MenuItemModel(
      title: "Student Result",
      icon: AppSvgs.studentResult,
      color: Colors.teal,
    ),
    MenuItemModel(title: "Calendar", icon: AppSvgs.calendar, color: Colors.red),
  ];
});
