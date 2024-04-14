import 'package:fpdart/fpdart.dart';
import 'package:helloworls/core/error/failures.dart';

abstract interface class UseCase<SuccessType,Params> {
  Future<Either<Failure,String>> call(Params params);
}