import 'package:flutter/material.dart';
import 'package:task_products_app/core/App_Method/App_Method.dart';
import 'package:task_products_app/core/Resours_Manger/Color_Manger.dart';
import 'package:task_products_app/core/Resours_Manger/String_Manger.dart';
import 'package:task_products_app/core/Responsive_Ui/Config_Size.dart';
import 'package:task_products_app/core/Widgets/Custom_Button.dart';
import 'package:task_products_app/features/Auth/Presentation/Components/Custom_TextField.dart';
import '../../../../core/Resours_Manger/Values_Manger.dart';

final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

class LoginWidget extends StatelessWidget {
  LoginWidget({Key? key}) : super(key: key);

  late String name;
  late int phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ConfigSize.defaultSize! * AppSize.s45,
      width: ConfigSize.defaultSize! * AppSize.s35,
      decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s40)),
          boxShadow:AppMethod().boxShadow()),
      child: Form(
        key: globalKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p25),
          child: Column(
            children: [
              const Spacer(
                flex: AppIntValues.i2,
              ),
              Column(
                children: [
                  Text(StringManger.welcom,
                      style: Theme.of(context).textTheme.titleLarge),
                  Divider(
                    thickness: AppSize.s3, // thickness of the line
                    indent: AppSize
                        .s100, // empty space to the leading edge of divider.
                    endIndent: AppSize
                        .s100, // empty space to the trailing edge of the divider.
                    color: ColorManager
                        .primary, // The color to use when painting the line.
                    height: AppSize.s20,
                  )
                ],
              ),
              const Spacer(
                flex: AppIntValues.i2,
              ),
              PhysicalModel(
                borderRadius: BorderRadius.circular(AppSize.s25),
                color: Colors.white,
                elevation: AppSize.s5,
                shadowColor: ColorManager.grey,
                child: CustomTextField(
                  hint: StringManger.enteryourFullName,
                  onClick: (value) {
                    name = value!;
                  },
                  size: AppSize.s20,
                  textInputType: TextInputType.name,
                ),
              ),
              const Spacer(
                flex: AppIntValues.i1,
              ),
              PhysicalModel(
                borderRadius: BorderRadius.circular(AppSize.s25),
                color: Colors.white,
                elevation: AppSize.s5,
                shadowColor: ColorManager.grey,
                child: CustomTextField(
                  hint: StringManger.enteryourPhoneNumber,
                  onClick: (value) {
                    phoneNumber = int.parse(value!);
                  },
                  size: AppSize.s20,
                  textInputType: TextInputType.phone,
                ),
              ),
              const Spacer(
                flex: AppIntValues.i2,
              ),
              CustomButton(
                  raduis: AppSize.s25,
                  text: StringManger.login,
                  onSavd: () async {
                    if (globalKey.currentState!.validate()) {
                      globalKey.currentState!.save(); //save data from textfield to var.
                      await AppMethod().validateSigin(
                          context, globalKey, name, phoneNumber);
                    }
                  }),
              const Spacer(
                flex: AppIntValues.i1,
              ),
            ],
          ),
        ),
      ),
    );
  }


}
