import 'package:dartz/dartz.dart';
import 'package:task_products_app/features/Help/Domin/Base_Repository/Base_Repository_Help.dart';
import 'package:task_products_app/features/Help/Domin/Entities/Help_Entities.dart';

import '../DataSource/Remoted_Data_Source_Help.dart';

class RepositoryImpHelp extends BaseRepositoryHelp{

final BaseRemotedDataSourceHelp baseRemotedDataSourceHelp ;


RepositoryImpHelp({required this.baseRemotedDataSourceHelp});

  @override
  Future<Either<List<HelpEntities>, Exception>> getHelp() async {
    try{
      return Left(await baseRemotedDataSourceHelp.getHelpData());
    }catch(e){
      return Right(Exception(e.toString()));
    }
  }


}