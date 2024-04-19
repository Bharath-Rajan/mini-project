import 'package:fpdart/fpdart.dart';
import 'package:helloworls/core/error/failures.dart';
import 'package:helloworls/features/auth/domain/entities/user.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, User>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<Failure, User>> logInWithEmailPassword({
    required String email,
    required String password,
  });
}
