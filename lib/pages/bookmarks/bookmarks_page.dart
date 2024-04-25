import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:realtor_app/core/constants/app_colors.dart';
import 'package:realtor_app/core/constants/app_style.dart';
import 'package:realtor_app/data/providers/bookmark_provider.dart';
import 'package:realtor_app/data/providers/property_provider.dart';

import '../home/widgets/property_card.dart';
import '../property_details/property_details_page.dart';

class BookmarksPage extends ConsumerWidget {
  const BookmarksPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final propertyBookmarksList = ref.watch(bookmarksProvider);
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
              child: propertyBookmarksList.isNotEmpty
                  ? ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: propertyBookmarksList.length,
                      itemBuilder: (ctx, index) {
                        return PropertyCard(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => PropertyDetailsPage(
                                  property: propertyBookmarksList[index]),
                            ));
                          },
                          property: propertyBookmarksList[index],
                        );
                      })
                  : Center(
                      child: Text(
                        "Empty",
                        style:
                            appStyle(18, AppColors.secColor, FontWeight.w500),
                      ),
                    ),
            ),
    );
  }
}
