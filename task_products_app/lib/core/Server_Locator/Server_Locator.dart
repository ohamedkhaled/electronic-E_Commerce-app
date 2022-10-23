



import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:task_products_app/features/Auth/Domin/UseCases/SigIn_Uc.dart';
import 'package:task_products_app/features/Auth/Domin/UseCases/Verify_UC.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_products_app/features/Help/Data/DataSource/Remoted_Data_Source_Help.dart';
import 'package:task_products_app/features/Help/Data/Repository_Imp/Repository_Imp_Help.dart';
import 'package:task_products_app/features/Help/Domin/Base_Repository/Base_Repository_Help.dart';
import 'package:task_products_app/features/Help/Domin/UseCases/Get_Help_UC.dart';
import 'package:task_products_app/features/Home/Data/DataSource/Local_Data_Source.dart';
import 'package:task_products_app/features/Home/Data/DataSource/Remote_Data_Source.dart';
import 'package:task_products_app/features/Home/Data/Repository_Imp/Repository_Imp_Product.dart';
import 'package:task_products_app/features/Home/Domin/Base_Repository/Base_Repository_Product.dart';
import 'package:task_products_app/features/Home/Domin/UseCases/Get_Products_UC.dart';
import 'package:task_products_app/features/Home/Presentation/Manger/Product_Bloc.dart';
import '../../features/Auth/Data/Data_Sources/Remoted_Data_Source.dart';
import '../../features/Auth/Data/Repository_Imp/Repository_Imp.dart';
import '../../features/Auth/Domin/Base_Repository/Base_Repository.dart';
import '../../features/Help/Presentation/Manger/Help_bloc.dart';
import '../Network/Connection_Checker.dart';

final getIt = GetIt.instance;

class ServerLocator {
  Future<void> init() async {
    //bloc
    getIt.registerFactory(() => HelpBloc( getHelpUC: getIt() ));
    getIt.registerFactory(() => ProductBloc(getProductsUC: getIt()));


    //useCases
    getIt.registerLazySingleton(() => SigInUc(baseRepository: getIt()));
    getIt.registerLazySingleton(() => VerifyUC(baseRepository: getIt()));
    getIt.registerLazySingleton(() => GetHelpUC(baseRepositoryHelp: getIt()));
    getIt.registerLazySingleton(() => GetProductsUC(baseRepositoryProduct: getIt()));


    //Repository
    getIt.registerLazySingleton<BaseRepository>(() => RepositoryImp(
        baseRemotedDataSource: getIt()));
    getIt.registerLazySingleton<BaseRepositoryHelp>(() => RepositoryImpHelp(
        baseRemotedDataSourceHelp: getIt()));
    getIt.registerLazySingleton<BaseRepositoryProduct>(() => RepositoryImpProduct(
        baseRemotedDataSourceProduct: getIt(),
        baseLocalDataSource: getIt(),
        baseConnectionChecker: getIt()) );

    //DataSource
    getIt.registerLazySingleton<BaseRemotedDataSource>(() => RemotedDataSource());
    getIt.registerLazySingleton<BaseRemotedDataSourceHelp>(() => RemotedDataSourceHelp());
    getIt.registerLazySingleton<BaseRemotedDataSourceProduct>(() =>RemotedDataSourceProduct() );
    getIt.registerLazySingleton<BaseLocalDataSource>(() =>LocalDataSource(sharedPreferences: getIt()) );


    //extarnal
    final sharedPreferences = await SharedPreferences.getInstance();
    getIt.registerLazySingleton(() => sharedPreferences);
    getIt.registerLazySingleton(() => InternetConnectionChecker());

    getIt.registerLazySingleton<BaseConnectionChecker>(
            () => ConnectionChecker(connectionChecker: getIt()));

  }
}