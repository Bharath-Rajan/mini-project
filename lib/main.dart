import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helloworls/core/theme/theme.dart';
import 'package:helloworls/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:helloworls/features/auth/presentation/pages/loginin_page.dart';
import 'package:helloworls/init_dependencies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => serviceLocator<AuthBloc>(),
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
