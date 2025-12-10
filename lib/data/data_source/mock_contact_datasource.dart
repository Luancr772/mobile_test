import 'package:test_mobile/core/constants/string.dart';

import '../../domain/entities/contact.dart';

class MockContactDataSource {
  Future<List<Contact>> getContacts() async {
    await Future.delayed(Duration(milliseconds: 500));

    return [
      Contact(name: AppStrings.data1, phone: AppStrings.numberPhone1),
      Contact(name: AppStrings.data2, phone: AppStrings.numberPhone1),
      Contact(name: AppStrings.data3, phone: AppStrings.numberPhone1),
    ];
  }
}
