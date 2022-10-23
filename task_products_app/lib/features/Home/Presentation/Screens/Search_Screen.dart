import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_products_app/core/Server_Locator/Server_Locator.dart';
import 'package:task_products_app/features/Home/Presentation/Manger/Product_Bloc.dart';
import 'package:task_products_app/features/Home/Presentation/Manger/Product_Events.dart';
import '../Components/Search_Screen_Body2.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) =>
            getIt<ProductBloc>()..add(const GetProductEvent()),
        child:
            const SearchScreenBody2() // can use this wigdet SearchScreenBody()  ,
        );
  }
}
