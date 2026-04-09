import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants/app_constants.dart';
import '../../config/route.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: 1.sw,
        height: 1.sh,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF3b8d99), Color(0xFFaa4b6b)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          children: [
            /// 🔹 TOP SECTION
            SizedBox(
              height: 0.55.sh,
              child: SafeArea(
                bottom: false,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(6.r),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.water_drop,
                              color: AppColors.primaryContainer,
                              size: 22.sp,
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Text(
                            'River Buzz',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        'Explore the spiritual flow.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            /// 🔹 BOTTOM SHEET
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 1.sw,
                height: 0.45.sh,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.r),
                    topRight: Radius.circular(40.r),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(24.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Title
                      Text(
                        'Welcome back, traveler',
                        style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 6.h),

                      Text(
                        'Enter your mobile number to begin your journey.',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.onSurface.withOpacity(0.6),
                        ),
                      ),

                      SizedBox(height: 24.h),

                      /// Input Row
                      Row(
                        children: [
                          /// Code
                          Expanded(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Code',
                                  style: TextStyle(
                                    fontSize: 11.sp,
                                    color: AppColors.onSurface.withOpacity(0.6),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 6.h),
                                Container(
                                  height: 50.h,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: AppColors.outlineVariant),
                                    borderRadius: BorderRadius.circular(25.r),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('🇮🇳', style: TextStyle(fontSize: 16.sp)),
                                      SizedBox(width: 4.w),
                                      Text('+91', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.sp)),
                                      Icon(Icons.keyboard_arrow_down, size: 18.sp),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(width: 12.w),

                          /// Phone Input
                          Expanded(
                            flex: 7,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Mobile Number',
                                  style: TextStyle(
                                    fontSize: 11.sp,
                                    color: AppColors.onSurface.withOpacity(0.6),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 6.h),
                                Container(
                                  height: 50.h,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: AppColors.outlineVariant),
                                    borderRadius: BorderRadius.circular(25.r),
                                    color: AppColors.surfaceBright,
                                  ),
                                  child: TextField(
                                    controller: _phoneController,
                                    keyboardType: TextInputType.phone,
                                    style: TextStyle(fontSize: 14.sp),
                                    decoration: InputDecoration(
                                      hintText: '98765 43210',
                                      hintStyle: TextStyle(
                                        fontSize: 14.sp,
                                        color: AppColors.onSurface.withOpacity(0.4),
                                      ),
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const Spacer(),

                      /// Button
                      SizedBox(
                        width: 1.sw,
                        height: 50.h,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              AppRoutes.otpVerification,
                              arguments: '+91 ${_phoneController.text}',
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryContainer,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.r),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Get OTP',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 6.w),
                              Icon(Icons.arrow_forward, size: 18.sp),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 16.h),

                      /// Terms
                      Center(
                        child: Text(
                          'By continuing, you agree to our Terms & Privacy Policy',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 11.sp,
                            color: AppColors.onSurface.withOpacity(0.5),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}