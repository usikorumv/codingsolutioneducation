import 'package:codingsolution/common/constants.dart';
import 'package:codingsolution/features/codingsolution/data/data.dart';
import 'package:codingsolution/main.dart';
import 'package:codingsolution/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:codingsolution/features/codingsolution/domain/domain.dart';
import 'package:codingsolution/features/codingsolution/presentation/presentation.dart';
import 'package:codingsolution/utils/utils.dart';
import 'package:go_router/go_router.dart';

import 'cubit/cubit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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

            if (state is LoginLoading) {
              context.show();
            }
            if (state is LoginSuccess) {
              context.dismiss();
              state.login?.token.toString().toToastSuccess();

              TextInput.finishAutofillContext();
            }
            if (state is LoginFailure) {
              context.dismiss();
              state.message.toString().toToastError();
            }
          },
          child: SingleChildScrollView(
            padding: EdgeInsets.all(Dimens.space24),
            child: Center(
              child: AutofillGroup(
                child: Form(
                  key: _keyForm,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 600),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Text(
                          "Enrol to Course",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SpacerV(),
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
                              ? (!value.isValidEmail()
                                  ? "Email is not valid"
                                  : null)
                              : null,
                        ),
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
                              ? (value.length < 3 ? "Can\'t be empty" : null)
                              : null,
                        ),
                        SpacerV(value: Dimens.space24),
                        Button(
                          color: kPrimaryColor,
                          title: "Login",
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
                        ),
                        ButtonText(
                          title: "Go to Register Page",
                          onPressed: () {
                            /// Direct to register page
                            context.goNamed(Routes.register.name);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
