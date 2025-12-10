import 'package:test_mobile/data/data_source/mock_auth_datasource.dart';

import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final MockAuthDataSource dataSource;

  AuthRepositoryImpl(this.dataSource);

  @override
  Future<User?> login(String username, String password) {
    return dataSource.login(username, password);
  }
}
