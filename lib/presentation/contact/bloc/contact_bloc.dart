import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/get_contacts_usecase.dart';
import 'contact_event.dart';
import 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  final GetContactsUseCase useCase;

  ContactBloc(this.useCase) : super(ContactInitial()) {
    on<LoadContacts>((event, emit) async {
      emit(ContactLoading());

      try {
        final contacts = await useCase();
        emit(ContactLoaded(contacts));
      } catch (_) {
        emit(ContactError("Failed to load contacts"));
      }
    });
  }
}
