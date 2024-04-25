import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:realtor_app/core/constants/app_colors.dart';
import 'package:realtor_app/core/constants/app_style.dart';
import 'package:realtor_app/data/providers/property_provider.dart';

import '../home/widgets/property_card.dart';
import '../property_details/property_details_page.dart';

class PropertiesPage extends ConsumerWidget {
  const PropertiesPage({super.key});

  //builds all announcements page
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final propertyList = ref.watch(propertyProvider);
    final isLoading = ref.watch(isLoadingPropertiesProvider);

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
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(color: AppColors.priColor),
            )
          : Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: propertyList.length,
                  itemBuilder: (ctx, index) {
                    return PropertyCard(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PropertyDetailsPage(
                              property: propertyList[index]),
                        ));
                      },
                      property: propertyList[index],
                    );
                  }),
            ),
    );
  }
}
