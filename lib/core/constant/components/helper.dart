import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static final GlobalKey<NavigatorState> navigatorState =
  GlobalKey<NavigatorState>();
  static final RouteObserver<PageRoute> routeObserver =
  RouteObserver<PageRoute>();
  static final GlobalKey<ScaffoldMessengerState> scaffoldState =
  GlobalKey<ScaffoldMessengerState>();
}