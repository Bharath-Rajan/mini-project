// ignore: implementation_imports
import 'package:fpdart/fpdart.dart';
import 'package:helloworls/core/error/exceptions.dart';
import 'package:helloworls/core/error/failures.dart';
import 'package:helloworls/features/data/dataasources/auth_remote_data_sources.dart';
import 'package:helloworls/features/domain/repository/auth_repository.dart';

class AuthRepositoryImp implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  const AuthRepositoryImp(this.remoteDataSource);
  @override
  Future<Either<Failure, String>> logInWithEmailPassword({
    required String email,
    required String password,
  }) {
    // TODO: implement logInWithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final userId = await remoteDataSource.signUpWithEmailPassword(
        name: name,
        email: email,
        password: password,
      );
      return right(userId);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
