import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:codingsolution/common/constants.dart';
import 'package:codingsolution/features/codingsolution/domain/domain.dart';
import 'package:codingsolution/features/codingsolution/presentation/widgets/text_f.dart';
import 'package:codingsolution/utils/utils.dart';

import 'cubit/cubit.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  /// Controller
  final _conEmail = TextEditingController();

  final _conPassword = TextEditingController();

  /// Focus Node
  final _fnEmail = FocusNode();

  final _fnPassword = FocusNode();

  bool _isPasswordHide = true;

  /// Global key
  final _keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<LoginCubit, LoginState>(
          listener: (_, state) {
            log.d("loginState $state");
            switch (state.status) {
              case LoginStatus.loading:
                context.show();
                break;
              case LoginStatus.success:
                context.dismiss();
                state.login?.token.toString().toToastSuccess();

                TextInput.finishAutofillContext();

                break;
              case LoginStatus.failure:
                context.dismiss();
                state.message.toString().toToastError();
                break;
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: AutofillGroup(
              child: Form(
                key: _keyForm,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Welcome",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    TextF(
                      autofillHints: const [AutofillHints.email],
                      key: const Key("email"),
                      curFocusNode: _fnEmail,
                      nextFocusNode: _fnPassword,
                      textInputAction: TextInputAction.next,
                      controller: _conEmail,
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: Icon(
                        Icons.alternate_email,
                        color: Theme.of(context).textTheme.bodyText1?.color,
                      ),
                      hintText: "example@mail.com",
                      hint: "Email",
                      validator: (String? value) => value != null
                          ? (!value.isValidEmail() ? "Invalid Email" : null)
                          : null,
                    ),
                    const SizedBox(height: 20),
                    TextF(
                      autofillHints: const [AutofillHints.password],
                      key: const Key("password"),
                      curFocusNode: _fnPassword,
                      textInputAction: TextInputAction.done,
                      controller: _conPassword,
                      keyboardType: TextInputType.text,
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: Theme.of(context).textTheme.bodyText1?.color,
                      ),
                      obscureText: _isPasswordHide,
                      hintText: '••••••••••••',
                      maxLine: 1,
                      hint: "Password",
                      suffixIcon: IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: () {
                          setState(
                            () {
                              _isPasswordHide = !_isPasswordHide;
                            },
                          );
                        },
                        icon: Icon(
                          _isPasswordHide
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                      validator: (String? value) => value != null
                          ? (value.length < 3 ? "Invalid Password" : null)
                          : null,
                    ),
                    const SizedBox(height: 50),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: kPrimaryColor),
                      onPressed: () {
                        if (_keyForm.currentState?.validate() ?? false) {
                          context.read<LoginCubit>().login(
                                LoginParams(
                                  email: _conEmail.text,
                                  password: _conPassword.text,
                                ),
                              );
                        }
                      },
                      child: const SizedBox(
                        child: Center(
                          child: Text(
                            "Login",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
