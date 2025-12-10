import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_mobile/core/constants/string.dart';
import 'package:test_mobile/core/utils/validator.dart';
import 'package:test_mobile/widget_common/button.dart';
import 'package:test_mobile/widget_common/error_dialog.dart';
import 'bloc/login_bloc.dart';
import 'bloc/login_event.dart';
import 'bloc/login_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();

  bool isPasswordValid = false;
  bool showPasswordError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppStrings.login)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              Navigator.pushReplacementNamed(context, "/contacts");
            }

            if (state is LoginFailure) {
              showDialog(
                context: context,
                builder: (_) => ErrorDialog(message: state.message),
              );
            }
          },
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: usernameCtrl,
                  decoration: InputDecoration(
                    labelText: AppStrings.titleUserName,
                    hintText: AppStrings.hintPassword,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),

                const SizedBox(height: 16),
                TextField(
                  controller: passwordCtrl,
                  obscureText: !state.isPasswordVisible,
                  onChanged: (value) {
                    final valid = validate(value);

                    setState(() {
                      isPasswordValid = valid;
                      showPasswordError = value.isNotEmpty && !valid;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: AppStrings.titlePassword,
                    hintText: AppStrings.hintPassword,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        state.isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        context
                            .read<LoginBloc>()
                            .add(TogglePasswordVisibility());
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 18,
                  child: showPasswordError
                      ? const Padding(
                          padding: EdgeInsets.only(top: 4),
                          child: Text(
                            AppStrings.textValidate,
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 12,
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                ),

                const SizedBox(height: 24),

                if (state is LoginLoading)
                  const Center(child: CircularProgressIndicator())
                else
                  Button(
                    text: AppStrings.login,
                    enabled: isPasswordValid,
                    onPressed: () {
                      context.read<LoginBloc>().add(
                            LoginSubmitted(
                              username: usernameCtrl.text,
                              password: passwordCtrl.text,
                            ),
                          );
                    },
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
