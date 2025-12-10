import 'package:test_mobile/data/data_source/mock_contact_datasource.dart';

import '../../domain/entities/contact.dart';
import '../../domain/repositories/contact_repository.dart';

class ContactRepositoryImpl implements ContactRepository {
  final MockContactDataSource dataSource;

  ContactRepositoryImpl(this.dataSource);

  @override
  Future<List<Contact>> getContacts() {
    return dataSource.getContacts();
  }
}
