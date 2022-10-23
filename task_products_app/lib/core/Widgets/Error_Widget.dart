



import 'package:flutter/material.dart';

import '../Responsive_Ui/Config_Size.dart';

class Error_Widget extends StatelessWidget {
  final String message ;
  const Error_Widget({required this.message, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          height: ConfigSize.defaultSize! * 40,
          child: Center(child: Text(message))),
    );
  }
}
