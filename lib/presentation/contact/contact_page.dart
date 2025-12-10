import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_mobile/core/constants/string.dart';
import 'package:test_mobile/presentation/contact/bloc/contact_bloc.dart';
import 'package:test_mobile/presentation/contact/bloc/contact_event.dart';
import 'package:test_mobile/presentation/contact/bloc/contact_state.dart';
import 'package:test_mobile/widget_common/button.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  void initState() {
    super.initState();
    context.read<ContactBloc>().add(LoadContacts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.titleContactPage)),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: Button(
          text: AppStrings.logout,
          onPressed: () {
            Navigator.pushReplacementNamed(context, "/");
          },
        ),
      ),

      body: BlocBuilder<ContactBloc, ContactState>(
        builder: (context, state) {
          if (state is ContactLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is ContactLoaded) {
            if (state.contacts.isEmpty) {
              return const Center(child: Text(AppStrings.nullList));
            }

            return ListView.separated(
              padding: const EdgeInsets.only(bottom: 80),
              itemCount: state.contacts.length,
              separatorBuilder: (_, _) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final contact = state.contacts[index];

                return ListTile(
                  leading: CircleAvatar(
                    child: Text(contact.name[0]),
                  ),
                  title: Text(contact.name),
                  subtitle: Text(contact.phone),
                );
              },
            );
          }

          if (state is ContactError) {
            return Center(
              child: Text(
                state.error,
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          return const Center(child: Text(AppStrings.loadList));
        },
      ),
    );
  }
}
