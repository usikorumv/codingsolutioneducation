import 'package:codingsolutioneducation/features/codingsolutioneducation/domain/domain.dart';
import 'package:codingsolutioneducation/main.dart';
import 'package:codingsolutioneducation/utils/utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import 'cubit/login/login.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffecf4fa),
      body: SingleChildScrollView(
        child: BlocListener<LoginCubit, LoginState>(
          listener: (_, state) {
            log.d("loginState $state");

            if (state is LoginLoading) {
              context.show();
            }
            if (state is LoginSuccess) {
              context.dismiss();
              // TODO: See
              "Token: ${state.login?.token.toString().substring(0, 10)}..."
                  .toToastSuccess();

              TextInput.finishAutofillContext();
            }
            if (state is LoginFailure) {
              context.dismiss();

              (state.message ??
                      "No active account found with the given credentials")
                  .toToastError();
            }
          },
          child: Column(
            children: [
              const SizedBox(height: 150),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  LoginCard(),
                ],
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginCard extends StatefulWidget {
  const LoginCard({super.key});

  @override
  State<LoginCard> createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {
  final _conEmail = TextEditingController();

  final _conPassword = TextEditingController();

  /// Global key
  final _keyForm = GlobalKey<FormState>();

  /// Focus Node
  final _fnEmail = FocusNode();

  final _fnPassword = FocusNode();

  bool _isPasswordHide = true;

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
        constraints: const BoxConstraints(minHeight: 360),
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
                  'Start your journey with us',
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
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 9.0, bottom: 15.0, left: 9.0, right: 9.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff5397d4),
                          ),
                          child: SizedBox(
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.login,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "Log In",
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
                              context.read<LoginCubit>().login(
                                    LoginParams(
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
                        text: "Don`t have a account?  ",
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                      TextSpan(
                        text: "Register",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff5397d4),
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.goNamed(Routes.register.name);
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

class ResponsiveWidget extends StatelessWidget {
  final Widget? mobile;
  final Widget? desktop;

  const ResponsiveWidget({Key? key, this.mobile, this.desktop})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 950) {
          return mobile ?? const SizedBox();
        } else {
          return desktop ?? const SizedBox();
        }
      },
    );
  }
}
