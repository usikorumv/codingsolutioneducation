import 'package:codingsolution/common/constants.dart';
import 'package:codingsolution/features/codingsolution/domain/domain.dart';
import 'package:codingsolution/features/codingsolution/presentation/presentation.dart';
import 'package:codingsolution/main.dart';
import 'package:codingsolution/utils/utils.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
  final _conPasswordRepeat = TextEditingController();

  /// Focus Node
  final _fnEmail = FocusNode();
  final _fnPassword = FocusNode();
  final _fnPasswordRepeat = FocusNode();

  /// Handle state visibility password
  bool _isPasswordHide = true;
  bool _isPasswordRepeatHide = true;

  /// Global key form
  final _keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<RegisterCubit, RegisterState>(
          listener: (_, state) {
            log.d("registerState $state");

            if (state is RegisterLoading) {
              context.show();
            }
            if (state is RegisterSuccess) {
              context.dismiss();
              state.register?.message.toString().toToastSuccess();

              TextInput.finishAutofillContext();

              context.goNamed(Routes.register.path);
            }
            if (state is RegisterFailure) {
              context.dismiss();
              state.message.toString().toToastError();
            }
          },
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(Dimens.space24),
                child: Form(
                  key: _keyForm,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 600),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Register your Account",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextF(
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
                          hintText: 'example@mail.com',
                          hint: "",
                          validator: (String? value) => value != null
                              ? (!value.isValidEmail() ? "" : null)
                              : null,
                        ),
                        TextF(
                          key: const Key("password"),
                          curFocusNode: _fnPassword,
                          nextFocusNode: _fnPasswordRepeat,
                          textInputAction: TextInputAction.next,
                          controller: _conPassword,
                          keyboardType: TextInputType.text,
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: Theme.of(context).textTheme.bodyText1?.color,
                          ),
                          obscureText: _isPasswordHide,
                          hintText: '••••••••••••',
                          maxLine: 1,
                          hint: "",
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
                              ? (value.length < 3 ? "" : null)
                              : null,
                        ),
                        TextF(
                          key: const Key("repeat_password"),
                          curFocusNode: _fnPasswordRepeat,
                          textInputAction: TextInputAction.done,
                          controller: _conPasswordRepeat,
                          keyboardType: TextInputType.text,
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: Theme.of(context).textTheme.bodyText1?.color,
                          ),
                          obscureText: _isPasswordRepeatHide,
                          hintText: '••••••••••••',
                          maxLine: 1,
                          hint: "",
                          suffixIcon: IconButton(
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            onPressed: () {
                              setState(
                                () {
                                  _isPasswordRepeatHide =
                                      !_isPasswordRepeatHide;
                                },
                              );
                            },
                            icon: Icon(
                              _isPasswordRepeatHide
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                          validator: (String? value) => value != null
                              ? (value != _conPassword.text ? "" : null)
                              : null,
                        ),
                        SpacerV(value: Dimens.space24),
                        Button(
                          key: const Key("btn_register"),
                          color: kPrimaryColor,
                          title: "Register",
                          onPressed: () {
                            /// Validate form first
                            if (_keyForm.currentState?.validate() ?? false) {
                              context.read<RegisterCubit>().register(
                                    CodeSolutionRegisterParams(
                                      email: _conEmail.text,
                                      password: _conPassword.text,
                                    ),
                                  );
                            }
                          },
                        ),
                        ButtonText(
                          title: "Back to Login Page",
                          onPressed: () {
                            /// Direct to register page
                            context.goNamed(Routes.login.name);
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
