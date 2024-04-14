import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helloworls/core/secrets/app_secrets.dart';
import 'package:helloworls/core/theme/theme.dart';
import 'package:helloworls/features/data/dataasources/auth_remote_data_sources.dart';
import 'package:helloworls/features/data/repositories/auth_repository.dart';
import 'package:helloworls/features/domain/usecases/user_sign_up.dart';
import 'package:helloworls/features/presentation/bloc/auth_bloc.dart';
import 'package:helloworls/features/presentation/pages/loginin_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final supabase = await Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.supabaseAnnonKey,
  );
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => AuthBloc(
          userSignUp: UserSignUp(
            AuthRepositoryImp(
              AuthRemoteDataSourceImp(
                supabase.client,
              ),
            ),
          ),
        ),
      ),
    ],
    child: const SmartCradleApp(),
  ));
}

class SmartCradleApp extends StatelessWidget {
  const SmartCradleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Cradle App',
      theme: AppTheme.darkThemeMode,
      home: const LoginInPage(),
    );
  }
}
