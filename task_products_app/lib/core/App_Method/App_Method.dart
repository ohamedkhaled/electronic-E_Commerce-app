
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_products_app/core/Resours_Manger/Color_Manger.dart';
import 'package:task_products_app/core/Resours_Manger/Font_Manger.dart';
import 'package:task_products_app/core/Resours_Manger/String_Manger.dart';
import 'package:task_products_app/core/Server_Locator/Server_Locator.dart';
import '../../features/Auth/Domin/UseCases/SigIn_Uc.dart';
import '../../features/Auth/Domin/UseCases/Verify_UC.dart';
import '../Resours_Manger/Routs_Manger.dart';
import '../Resours_Manger/Values_Manger.dart';

class AppMethod {


  ToastContext({required String Message}) {
    Fluttertoast.showToast(
        msg: Message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: ColorManager.scandry,
        textColor: ColorManager.white,
        fontSize: FontSize.s16
    );
  }

  Future<void> validateSigin(BuildContext Context,
      GlobalKey<FormState> globalKey, String name, int phoneNumber) async {
    final result = await SigInUc(baseRepository: getIt()).call(
        UserParameter(phoneNumber: phoneNumber, name: name));
    result.fold((l) {
      if (l.status == 200) {
        AppMethod().ToastContext(Message: l.message);
        SharedPreferences sharedPreferences = getIt();
        sharedPreferences.setString(StringManger.phone, phoneNumber.toString());
        sharedPreferences.setString(StringManger.name,name);
        Navigator.pushReplacementNamed(Context, Routes.verfiyRoute);
      } else {
        AppMethod().ToastContext(Message: l.message);
      }
    }, (r) => AppMethod().ToastContext(Message: r.toString()));
  }




  Future<void> validateVerify(BuildContext Context,GlobalKey<FormState> globalKey, SharedPreferences sharedPreferences,
      String code) async {
    final result = await VerifyUC(baseRepository: getIt()).call(VerifyParameter(
        phoneNumber: int.parse(sharedPreferences.getString(StringManger.phone)!)
        , code: int.parse(code)));
    result.fold((l) {
      if (l.status == 200) {
        AppMethod().ToastContext(Message: l.message);
        sharedPreferences.setString(StringManger.code, code.toString());
        KeepUserLogin( KeepInLogin: true); // to save user auth.
        Navigator.pushReplacementNamed(Context, Routes.helpRoute);
      } else {
        AppMethod().ToastContext(Message: l.message);
      }
    }, (r) => AppMethod().ToastContext(Message: r.toString()));
  }

  void KeepUserLogin( {required bool KeepInLogin}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(StringManger.keepLogin, KeepInLogin);
  }
  Gradient? background() {
    return const LinearGradient(
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
      stops: [0.5, 1],
      colors: [
        Colors.white,
        Color(0xFF0062BD),
      ], // red to yellow
    );
  }

  List<BoxShadow>? boxShadow() {
    return [
      BoxShadow(
        color: Colors.grey.withOpacity(AppSize.s0_5),
        spreadRadius: AppSize.s5,
        blurRadius: AppSize.s8,
        offset: const Offset(
            AppSize.s0, AppSize.s3), // changes position of shadow
      )
    ];
  }

}
