import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:realtor_app/core/constants/app_colors.dart';
import 'package:realtor_app/core/constants/app_style.dart';

class SignupPage extends ConsumerWidget {
  const SignupPage({super.key});

  //builds sign up page
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        shadowColor: Colors.black,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Image(
            image: const AssetImage('assets/images/dwellz.png'),
            height: 30.h,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Create an account",
                    style: appStyle(32, AppColors.priColor, FontWeight.w500)),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Create your account, it takes less than a\nminute. Enter your details and password",
                    style: appStyle(14, AppColors.white.withOpacity(0.65), FontWeight.w500)),
              ],
            ),
            SizedBox(height: 30.h),
            TextFormField(
              keyboardType: TextInputType.text,
              onChanged: null,
              style: appStyle(
                  14,
                  AppColors.priColor,
                  FontWeight.w500),
              decoration: InputDecoration(
                  hintText: "Name",
                  hintStyle: appStyle(
                      14,
                      AppColors.priColor,
                      FontWeight.normal),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.priColor), 
                    borderRadius: BorderRadius.circular(16.w)
                  )
              ),
            ),
            SizedBox(height: 10.h),
            TextFormField(
              keyboardType: TextInputType.text,
              onChanged: null,
              style: appStyle(
                  14,
                  AppColors.priColor,
                  FontWeight.w500),
              decoration: InputDecoration(
                  hintText: "Email",
                  hintStyle: appStyle(
                      14,
                      AppColors.priColor,
                      FontWeight.normal),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.priColor), 
                    borderRadius: BorderRadius.circular(16.w)
                  )
              ),
            ),
            SizedBox(height: 10.h),
            TextFormField(
              keyboardType: TextInputType.text,
              obscureText: true,
              onChanged: null,
              style: appStyle(
                  14,
                  AppColors.priColor,
                  FontWeight.w500),
              decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: appStyle(
                      14,
                      AppColors.priColor,
                      FontWeight.normal),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.priColor), 
                    borderRadius: BorderRadius.circular(16.w)
                  )
              ),
            ),
            SizedBox(height: 10.h),
            TextFormField(
              keyboardType: TextInputType.text,
              obscureText: true,
              onChanged: null,
              style: appStyle(
                  14,
                  AppColors.priColor,
                  FontWeight.w500),
              decoration: InputDecoration(
                  hintText: "Repeat password",
                  hintStyle: appStyle(
                      14,
                      AppColors.priColor,
                      FontWeight.normal),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.priColor), 
                    borderRadius: BorderRadius.circular(16.w)
                  )
              ),
            ),
            SizedBox(height: 30.h),
            Container(
              decoration: BoxDecoration(
                  color: AppColors.secColor,
                  borderRadius: BorderRadius.all(Radius.circular(16.w)), ),
              width: double.infinity,
              height: 48.h,
              child: Center(
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Sign up",
                      style: appStyle(18.sp, AppColors.black, FontWeight.w500),
                    ),
                  )),
            ),
            const Spacer(),
            Text(
              "Version 1.0.0",
              style: appStyle(13, AppColors.priColor, FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
