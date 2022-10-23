import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_products_app/core/App_Method/App_Method.dart';
import 'package:task_products_app/core/Resours_Manger/String_Manger.dart';

import 'package:task_products_app/features/Home/Presentation/Components/Custom_Card.dart';
import 'package:task_products_app/features/Home/Presentation/Components/Custom_Icon_Box.dart';

import 'package:task_products_app/features/Home/Presentation/Manger/Product_Bloc.dart';
import 'package:task_products_app/features/Home/Presentation/Manger/Product_States.dart';
import '../../../../core/Resours_Manger/Assets_Path.dart';

import '../../../../core/Resours_Manger/Values_Manger.dart';
import '../../../../core/Responsive_Ui/Config_Size.dart';
import '../../../../core/Widgets/Loading_Widget.dart';
import '../../../../core/enums.dart';
import '../../../Auth/Presentation/Components/Custom_TextField.dart';
import '../../../../core/Widgets/Error_Widget.dart';
import 'Row_Header.dart';

class SearchScreenBody extends StatelessWidget {
  const SearchScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductStates>(
        buildWhen: (previous, current) =>
            previous.productsState != current.productsState, // to not load on app (not do unnecessary  rebuild)
        builder: (BuildContext context, state) {
          switch (state.productsState) {
            case RequestState.loaded:
              return Container(
                decoration: BoxDecoration(gradient: AppMethod().background()),
                child: SingleChildScrollView(
                  child: Column(children: [
                    SizedBox(
                      height: ConfigSize.defaultSize! * AppSize.s4,
                    ), //just space
                    Row(children: [
                      Container(
                        width: ConfigSize.defaultSize! * AppSize.s35,
                        height: ConfigSize.defaultSize! * AppSize.s5,
                        decoration:
                            BoxDecoration(boxShadow: AppMethod().boxShadow()),
                        child: CustomTextField(
                          hint: StringManger.search,
                          onClick: (value) {},
                          icon: const Icon(Icons.search),
                          size: AppSize.s8,
                          textInputType: TextInputType.text,
                        ),
                      ), //search field
                      CustomIconBox(path: AssetsPath.pathVector), // just icon
                    ]), // search
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppPadding.p25, vertical: AppPadding.p10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(AppSize.s10),
                        child: Image.asset(AssetsPath.pathAcerLap),
                      ),
                    ), //image
                    const RowHeader(), // headers
                    Row(
                      children: [
                        Expanded(
                          flex: AppIntValues.i1,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: AppPadding.p12,
                                    top: AppPadding.p16,
                                    bottom: AppPadding.p25),
                                child: Text(
                                  StringManger.reccomendedForYou,
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ),
                              for (int i = AppIntValues.i0;
                                  i < state.listProductEntities.length / 2;
                                  i++)
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CustomCard(
                                    image: state.listProductEntities[i].image,
                                    price: state.listProductEntities[i].price,
                                    companyName:
                                        state.listProductEntities[i].company,
                                    lapName: state.listProductEntities[i].name,
                                    productEntities: state.listProductEntities[
                                        i], // to pass this product to details screen
                                  ),
                                ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: AppIntValues.i1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              for (int i =
                                      (state.listProductEntities.length / 2)
                                          .toInt();
                                  i < state.listProductEntities.length;
                                  i++)
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CustomCard(
                                    image: state.listProductEntities[i].image,
                                    price: state.listProductEntities[i].price,
                                    companyName:
                                        state.listProductEntities[i].company,
                                    lapName: state.listProductEntities[i].name,
                                    productEntities: state.listProductEntities[
                                        i], // to pass this product to details screen
                                  ),
                                ),
                            ],
                          ),
                        )
                      ],
                    ) // display products
                    ,
                  ]),
                ),
              );
            case RequestState.loading:
              return const LoadingWidget(); // CircularProgressIndicator for waiting data
            case RequestState.error:
              return Error_Widget(
                  message: state.massegeProducts); // display message error
          }
        });
  }
}
