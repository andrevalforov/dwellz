import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:realtor_app/core/constants/app_colors.dart';
import 'package:realtor_app/pages/application/providers/application_providers.dart';
import 'package:realtor_app/pages/application/widgets/current_page.dart';

class ApplicationPage extends ConsumerWidget {
  const ApplicationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIdx = ref.watch(bottomIndexProvider);
    return Container(
      color: Colors.black,
      child: SafeArea(
        child: Scaffold(

          body: CurrentPage(index: currentIdx),
          bottomNavigationBar: Container(
            width: 375.w,
            height: 70.h,
            decoration: BoxDecoration(color: AppColors.black),
            child: BottomNavigationBar(
              backgroundColor: AppColors.black,
              currentIndex: currentIdx,
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              selectedFontSize: 12,
              unselectedFontSize: 12,
              selectedItemColor: AppColors.secColor,
              unselectedItemColor: AppColors.priColor,
              onTap: (value) => ref.read(bottomIndexProvider.notifier).state = value,
              items: bottomTabs,
            ),
          ),
        ),
      ),
    );
  }
}
