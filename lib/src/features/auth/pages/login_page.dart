import 'package:dynamichostbd/src/core/res/app_svgs.dart';
import 'package:dynamichostbd/src/core/widgets/app_icon.dart';
import 'package:dynamichostbd/src/features/dashboard/pages/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_addons/flutter_addons.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/colors/app_color.dart';
import '../provider/auth_provider.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_textfield.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final phoneController = useTextEditingController();
    final passwordController = useTextEditingController();
    final state = ref.watch(loginProvider);

    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        title: Text(
          "Login",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: .start,
        crossAxisAlignment: .start,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.vertical(top: Radius.circular(25.r)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 10.h),
                    Text(
                      "Welcome to",
                      style: TextStyle(
                        fontSize: 26.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    SizedBox(height: 16),

                    Container(
                      height: 64.h,
                      width: 64.w,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(8.r),
                        image: const DecorationImage(
                          image: AssetImage('assets/svg/clg_logo.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),

                    SizedBox(height: 16.h),
                    Text(
                      "Carmichael College, Rangpur",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),

                    SizedBox(height: 32.h),

                    AuthTextField(
                      label: "Phone Number",
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                    ),

                    AuthTextField(
                      label: "Password",
                      controller: passwordController,
                      obscureText: true,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Checkbox(
                          value: state.rememberMe,
                          onChanged: (v) => ref
                              .read(loginProvider.notifier)
                              .toggleRemember(v ?? false),
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          visualDensity: VisualDensity.compact,
                        ),
                        Text(
                          "Remember Me",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 18.h),

                    AuthButton(
                      text: "Login",
                      loading: state.isLoading,
                      onPressed: () {
                        ref
                            .read(loginProvider.notifier)
                            .login(
                              phone: phoneController.text,
                              password: passwordController.text,
                            )
                            .then((_) {
                              // Handle post-login actions here, like navigation or showing a success message.

                              // For demonstration, we'll just navigate to the dashboard page after a successful login.

                              // I definitely don't handle routing this way, but for the sake of this task, I will do it like this.
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DashboardPage(),
                                ),
                              );
                            });
                      },
                    ),

                    SizedBox(height: 18.h),

                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.primary,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),

                    SizedBox(height: 12),

                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.textSecondary,
                        ),
                        children: [
                          const TextSpan(text: "New user in ePay? "),
                          TextSpan(
                            text: "Register Now",
                            style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 40.h),

                    AppSvgIcon(AppSvgs.dynamicHostLogo, size: 24),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
