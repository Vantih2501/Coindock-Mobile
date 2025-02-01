import 'package:coindock_app/navigation_menu.dart';
import 'package:coindock_app/screens/auth/login.dart';
import 'package:coindock_app/screens/auth/register.dart';
import 'package:flutter/material.dart';

var CustomRoutes = <String, WidgetBuilder>{
  '/': (context) => const NavigationMenu(),
  '/login': (context) => const LoginPage(),
  '/register': (context) => const RegisterPage(),
};