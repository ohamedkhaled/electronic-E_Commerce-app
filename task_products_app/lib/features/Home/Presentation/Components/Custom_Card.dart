import 'package:flutter/material.dart';
import 'package:task_products_app/core/App_Method/App_Method.dart';
import 'package:task_products_app/core/Resours_Manger/Assets_Path.dart';
import 'package:task_products_app/core/Resours_Manger/Color_Manger.dart';
import 'package:task_products_app/core/Resours_Manger/Font_Manger.dart';
import 'package:task_products_app/core/Resours_Manger/Routs_Manger.dart';
import 'package:task_products_app/core/Responsive_Ui/Config_Size.dart';
import 'package:task_products_app/features/Home/Domin/Entities/Product_Entities.dart';
import '../../../../core/Resours_Manger/Values_Manger.dart';

class CustomCard extends StatefulWidget {
  final String image ;
  final String companyName;
  final String lapName;
  final String price;
  final ProductEntities productEntities ;
  const CustomCard({required this.image,required this.price,required this.companyName,required this.lapName, required this.productEntities,Key? key}) : super(key: key);

  @override
  _CustomCardState createState() => _CustomCardState(image: image,companyName: companyName,lapName: lapName,price: price , productEntities: productEntities);
}

class _CustomCardState extends State<CustomCard> {
  bool favored = false;
  final String image ;
  final String companyName;
  final String lapName;
  final String price;
  final ProductEntities productEntities ;


  _CustomCardState(
      {  required this.image, required this.companyName, required this.lapName, required this.price,required this.productEntities});

  @override
  Widget build(BuildContext context) {
    print(productEntities);
    return GestureDetector(
      onTap: (){
        Navigator.pushReplacementNamed(context, Routes.detielsRoute,arguments:productEntities);
      },
      child: Container(
          width: ConfigSize.defaultSize! * AppSize.s18,
          height: ConfigSize.defaultSize! * AppSize.s28,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(AppSize.s20)),
              boxShadow: AppMethod().boxShadow(),
              color: ColorManager.white),
          child: Stack(children: [
            Container(
                width: ConfigSize.defaultSize! * AppSize.s18,
                height: ConfigSize.defaultSize! * AppSize.s16,
                decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.all(Radius.circular(AppSize.s20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(AppSize.s0_3),
                      spreadRadius: AppSize.s5,
                      blurRadius: AppSize.s8,
                      offset: const Offset(
                          AppSize.s0, AppSize.s3), // changes position of shadow
                    )
                  ],
                  color: ColorManager.white,
                  image: DecorationImage(
                      image: NetworkImage(image),
                      scale: AppSize.s0_9),
                ),

            ), // image of product
            Positioned(
                right: AppSize.s0,
                top: AppSize.s0,
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      if (favored) {
                        favored = false;
                      } else {
                        favored = true;
                      }
                    });
                  },
                  icon: Icon(Icons.favorite,
                      color: favored ? ColorManager.error : ColorManager.grey),
                )), // favoret Icon
            Positioned(
              bottom: ConfigSize.defaultSize! * AppSize.s6,
              left: ConfigSize.defaultSize! * AppSize.s0_8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    companyName,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(
                    lapName,
                    style: Theme.of(context).textTheme.bodyLarge,
                  )
                ],
              ),
            ), // title and type of product
            Positioned(
                bottom: ConfigSize.defaultSize! * AppSize.s2_5,
                left: ConfigSize.defaultSize,
                child: Text(
                  price,
                  style:  Theme.of(context).textTheme.titleMedium ,
                )), //Price
            Positioned(
              right: AppSize.s0,
              bottom: AppSize.s0,
              child: Container(
                height: ConfigSize.defaultSize! * AppSize.s4_5,
                width: ConfigSize.defaultSize! * AppSize.s4_5,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color(0xFF1E75C5),
                        Color(0xFF5E9CD5),
                      ], // red to yellow
                    ),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(AppSize.s20),
                        bottomRight: Radius.circular(AppSize.s10))),
                child: Icon(
                  Icons.add,
                  color: ColorManager.white,
                ),
              ),
            ) // Add icon
          ])),
    );
  }
}
