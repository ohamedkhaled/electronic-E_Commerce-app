

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_products_app/core/Resours_Manger/Assets_Path.dart';
import 'package:task_products_app/core/Resours_Manger/Font_Manger.dart';
import 'package:task_products_app/core/Resours_Manger/String_Manger.dart';
import 'package:task_products_app/core/Resours_Manger/Values_Manger.dart';
import 'package:task_products_app/features/Home/Domin/Entities/Product_Entities.dart';
import 'package:task_products_app/features/Home/Presentation/Components/Custom_Continer_Image.dart';
import 'package:task_products_app/features/Home/Presentation/Components/Custom_Icon_Box.dart';
import 'package:task_products_app/features/Home/Presentation/Components/Row_Image.dart';
import 'package:task_products_app/features/Home/Presentation/Components/View_Store_Widget.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import '../../../../core/App_Method/App_Method.dart';
import '../../../../core/Resours_Manger/Color_Manger.dart';
import '../../../../core/Resours_Manger/Routs_Manger.dart';
import '../../../../core/Responsive_Ui/Config_Size.dart';
import '../../../../core/Widgets/Custom_Button.dart';



class DetailsScreenBody extends StatefulWidget {
  final ProductEntities productEntities ;
  const DetailsScreenBody({required this.productEntities , Key? key}) : super(key: key);

  @override
  _DetailsScreenBodyState createState() => _DetailsScreenBodyState(productEntities);
}

class _DetailsScreenBodyState extends State<DetailsScreenBody> with TickerProviderStateMixin {
  final ProductEntities productEntities ;


  _DetailsScreenBodyState(this.productEntities);

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: AppIntValues.i3, vsync: this);
    return   DefaultTabController(
      length: AppIntValues.i3,
      child: Container(
          decoration: BoxDecoration(gradient: AppMethod().background()),
          child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(AppPadding.p12),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: ConfigSize.defaultSize! * AppSize.s4,
                      ), //just space
                      GestureDetector(onTap: (){
                        Navigator.pushReplacementNamed(context, Routes.homeRoute); // back to home
                      } ,child: const CustomIconBox(path: AssetsPath.pathArrow)), //
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: AppPadding.p2),
                        child: Text(productEntities.name,style: Theme.of(context).textTheme.headlineSmall,),
                      ), //product name
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: AppPadding.p2),
                        child: Text(productEntities.type ,style: Theme.of(context).textTheme.bodyMedium,),
                      ), // type of product
                      CustomContinerImage( width:  ConfigSize.defaultSize! * AppSize.s37, hight:  ConfigSize.defaultSize! * AppSize.s25,
                          image:productEntities.image ,net: true , padding: AppPadding.p12), // image of product
                      const RowImage(), // more image of product but not use real image because i do not find that on api
                       ViewStoreWidget(companyName: productEntities.company, ),
                      Padding(
                        padding: const EdgeInsets.all( 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(StringManger.price2,style:Theme.of(context).textTheme.titleMedium ,),
                                Text(productEntities.price, style: Theme.of(context).textTheme.bodyLarge)
                              ],
                            ),
                            SizedBox(
                                width: ConfigSize.defaultSize!*AppSize.s20,
                                height: ConfigSize.defaultSize!*AppSize.s5,
                                child: const CustomButton( raduis: AppSize.s10,   text: StringManger.addToCard,)) // add to card
                          ],
                        ),
                      ), //add to card
                      Divider(
                        height: ConfigSize.defaultSize!*AppSize.s7_5,
                        thickness: AppSize.s1,
                        color:ColorManager.grey ,
                        indent: AppSize.s35,
                        endIndent: AppSize.s35,
                      ),
                      SizedBox(
                        height: ConfigSize.defaultSize!*AppSize.s4_8,
                        child: TabBar(
                            controller:tabController ,
                              isScrollable: true,
                              labelColor: Colors.black,
                              unselectedLabelColor: ColorManager.grey ,
                              labelStyle: const TextStyle(fontWeight: FontWeight.w400 ,fontSize: FontSize.s18),
                              indicator:   DotIndicator(
                                color: ColorManager.scandry,
                                distanceFromCenter:AppSize.s14_5,
                                radius: AppSize.s4,
                                paintingStyle: PaintingStyle.fill,
                              ),
                              tabs: const [
                                 Text(StringManger.overview ),
                                Text(StringManger.spesification ),
                                Text(StringManger.review )
                              ]  ),
                      ),

                     Container(
                       width: ConfigSize.defaultSize!*AppSize.s47,
                       height: ConfigSize.defaultSize!*AppSize.s60,
                       child: TabBarView(
                            controller: tabController,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(AppPadding.p8),
                                child: Text(productEntities.description ,style: Theme.of(context).textTheme.bodyLarge),
                              ),
                             const  Text("hare any thhing2"),
                              const Text("hare any thhing2"),

                            ],
                          ),
                     ),


                    ]),
              )
          )
      ),
    );
  }
}



