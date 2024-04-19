import 'package:get_it/get_it.dart';
import 'package:helloworls/core/secrets/app_secrets.dart';
import 'package:helloworls/features/auth/data/dataasources/auth_remote_data_sources.dart';
import 'package:helloworls/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:helloworls/features/auth/domain/repository/auth_repository.dart';
import 'package:helloworls/features/auth/domain/usecases/user_login.dart';
import 'package:helloworls/features/auth/domain/usecases/user_sign_up.dart';
import 'package:helloworls/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth();
  final supabase = await Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.supabaseAnnonKey,
  );
  serviceLocator.registerLazySingleton(() => supabase.client);
}

void _initAuth() {
  //DataSource
  serviceLocator
    ..registerFactory<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(
        serviceLocator(),
      ),
    )
    //Repository
    ..registerFactory<AuthRepository>(
      () => AuthRepositoryImpl(
        serviceLocator(),
      ),
    )
    //UserSignUp
    ..registerFactory(
      () => UserSignUp(
        serviceLocator(),
      ),
    )
    //UserLogIn
    ..registerFactory(
      () => UserLogIn(
        serviceLocator(),
      ),
    )
    //Bloc
    ..registerLazySingleton(
      () => AuthBloc(
        userLogIn: serviceLocator(),
        userSignUp: serviceLocator(),
      ),
    );
}
