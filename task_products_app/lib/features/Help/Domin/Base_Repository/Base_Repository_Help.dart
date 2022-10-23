
import 'package:dartz/dartz.dart';
import 'package:task_products_app/features/Help/Domin/Entities/Help_Entities.dart';

abstract class BaseRepositoryHelp {

  Future<Either<List<HelpEntities>,Exception>> getHelp();
}