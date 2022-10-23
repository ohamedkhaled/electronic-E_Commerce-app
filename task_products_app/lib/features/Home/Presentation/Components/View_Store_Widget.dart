import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_products_app/core/App_Method/App_Method.dart';
import 'package:task_products_app/core/Resours_Manger/Assets_Path.dart';
import 'package:task_products_app/core/Resours_Manger/Color_Manger.dart';
import 'package:task_products_app/core/Resours_Manger/String_Manger.dart';
import 'package:task_products_app/core/Resours_Manger/Values_Manger.dart';
import 'package:task_products_app/core/Responsive_Ui/Config_Size.dart';
import 'package:task_products_app/features/Home/Presentation/Components/Custom_Continer_Image.dart';

class ViewStoreWidget extends StatelessWidget {
  final String companyName ;

  const ViewStoreWidget({required this.companyName, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p8),
      child: Container(
        width: ConfigSize.defaultSize! * AppSize.s37,
        height: ConfigSize.defaultSize! * AppSize.s7,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s10)),
          boxShadow: AppMethod().boxShadow(),
          color: ColorManager.white,
        ),
        child: Row(children: [
          CustomContinerImage(
            width: ConfigSize.defaultSize! * AppSize.s6,
            hight: ConfigSize.defaultSize! * AppSize.s6,
            image: AssetsPath.pathLogo,
            net: false,
            raduis: AppSize.s10,
            padding: AppPadding.p0,
          ), //Logo of company
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$companyName Official Store",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                StringManger.viewStore,
                style: Theme.of(context).textTheme.titleMedium,
              )
            ],
          ), // details of company
          const Spacer(
            flex: AppIntValues.i3,
          ), //just space
          Container(
            width: ConfigSize.defaultSize! * AppSize.s4,
            height: ConfigSize.defaultSize! * AppSize.s4,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(AppSize.s6)),
              boxShadow: AppMethod().boxShadow(),
              color: ColorManager.white,
            ),
            child: Icon(
              Icons.arrow_forward_ios,
              color: ColorManager.scandry,
              size: ConfigSize.defaultSize! * AppSize.s2_5,
            ),
          ), //arrow right
          const Spacer(
            flex: AppIntValues.i1,
          ),
        ]),
      ),
    );
  }
}
