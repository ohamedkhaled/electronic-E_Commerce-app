



import 'package:flutter/material.dart';

import '../../../../core/Resours_Manger/Assets_Path.dart';
import '../../../../core/Resours_Manger/String_Manger.dart';
import '../../../../core/Resours_Manger/Values_Manger.dart';
import '../../../../core/Responsive_Ui/Config_Size.dart';
import 'header_Widget.dart';

class RowHeader extends StatefulWidget {
  const RowHeader({Key? key}) : super(key: key);

  @override
  _RowHeaderState createState() => _RowHeaderState();
}

class _RowHeaderState extends State<RowHeader> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: ConfigSize.defaultSize! * AppSize.s7,
        child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p8, vertical: AppPadding.p6),
            child: HeaderWidget(
                path: header[index].path, text: header[index].text),
          );
        },
        itemCount: header.length,
    )
    );
  }
}


class Header {
  final String path;
  final String text;

  const Header({required this.path, required this.text});
}

List<Header> header = [
  Header(path: AssetsPath.pathLogoAll, text: StringManger.all),
  Header(path: AssetsPath.pathLogoAcer, text: StringManger.acer),
  Header(path: AssetsPath.pathLogoRazer, text: StringManger.razer),
]; //list of data of header
