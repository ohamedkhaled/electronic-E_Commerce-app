import 'package:dartz/dartz.dart';
import 'package:task_products_app/core/Base_UseCase/Base_UseCase.dart';
import 'package:task_products_app/features/Help/Domin/Base_Repository/Base_Repository_Help.dart';
import 'package:task_products_app/features/Help/Domin/Entities/Help_Entities.dart';

class GetHelpUC  extends BaseUseCase<List<HelpEntities>,NoPrameters>{

final BaseRepositoryHelp baseRepositoryHelp ;


GetHelpUC({required this.baseRepositoryHelp});

  @override
  Future<Either<List<HelpEntities>, Exception>> call(NoPrameters parameter) async {
    final result = await baseRepositoryHelp.getHelp() ;

    return result ;
  }

}