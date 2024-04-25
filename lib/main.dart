import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:realtor_app/core/constants/app_colors.dart';
import 'package:realtor_app/pages/application/application_page.dart';
import 'package:realtor_app/pages/onboarding/onboarding_page.dart';
import 'package:realtor_app/routes/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

int? isFirstTime;

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isFirstTime = prefs.getInt('openFirstTime');

  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

// void initialization() async {
//   FlutterNativeSplash.remove();
// }


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.secColor),
          useMaterial3: true,
          fontFamily: "Travels",
          appBarTheme: const AppBarTheme(elevation: 0, backgroundColor: Colors.transparent),
        ),
        home: const OnboardingPage(),
        // home: isFirstTime == 1 ? const ApplicationPage() : const OnboardingPage(),
        routes: AppRoutes.routes,
      ),
    );
  }
}
