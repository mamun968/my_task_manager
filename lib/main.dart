import 'package:flutter/material.dart';
import 'package:task_manager_app/screen/onboarding/emailVerificationScreen.dart';
import 'package:task_manager_app/screen/onboarding/loginScreen.dart';
import 'package:task_manager_app/screen/onboarding/pinVerificationScreen.dart';
import 'package:task_manager_app/screen/onboarding/setPasswordScreen.dart';
import 'package:task_manager_app/screen/onboarding/splashScreen.dart';

import 'screen/onboarding/registrationScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Task Manager',
        initialRoute: '/login',
        routes: {
          '/': (context) => const SplashScreen(),
          '/login': (context) => const LoginScreen(),
          '/setPassword': (context) => const SetPasswordScreen(),
          '/registration': (context) => const RegistrationScreen(),
          '/pinVerification': (context) => const PinVerificationScreen(),
          '/emailVerification': (context) => const EmailVerificationScreen(),
        });
  }
}
