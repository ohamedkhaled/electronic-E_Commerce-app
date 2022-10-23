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
import 'header_Widget.dart';

class SearchScreenBody2 extends StatefulWidget {
  const SearchScreenBody2({Key? key}) : super(key: key);

  @override
  _SearchScreenBody2State createState() => _SearchScreenBody2State();
}

class _SearchScreenBody2State extends State<SearchScreenBody2>
    with TickerProviderStateMixin {
  int tabBarIndax = AppIntValues.i0;
  @override
  Widget build(BuildContext context) {
    TabController tabController =
        TabController(length: AppIntValues.i3, vsync: this);

    return BlocBuilder<ProductBloc, ProductStates>(
        buildWhen: (previous, current) =>
            previous.productsState !=
            current
                .productsState, // to not load on app (not do unnecessary  rebuild)
        builder: (BuildContext context, state) {
          switch (state.productsState) {
            case RequestState.loaded:
              print(tabBarIndax);
              return DefaultTabController(
                length: AppIntValues.i3,
                child: Container(
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
                        const CustomIconBox(
                            path: AssetsPath.pathVector), // just icon
                      ]), // search
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppPadding.p25,
                            vertical: AppPadding.p10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(AppSize.s10),
                          child: Image.asset(AssetsPath.pathAcerLap),
                        ),
                      ),
                      SizedBox(
                        height: ConfigSize.defaultSize! * AppSize.s6,
                        child: TabBar(
                            controller: tabController,
                            isScrollable: true,
                            indicatorColor: Colors.transparent,
                            onTap: (value) {
                              print(value);
                              setState(() {
                                tabBarIndax =
                                    value; // to handle changing in tappar
                              });
                            },
                            tabs: [
                              HeaderWidget(
                                  path: AssetsPath.pathLogoAll,
                                  text: StringManger.all,
                                  backgroundColor:
                                      tabBarIndax == AppIntValues.i0
                                          ? Colors.indigo
                                          : Colors.white,
                                  textColor: tabBarIndax == AppIntValues.i0
                                      ? Colors.white
                                      : Colors.black),
                              HeaderWidget(
                                  path: AssetsPath.pathLogoAcer,
                                  text: StringManger.acer,
                                  backgroundColor:
                                      tabBarIndax == AppIntValues.i1
                                          ? Colors.indigo
                                          : Colors.white,
                                  textColor: tabBarIndax == AppIntValues.i1
                                      ? Colors.white
                                      : Colors.black),
                              HeaderWidget(
                                  path: AssetsPath.pathLogoRazer,
                                  text: StringManger.razer,
                                  backgroundColor:
                                      tabBarIndax == AppIntValues.i2
                                          ? Colors.indigo
                                          : Colors.white,
                                  textColor: tabBarIndax == AppIntValues.i2
                                      ? Colors.white
                                      : Colors.black)
                            ]),
                      ),
                      Container(
                        width: ConfigSize.defaultSize! * AppSize.s47,
                        height: ConfigSize.defaultSize! *
                            AppSize.s28 *
                            (state.listProductEntities.length /
                                    AppIntValues.i2 +
                                AppIntValues
                                    .i1), // to handle height of screen because height screen = height card * number of card
                        child: TabBarView(
                          controller: tabController,
                          children: [
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
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge,
                                        ),
                                      ),
                                      for (int i = AppIntValues.i0;
                                          i <
                                              state.listProductEntities.length /
                                                  AppIntValues.i2;
                                          i++)
                                        Padding(
                                          padding: const EdgeInsets.all(
                                              AppPadding.p8),
                                          child: CustomCard(
                                            image: state
                                                .listProductEntities[i].image,
                                            price: state
                                                .listProductEntities[i].price,
                                            companyName: state
                                                .listProductEntities[i].company,
                                            lapName: state
                                                .listProductEntities[i].name,
                                            productEntities: state
                                                    .listProductEntities[
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
                                      for (int i = (state.listProductEntities
                                                      .length /
                                                  AppIntValues.i2)
                                              .toInt();
                                          i < state.listProductEntities.length;
                                          i++)
                                        Padding(
                                          padding: const EdgeInsets.all(
                                              AppPadding.p8),
                                          child: CustomCard(
                                            image: state
                                                .listProductEntities[i].image,
                                            price: state
                                                .listProductEntities[i].price,
                                            companyName: state
                                                .listProductEntities[i].company,
                                            lapName: state
                                                .listProductEntities[i].name,
                                            productEntities: state
                                                    .listProductEntities[
                                                i], // to pass this product to details screen
                                          ),
                                        ),
                                    ],
                                  ),
                                )
                              ],
                            ),
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
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge,
                                        ),
                                      ),
                                      for (int i = AppIntValues.i0;
                                          i <
                                              state.listProductEntities.length /
                                                  AppIntValues.i2;
                                          i++)
                                        Padding(
                                          padding: const EdgeInsets.all(
                                              AppPadding.p8),
                                          child: CustomCard(
                                            image: state
                                                .listProductEntities[i].image,
                                            price: state
                                                .listProductEntities[i].price,
                                            companyName: state
                                                .listProductEntities[i].company,
                                            lapName: state
                                                .listProductEntities[i].name,
                                            productEntities: state
                                                    .listProductEntities[
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
                                      for (int i = (state.listProductEntities
                                                      .length /
                                                  AppIntValues.i2)
                                              .toInt();
                                          i < state.listProductEntities.length;
                                          i++)
                                        Padding(
                                          padding: const EdgeInsets.all(
                                              AppPadding.p8),
                                          child: CustomCard(
                                            image: state
                                                .listProductEntities[i].image,
                                            price: state
                                                .listProductEntities[i].price,
                                            companyName: state
                                                .listProductEntities[i].company,
                                            lapName: state
                                                .listProductEntities[i].name,
                                            productEntities: state
                                                    .listProductEntities[
                                                i], // to pass this product to details screen
                                          ),
                                        ),
                                    ],
                                  ),
                                )
                              ],
                            ), // this row should handle by api  request with argument(company name)
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
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge,
                                        ),
                                      ),
                                      for (int i = AppIntValues.i0;
                                          i <
                                              state.listProductEntities.length /
                                                  AppIntValues.i2;
                                          i++)
                                        Padding(
                                          padding: const EdgeInsets.all(
                                              AppPadding.p8),
                                          child: CustomCard(
                                            image: state
                                                .listProductEntities[i].image,
                                            price: state
                                                .listProductEntities[i].price,
                                            companyName: state
                                                .listProductEntities[i].company,
                                            lapName: state
                                                .listProductEntities[i].name,
                                            productEntities: state
                                                    .listProductEntities[
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
                                      for (int i = (state.listProductEntities
                                                      .length /
                                                  AppIntValues.i2)
                                              .toInt();
                                          i < state.listProductEntities.length;
                                          i++)
                                        Padding(
                                          padding: const EdgeInsets.all(
                                              AppPadding.p8),
                                          child: CustomCard(
                                            image: state
                                                .listProductEntities[i].image,
                                            price: state
                                                .listProductEntities[i].price,
                                            companyName: state
                                                .listProductEntities[i].company,
                                            lapName: state
                                                .listProductEntities[i].name,
                                            productEntities: state
                                                    .listProductEntities[
                                                i], // to pass this product to details screen
                                          ),
                                        ),
                                    ],
                                  ),
                                )
                              ],
                            ), // this row should handle by api  request with argument(company name)
                          ],
                        ),
                      )

                      // display products
                      ,
                    ]),
                  ),
                ),
              ); // when data come
            case RequestState.loading:
              return const LoadingWidget(); // CircularProgressIndicator for waiting data
            case RequestState.error:
              return Error_Widget(
                  message: state.massegeProducts); // display message error
          }
        });
  }
}
