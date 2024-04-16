// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:helloworls/core/usecase/usecase.dart';
import 'package:fpdart/fpdart.dart';
import 'package:helloworls/core/error/failures.dart';
import 'package:helloworls/features/domain/repository/auth_repository.dart';

class UserSignUp implements UseCase<String,UserSignUpParams> {
  final AuthRepository authRepository;
  const UserSignUp(this.authRepository);
 @override
  Future<Either<Failure,String>> call(UserSignUpParams params) async {
    return await authRepository.signUpWithEmailPassword(
      name:params.name,
      email:params.email,
      password:params.password,
      );
  }
}

class UserSignUpParams {
  final String name;
  final String email;
  final String password;
  UserSignUpParams({
    required this.name,
    required this.email,
    required this.password,
  });
}
