import 'package:realtor_app/pages/application/application_page.dart';
import 'package:realtor_app/pages/bookmarks/bookmarks_page.dart';
import 'package:realtor_app/pages/onboarding/onboarding_page.dart';
import 'package:realtor_app/pages/properties/properties_page.dart';
import 'package:realtor_app/routes/routes.dart';

import '../pages/home/home_page.dart';

class AppRoutes {
  static final routes = {
    Routes.ONBOARDING: (context) => const OnboardingPage(),
    Routes.HOME: (context) => const HomePage(),
    Routes.APPLICATION: (context) => const ApplicationPage(),
    Routes.PROPERTIES: (context) => const PropertiesPage(),
    Routes.BOOKMARKS: (context) => const BookmarksPage(),
  };
}