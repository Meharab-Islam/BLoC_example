// ignore_for_file: body_might_complete_normally_nullable
import 'package:flutter/material.dart';
import 'package:bloc_practice/screens/authentication/sign_up_screen.dart';
import 'package:bloc_practice/screens/authentication/sign_in_screen.dart';

import '../screens/home/home_screen.dart';

class Routes {
  static Route? onGeneratedRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const SignInScreen(),
        );

      case '/sign-up':
        return MaterialPageRoute(builder: (context) => const SignUpScreen());
      case '/home':
        return MaterialPageRoute(builder: (context) => const HomeScreen());
    }
  }
}
