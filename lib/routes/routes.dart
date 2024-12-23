import 'package:advance_flutter_exam_app/view/screens/favoritepage/favoritepage.dart';
import 'package:flutter/material.dart';

import '../view/screens/detalispage/detalis.dart';
import '../view/screens/homepage/homepage.dart';
import '../view/screens/splashscreen/spalsh.dart';

class Routes {
  static const String splash = '/';
  static const String home = 'homepage';
  static const String detalis = 'detalispage';
  static const String favorites = 'favoritespage';

  static Map<String, WidgetBuilder> myRoutes = {
    splash: (context) => const SplashScreen(),
    home: (context) => const HomePage(),
    detalis: (context) => const DetalisPage(),
    favorites: (context) => const FavoritePage(),
  };
}
