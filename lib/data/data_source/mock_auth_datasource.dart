import 'package:test_mobile/core/constants/string.dart';

import '../../domain/entities/user.dart';

class MockAuthDataSource {
  Future<User?> login(String username, String password) async {
    await Future.delayed(Duration(seconds: 1));

    if (username == AppStrings.admin && password == AppStrings.passWord) {
      return User(username);
    }
    return null;
  }
}
