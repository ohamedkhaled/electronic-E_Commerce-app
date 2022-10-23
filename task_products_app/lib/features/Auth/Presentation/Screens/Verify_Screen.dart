import 'package:flutter/material.dart';
import 'package:task_products_app/features/Auth/Presentation/Components/Verify_Screen_Body.dart';
class VerifyScreen extends StatelessWidget {
  const VerifyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

     return  Scaffold(

      body: VerifyScreenBody() ,
    );
  }
}
