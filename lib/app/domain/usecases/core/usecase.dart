import 'package:astronomy/app/core/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UserCase<Return, Parameter> {
  Future<Either<Failure, Return>> call(Parameter parameter);
}

class NoParameter {}