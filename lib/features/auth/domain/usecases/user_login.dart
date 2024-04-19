import 'package:fpdart/fpdart.dart';
import 'package:helloworls/core/error/failures.dart';
import 'package:helloworls/core/usecase/usecase.dart';
import 'package:helloworls/features/auth/domain/entities/user.dart';
import 'package:helloworls/features/auth/domain/repository/auth_repository.dart';

class UserLogIn implements UseCase<User, UserLogInParams> {
  final AuthRepository authRepository;
  const UserLogIn(this.authRepository);
  @override
  Future<Either<Failure, User>> call(UserLogInParams params) async {
    return await authRepository.logInWithEmailPassword(
      email: params.email,
      password: params.password,
    );
  }
}

class UserLogInParams {
  final String email;
  final String password;

  UserLogInParams({
    required this.email,
    required this.password,
  });
}
