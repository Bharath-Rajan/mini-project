import 'package:helloworls/core/error/exceptions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDataSource {
  Future<String> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<String> logInWithEmailPassword({
    required String email,
    required String password,
  });
}

class AuthRemoteDataSourceImp implements AuthRemoteDataSource {
  final SupabaseClient supabaseClient;

  AuthRemoteDataSourceImp(this.supabaseClient);
  @override
  Future<String> logInWithEmailPassword({
    required String email,
    required String password,
  }) {
    // TODO: implement logInWithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<String> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabaseClient.auth.signUp(
        password: password,
        email: email,
        data: {
          'name': name,
        },
      );
      if (response.user == null) {
        throw const ServerException('User is null');
      }

      return response.user!.id;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}