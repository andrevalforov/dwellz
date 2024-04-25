import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:realtor_app/core/constants/app_colors.dart';
import 'package:realtor_app/core/constants/app_style.dart';
import 'package:realtor_app/pages/application/widgets/current_page.dart';

import '../application/providers/application_providers.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

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
                Text("Welcome back",
                    style: appStyle(32, AppColors.priColor, FontWeight.w500)),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("We happy to see you again here. Enter your\nemail and password",
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
                      "Log in",
                      style: appStyle(18.sp, AppColors.black, FontWeight.w500),
                    ),
                  )),
            ),
            SizedBox(height: 10.h),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const CurrentPage(index: 4)));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.black,
                    border: Border.all(color: AppColors.secColor),
                    borderRadius: BorderRadius.all(Radius.circular(16.w))),
                width: double.infinity,
                height: 48.h,
                child: Center(
                    child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const CurrentPage(index: 4)));
                  },
                  child: Text(
                    "Sign up",
                    style: appStyle(18.sp, AppColors.white, FontWeight.w500),
                  ),
                )),
            ),
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
