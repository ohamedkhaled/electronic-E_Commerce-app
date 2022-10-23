import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_products_app/core/App_Method/App_Method.dart';
import 'package:task_products_app/core/Resours_Manger/String_Manger.dart';
import 'package:task_products_app/core/Resours_Manger/Values_Manger.dart';
import 'package:task_products_app/core/Responsive_Ui/Config_Size.dart';
import 'package:task_products_app/core/Server_Locator/Server_Locator.dart';
import 'package:task_products_app/core/Widgets/Custom_Button.dart';
import 'Custom_Box.dart';

final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

class VerifyScreenBody extends StatelessWidget {
  VerifyScreenBody({Key? key}) : super(key: key);
  late String code;
  @override
  Widget build(BuildContext context) {
    SharedPreferences sharedPreferences = getIt();

    return Form(
      key: globalKey,
      child: ListView(
        children: [
          Container(
            height: ConfigSize.screenHeight,
            width: ConfigSize.screenWidth,
            decoration:BoxDecoration(
              gradient: AppMethod().background(),
            ),
            child: Column(
              children: [
                const Spacer(
                  flex: AppIntValues.i1,
                ),
                Text(
                  StringManger.verifyPhone,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const Spacer(
                  flex: AppIntValues.i3,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomBox(change: (value) {
                      if (value.length == AppIntValues.i1) {
                        code = value;
                        FocusScope.of(context).nextFocus();
                      }
                    }), //Custom Resend Box
                    CustomBox(change: (value) {
                      if (value.length == AppIntValues.i1) {
                        code = "${code}${value}";
                        FocusScope.of(context).nextFocus();
                      }
                    }), //Custom Resend Box
                    CustomBox(change: (value) {
                      if (value.length == AppIntValues.i1) {
                        code = "${code}${value}";
                        FocusScope.of(context).nextFocus();
                      }
                    }), //Custom Resend Box
                    CustomBox(change: (value) {
                      if (value.length == AppIntValues.i1) {
                        code = "${code}${value}";
                        FocusScope.of(context)
                            .nextFocus(); // move to next box by auto
                      }
                    }), //Custom Resend Box
                  ],
                ), // Row of Resend boxes
                const Spacer(
                  flex: AppIntValues.i2,
                ),
                Text(
                  StringManger.resendCode,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const Spacer(
                  flex: AppIntValues.i2,
                ),
                Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: AppPadding.p12),
                    child: CustomButton(
                        raduis: AppSize.s25,
                        text: StringManger.verify,
                        onSavd: () async {
                          if (globalKey.currentState!.validate()) {
                            globalKey.currentState!.save(); // save data from textfield to var.
                            AppMethod().validateVerify(
                                context, globalKey, sharedPreferences, code);
                          }
                        })), //button to verify
                const Spacer(
                  flex: AppIntValues.i5,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
