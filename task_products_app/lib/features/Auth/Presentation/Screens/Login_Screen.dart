import 'package:flutter/material.dart';

import '../Components/Login_Screen_Body.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: const LoginScreenBody(),
    );
  }
}
