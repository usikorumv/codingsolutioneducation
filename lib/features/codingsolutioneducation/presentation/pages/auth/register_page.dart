import 'package:codingsolutioneducation/features/codingsolutioneducation/domain/domain.dart';

import 'package:codingsolutioneducation/main.dart';
import 'package:codingsolutioneducation/utils/utils.dart';
import 'package:flutter/gestures.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import 'cubit/cubit.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffecf4fa),
      body: SingleChildScrollView(
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
            }
            if (state is RegisterFailure) {
              context.dismiss();
              state.message.toString().toToastError();
            }
          },
          child: Column(
            children: [
              const SizedBox(height: 150),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  RegisterCard(),
                ],
              ),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterCard extends StatefulWidget {
  const RegisterCard({super.key});

  @override
  State<RegisterCard> createState() => _RegisterCardState();
}

class _RegisterCardState extends State<RegisterCard> {
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
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 10,
      child: Container(
        width: 430,
        constraints: const BoxConstraints(minHeight: 410),
        padding: const EdgeInsets.all(10.0),
        child: AutofillGroup(
          child: Form(
            key: _keyForm,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: const Color(0xff5397d4),
                      child: Image.asset(
                        "assets/images/coding_logo.png",
                        scale: 10,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Text(
                      'Coding Solution',
                      style: GoogleFonts.roboto(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Text(
                  'Education App',
                  style: GoogleFonts.roboto(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Fill form to continue',
                  style: GoogleFonts.roboto(
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.black),
                    controller: _conEmail,
                    key: const Key("email"),
                    autocorrect: true,
                    autofillHints: const [AutofillHints.email],
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    focusNode: _fnEmail,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey[300]!,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey[300]!,
                        ),
                      ),
                      hintText: 'Email',
                      hintStyle: const TextStyle(
                        fontSize: 16,
                        color: Colors.black45,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    validator: (String? value) => value != null
                        ? (!value.isValidEmail() ? "Email is not valid" : null)
                        : null,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.black),
                    autofillHints: const [AutofillHints.password],
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.text,
                    key: const Key("password"),
                    controller: _conPassword,
                    obscureText: _isPasswordHide,
                    autocorrect: true,
                    focusNode: _fnPassword,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey[300]!,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey[300]!,
                        ),
                      ),
                      hintText: 'Password',
                      hintStyle: const TextStyle(
                        fontSize: 16,
                        color: Colors.black45,
                        fontWeight: FontWeight.bold,
                      ),
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
                          color: const Color(0xff5397d4),
                        ),
                      ),
                    ),
                    validator: (String? value) => value != null
                        ? (value.length < 3 ? "Can't be empty" : null)
                        : null,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.black),
                    autofillHints: const [AutofillHints.password],
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.text,
                    key: const Key("repeat_password"),
                    controller: _conPasswordRepeat,
                    obscureText: _isPasswordRepeatHide,
                    autocorrect: true,
                    focusNode: _fnPasswordRepeat,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey[300]!,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey[300]!,
                        ),
                      ),
                      hintText: 'Repeat password',
                      hintStyle: const TextStyle(
                        fontSize: 16,
                        color: Colors.black45,
                        fontWeight: FontWeight.bold,
                      ),
                      suffixIcon: IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: () {
                          setState(
                            () {
                              _isPasswordRepeatHide = !_isPasswordRepeatHide;
                            },
                          );
                        },
                        icon: Icon(
                          _isPasswordRepeatHide
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: const Color(0xff5397d4),
                        ),
                      ),
                    ),
                    validator: (String? value) => value != null
                        ? (value.length < 3 ? "Can't be empty" : null)
                        : null,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 9.0, bottom: 15.0, left: 9.0, right: 9.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff5397d4)),
                          child: SizedBox(
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.logout_outlined,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "Register",
                                  style: TextStyle(
                                    letterSpacing: 1.2,
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onPressed: () {
                            if (_keyForm.currentState?.validate() ?? false) {
                              context.read<RegisterCubit>().register(
                                    RegisterParams(
                                      email: _conEmail.text,
                                      password: _conPassword.text,
                                    ),
                                  );
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Back to  ",
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                      TextSpan(
                        text: "Login",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff5397d4),
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.goNamed(Routes.login.name);
                          },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
