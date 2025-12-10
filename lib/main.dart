import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_mobile/data/data_source/mock_auth_datasource.dart';
import 'package:test_mobile/data/data_source/mock_contact_datasource.dart';
import 'package:test_mobile/presentation/contact/bloc/contact_bloc.dart';
import 'package:test_mobile/presentation/contact/contact_page.dart';
import 'package:test_mobile/presentation/login/bloc/login_bloc.dart';
import 'data/repositories/auth_repository_impl.dart';
import 'data/repositories/contact_repository_impl.dart';
import 'domain/usecases/login_usecase.dart';
import 'domain/usecases/get_contacts_usecase.dart';
import 'package:test_mobile/presentation/login/login_page.dart';

void main() {
  final authRepo = AuthRepositoryImpl(MockAuthDataSource());
  final contactRepo = ContactRepositoryImpl(MockContactDataSource());

  runApp(MyApp(
    loginUseCase: LoginUseCase(authRepo),
    getContactsUseCase: GetContactsUseCase(contactRepo),
  ));
}

class MyApp extends StatelessWidget {
  final LoginUseCase loginUseCase;
  final GetContactsUseCase getContactsUseCase;

  const MyApp({super.key, required this.loginUseCase, required this.getContactsUseCase});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LoginBloc(loginUseCase)),
        BlocProvider(create: (_) => ContactBloc(getContactsUseCase)),
      ],
      child: MaterialApp(
        routes: {
          "/": (_) => LoginPage(),
          "/contacts": (_) => ContactPage(),
        },
      ),
    );
  }
}
