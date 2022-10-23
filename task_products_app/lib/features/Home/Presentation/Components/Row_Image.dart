import 'package:flutter/material.dart';
import 'package:task_products_app/features/Home/Presentation/Components/Custom_Continer_Image.dart';

import '../../../../core/Resours_Manger/Assets_Path.dart';
import '../../../../core/Resours_Manger/Values_Manger.dart';
import '../../../../core/Responsive_Ui/Config_Size.dart';

class RowImage extends StatelessWidget {
  const RowImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: ConfigSize.defaultSize! * AppSize.s12,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p6, vertical: AppPadding.p6),
              child: CustomContinerImage(
                image: listImage[index].path,
                width: ConfigSize.defaultSize! * AppSize.s12,
                hight: ConfigSize.defaultSize! * AppSize.s12,
                net: false,
                padding: AppPadding.p12,
              ),
            );
          },
          itemCount: listImage.length,
        ));
  }
}

class Image {
  final String path;

  const Image({required this.path});
}

List<Image> listImage = [
  Image(path: AssetsPath.pathLap1),
  Image(path: AssetsPath.pathLap2),
  Image(path: AssetsPath.pathLap3),
  Image(path: AssetsPath.pathMacbook),
]; //list of data of header
