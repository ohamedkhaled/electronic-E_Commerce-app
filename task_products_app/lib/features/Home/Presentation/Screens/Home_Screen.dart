import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_products_app/core/Resours_Manger/Color_Manger.dart';
import 'package:task_products_app/core/Resours_Manger/Values_Manger.dart';
import 'package:task_products_app/core/Responsive_Ui/Config_Size.dart';
import '../../../../core/Resours_Manger/Routs_Manger.dart';
import '../../../../core/Server_Locator/Server_Locator.dart';
import '../Screens/Search_Screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currenyTab = AppIntValues.i3;
  Widget currentScreen = const SearchScreen();
  final List<Widget> Screens = const [
    //FavoriteScreen()
    //NotifcationScreen()
    //SettingScreen()
    SearchScreen()
  ]; //list of screen than will be view in navigation bar
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    ConfigSize().init(context);
    return Scaffold(
      body: PageStorage(bucket: bucket, child: currentScreen),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.home),
        onPressed: () {
          setState(() {
            currentScreen = const SearchScreen();
            currenyTab = AppIntValues.i3;
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: AppSize.s5,
        child: SizedBox(
          height: ConfigSize.defaultSize! * AppSize.s7,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    onPressed: () {
                      SharedPreferences sharedprefrence = getIt();
                      sharedprefrence
                          .clear(); // to remove all user's Data that store in local Storage
                      Navigator.popAndPushNamed(context, Routes.loginRoute);
                    },
                    minWidth: ConfigSize.defaultSize! * AppSize.s5,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: AppPadding.p6),
                      child: Icon(
                        Icons.exit_to_app,
                        color: ColorManager.grey,
                      ),
                    ),
                  ), //Login Tap
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        //Navigate to favorite Screen
                        currenyTab = AppIntValues.i0;
                      });
                    },
                    minWidth: ConfigSize.defaultSize! * AppSize.s5,
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: AppPadding.p6),
                      child: Icon(
                        Icons.favorite,
                        color: currenyTab == AppIntValues.i0
                            ? ColorManager.primary
                            : ColorManager.grey,
                      ),
                    ),
                  ), // Favorite Tap
                ],
              ), //Left Tap Bar
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        //Navigate to notification Screen
                        currenyTab = AppIntValues.i1;
                      });
                    },
                    minWidth: ConfigSize.defaultSize! * AppSize.s5,
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: AppPadding.p6),
                      child: Icon(Icons.notifications_active,
                          color: currenyTab == AppIntValues.i1
                              ? ColorManager.primary
                              : ColorManager.grey),
                    ),
                  ), //Notifcation Tap
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        //Navigate to sitting Screen
                        currenyTab = AppIntValues.i2;
                      });
                    },
                    minWidth: ConfigSize.defaultSize! * AppSize.s5,
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: AppPadding.p6),
                      child: Icon(
                        Icons.settings,
                        color: currenyTab == AppIntValues.i2
                            ? ColorManager.primary
                            : ColorManager.grey,
                      ),
                    ),
                  ), //Setting Tap
                ],
              ) //Right tap Bar
            ],
          ),
        ),
      ),
    );
  }
}
