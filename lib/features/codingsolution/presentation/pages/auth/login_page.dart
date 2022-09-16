import 'package:auto_size_text/auto_size_text.dart';
import 'package:codingsolution/common/constants.dart';
import 'package:codingsolution/features/codingsolution/domain/domain.dart';
import 'package:codingsolution/features/codingsolution/presentation/presentation.dart';
import 'package:codingsolution/main.dart';
import 'package:codingsolution/utils/utils.dart';
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
      body: SingleChildScrollView(
        child: BlocListener<LoginCubit, LoginState>(
          listener: (_, state) {
            log.d("loginState $state");

            if (state is LoginLoading) {
              context.show();
            }
            if (state is LoginSuccess) {
              context.dismiss();
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
          child: ResponsiveWidget(
            desktop: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/images/coding_logo.png",
                      scale: 3.25,
                    ),
                    SizedBox(height: 30),
                    Text(
                      'CODINGSOLUTION',
                      style: GoogleFonts.roboto(
                          fontSize: 60,
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'EDUCATION',
                      style: GoogleFonts.roboto(
                        letterSpacing: 5,
                        fontSize: 35,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(height: 150),
                    LoginCard(),
                    const SizedBox(height: 25),
                    Row(
                      children: [
                        Text(
                          'Log In',
                          style: GoogleFonts.roboto(
                              fontSize: 16,
                              letterSpacing: 1.2,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          ' for starting to learn',
                          style: GoogleFonts.roboto(
                            letterSpacing: 1.2,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ],
            ),
            mobile: SafeArea(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      const SizedBox(height: 90),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/images/coding_logo.png",
                            scale: 4,
                          ),
                          SizedBox(height: 30),
                          AutoSizeText(
                            'CODINGSOLUTION',
                            maxLines: 1,
                            style: GoogleFonts.roboto(
                                fontSize: 50,
                                color: kPrimaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            'EDUCATION',
                            style: GoogleFonts.roboto(
                              fontSize: 35,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      LoginCard(),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Log In',
                            style: GoogleFonts.roboto(
                                fontSize: 16,
                                letterSpacing: 1.2,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            ' for starting to learn',
                            style: GoogleFonts.roboto(
                              letterSpacing: 1.2,
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 100),
                    ],
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
        constraints: BoxConstraints(minHeight: 360),
        padding: const EdgeInsets.all(10.0),
        child: AutofillGroup(
          child: Form(
            key: _keyForm,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    style: TextStyle(color: Colors.black),
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
                      hintStyle: TextStyle(
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
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    style: TextStyle(color: Colors.black),
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
                      hintStyle: TextStyle(
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
                        ),
                      ),
                    ),
                    validator: (String? value) => value != null
                        ? (value.length < 3 ? "Can\'t be empty" : null)
                        : null,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 9.0, bottom: 15.0, left: 9.0, right: 9.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: kPrimaryColor),
                          child: SizedBox(
                            height: 50,
                            child: Center(
                              child: Text(
                                "Log In",
                                style: TextStyle(
                                  letterSpacing: 1.2,
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
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
                Divider(
                  height: 30,
                  color: Colors.grey[300],
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  margin: EdgeInsets.symmetric(horizontal: 50),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff5eb64c),
                    ),
                    child: SizedBox(
                      height: 50,
                      child: Center(
                        child: Text(
                          'Create New Account',
                          style: GoogleFonts.roboto(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    onPressed: () {
                      context.goNamed(Routes.register.name);
                    },
                  ),
                ),
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
