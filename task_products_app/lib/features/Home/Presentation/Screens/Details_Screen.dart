import 'package:flutter/material.dart';
import 'package:task_products_app/core/Responsive_Ui/Config_Size.dart';
import 'package:task_products_app/features/Home/Domin/Entities/Product_Entities.dart';
import 'package:task_products_app/features/Home/Presentation/Components/Details_Screen_Body.dart';

class DetailsScreen extends StatelessWidget {

  final ProductEntities productEntities ;
  const DetailsScreen({ required this.productEntities, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ConfigSize().init(context);
    return  Scaffold(
      body:DetailsScreenBody( productEntities: productEntities,) ,
    );
  }
}
