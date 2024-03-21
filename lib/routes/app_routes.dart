import 'package:quotes_app/headers.dart';
import 'package:quotes_app/pages/detail_page/detail_page.dart';
import 'package:quotes_app/pages/home_page/home_page.dart';
import 'package:quotes_app/pages/splash_screen/splash_screen.dart';

class AppRoutes {
  static String splashScreen = '/';
  static String homePage = 'home_page';
  static String detailPage = 'detail_page';

  static Map<String, WidgetBuilder> routes = {
    splashScreen: (context) => const SplashScreen(),
    homePage: (context) => const HomePage(),
    detailPage: (context) => const DetailPage(),
  };
}
