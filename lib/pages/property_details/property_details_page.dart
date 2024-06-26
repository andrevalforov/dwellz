import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:realtor_app/core/constants/app_colors.dart';
import 'package:realtor_app/core/constants/app_style.dart';
import 'package:realtor_app/data/models/property_model.dart';

import '../../data/providers/property_provider.dart';

class PropertyDetailsPage extends ConsumerWidget {
  const PropertyDetailsPage({super.key, required this.property});

  final PropertyModel property;

  //builds announcement page
  @override
  Widget build(BuildContext context, WidgetRef ref) {
  double screenHeight = MediaQuery.of(context).size.height;
  double sreenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(275.h),
        child: AppBar(
          leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Container(
                  decoration: BoxDecoration(
                      color: AppColors.black.withOpacity(0.7),
                      borderRadius: BorderRadius.all(Radius.circular(10.h))),
                  height: 32.h,
                  width: 32.w,
                  child: Icon(
                    Icons.arrow_back,
                    size: 20.h,
                    color: AppColors.priColor,
                  ))),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Row(
                children: [
                  Container(
                      decoration: BoxDecoration(
                          color: AppColors.black.withOpacity(0.7),
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.h))),
                      height: 32.h,
                      width: 32.w,
                      child: Icon(
                        Icons.share,
                        size: 20.h,
                        color: AppColors.secColor,
                      )),
                  SizedBox(width: 10.w),
                  property.isBookmarked
                      ? GestureDetector(
                          onTap: () {
                            ref.read(propertyProvider.notifier).toggleBookmark(
                                property.externalID ?? "0",
                                isBookmarked: false);
                          },
                          child: Container(
                            width: 32.w,
                            height: 32.h,
                            decoration: BoxDecoration(
                              color: AppColors.black.withOpacity(0.7),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.w),
                              ),
                            ),
                            child: Icon(
                              Icons.bookmark_sharp,
                              size: 20,
                              color: AppColors.secColor,
                            ),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            ref.read(propertyProvider.notifier).toggleBookmark(
                                property.externalID ?? "0",
                                isBookmarked: true);
                          },
                          child: Container(
                            width: 32.w,
                            height: 32.h,
                            decoration: BoxDecoration(
                              color: AppColors.black.withOpacity(0.7),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.w),
                              ),
                            ),
                            child: Icon(
                              Icons.bookmark_outline_sharp,
                              size: 20,
                              color: AppColors.secColor,
                            ),
                          ),
                        )
                ],
              ),
            )
          ],
          flexibleSpace: SizedBox(
            height: screenHeight/2,
            child: CachedNetworkImage(
              imageUrl: property.coverPhoto ?? "",
              fit: BoxFit.cover,
              width: 330.w,
              height: 150.h,
              placeholder: (context, url) => SvgPicture.asset(
                'assets/images/placeholder.svg',
                fit: BoxFit.cover,
                width: 330.w,
                height: 150.h,
              ),
              errorWidget: (context, url, error) => SvgPicture.asset(
                'assets/images/placeholder.svg',
                fit: BoxFit.cover,
                width: 330.w,
                height: 150.h,
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.black,
        ),
      ),
      body: Container(
        color: AppColors.black,
        child: ListView(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    Container(
                      child: Container(
                        padding: EdgeInsets.only(top: 18.h, bottom: 5.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                property.title?.substring(0, 30) ?? "",
                                style: appStyle(
                                    14.sp, AppColors.priColor, FontWeight.bold),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  property.productScore.toString(),
                                  style: appStyle(
                                      14, AppColors.priColor, FontWeight.w500),
                                ),
                                SizedBox(width: 5.w),
                                Icon(
                                  Icons.star,
                                  size: 19,
                                  color: AppColors.priColor,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.bed_outlined,
                                    size: 20.w,
                                    color: AppColors.priColor,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    property.rooms.toString(),
                                    style: appStyle(15.sp, AppColors.priColor,
                                        FontWeight.normal),
                                  )
                                ],
                              ),
                              SizedBox(width: 10.w),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.bathtub_outlined,
                                    size: 19.w,
                                    color: AppColors.priColor,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    property.baths.toString(),
                                    style: appStyle(15.sp, AppColors.priColor,
                                        FontWeight.normal),
                                  )
                                ],
                              ),
                              SizedBox(width: 10.w),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.house_outlined,
                                    size: 22.w,
                                    color: AppColors.priColor,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    property.category ?? "",
                                    style: appStyle(15.sp, AppColors.priColor,
                                        FontWeight.normal),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    const Divider(),
                    SizedBox(height: 10.h),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        property.title ?? "",
                        style: appStyle(
                            13.sp, AppColors.priColor, FontWeight.normal),
                        softWrap: true,
                      ),
                    ),
                    SizedBox(height: 9.h),
                    const Divider(),
                    SizedBox(height: 10.h),
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Location",
                            style: appStyle(
                                15.sp, AppColors.priColor, FontWeight.bold),
                            softWrap: true,
                          ),
                          Row(
                            children: [
                              Icon(Icons.location_on_outlined,
                                  color: AppColors.secColor, size: 20.h),
                              SizedBox(width: 8.w),
                              Text(
                                property.location ?? "",
                                style: appStyle(
                                    14.sp, AppColors.secColor, FontWeight.bold),
                                softWrap: true,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.h),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Facilities",
                        style: appStyle(
                            15.sp, AppColors.priColor, FontWeight.bold),
                        softWrap: true,
                      ),
                    ),
                    SizedBox(height: 14.h),
                    SizedBox(
                      width: 340.w,
                      height: screenHeight/6,
                      child: ListView.builder(
                          // scrollDirection: Axis.horizontal,
                          itemCount: property.amenities?.length,
                          itemBuilder: (context, index) {
                            return Column(children: [
                              Row(
                                children: [
                                  Icon(Icons.check_circle, size: 18.h, color: AppColors.priColor,),
                                  SizedBox(width: 10.w),
                                  Text(
                                    property.amenities![index],
                                    style: appStyle(
                                        14.sp, AppColors.priColor, FontWeight.w400),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5.h),
                            ]);
                          }),
                    ),
                    // child: GestureDetector(onTap: () {print(property.amenities);},),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        width: 375.w,
        height: screenHeight/7,
        decoration: BoxDecoration(color: AppColors.black, boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 1)
        ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: BottomNavigationBar(
            backgroundColor: AppColors.black,
            currentIndex: 0,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.priColor,
            unselectedItemColor: AppColors.secColor,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            onTap: (value) {},
            items: [
              BottomNavigationBarItem(
                label: "\$${property.price}",
                icon: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text("Price (month)",
                        style: appStyle(
                            12, AppColors.priColor, FontWeight.w600)),
                    Text("USD ${property.price}",
                        style: appStyle(
                            16, AppColors.priColor, FontWeight.w600)),
                  ],
                ),
              ),
              BottomNavigationBarItem(
                label: "Book",
                icon: Container(
                  decoration: BoxDecoration(
                      color: AppColors.secColor,
                      borderRadius: BorderRadius.all(Radius.circular(10.h))),
                  width: double.infinity,
                  height: 45.h,
                  child: Center(
                      child: Text(
                    "Book",
                    style: appStyle(18.sp, AppColors.black, FontWeight.w500),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
