import 'package:flutter/material.dart';

import '../../../../core/Responsive_Ui/Config_Size.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: ConfigSize.defaultSize! * 40,
        child: const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
