import 'package:auto_size_text/auto_size_text.dart';
import 'package:codingsolutioneducation/common/constants.dart';
import 'package:codingsolutioneducation/features/codingsolutioneducation/domain/usecases/auth/post_user_info.dart';

import 'package:codingsolutioneducation/features/codingsolutioneducation/presentation/pages/auth/login_page.dart';
import 'package:codingsolutioneducation/utils/utils.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'cubit/cubit/user_info_cubit.dart';

class UserInfoPage extends StatefulWidget {
  const UserInfoPage({super.key});

  @override
  State<UserInfoPage> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocListener<UserInfoCubit, UserInfoState>(
          listener: (context, state) {
            log.d("loginState $state");

            if (state is UserInfoLoading) {
              context.show();
            }
            if (state is UserInfoSuccess) {
              context.dismiss();
              state.userInfo!.message.toString().toToastSuccess();
            }
            if (state is UserInfoFailure) {
              context.dismiss();
              state.message!.toToastError();
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
                    const SizedBox(height: 30),
                    Text(
                      'codingsolutioneducation',
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
                    const UserInfoCard(),
                    const SizedBox(height: 25),
                    Text(
                      'Fill Forms',
                      style: GoogleFonts.roboto(
                          fontSize: 16,
                          letterSpacing: 1.2,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
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
                          const SizedBox(height: 30),
                          AutoSizeText(
                            'codingsolutioneducation',
                            maxLines: 1,
                            style: GoogleFonts.roboto(
                                fontSize: 55,
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
                      const UserInfoCard(),
                      const SizedBox(height: 30),
                      Text(
                        'Fill Forms',
                        style: GoogleFonts.roboto(
                            fontSize: 16,
                            letterSpacing: 1.2,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
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

class UserInfoCard extends StatefulWidget {
  const UserInfoCard({super.key});

  @override
  State<UserInfoCard> createState() => _UserInfoCardState();
}

class _UserInfoCardState extends State<UserInfoCard> {
  /// Controller
  final _conName = TextEditingController();
  final _conSurname = TextEditingController();
  final _conReferer = TextEditingController();
  final _conPhone = TextEditingController();

  /// Focus Node
  final _fnName = FocusNode();
  final _fnSuname = FocusNode();
  final _fnReferer = FocusNode();
  final _fnPhone = FocusNode();

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
        padding: const EdgeInsets.all(10.0),
        child: AutofillGroup(
          child: Form(
            key: _keyForm,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.black),
                    controller: _conName,
                    key: const Key("name"),
                    autocorrect: true,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name,
                    focusNode: _fnName,
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
                      hintText: 'Name',
                      hintStyle: const TextStyle(
                        fontSize: 16,
                        color: Colors.black45,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    validator: (String? value) => value != null
                        ? value.isEmpty
                            ? "Field cannot be form"
                            : null
                        : null,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.black),
                    controller: _conSurname,
                    key: const Key("surname"),
                    autocorrect: true,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name,
                    focusNode: _fnSuname,
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
                      hintText: 'Surname',
                      hintStyle: const TextStyle(
                        fontSize: 16,
                        color: Colors.black45,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    validator: (String? value) => value != null
                        ? value.isEmpty
                            ? "Field cannot be form"
                            : null
                        : null,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.black),
                    controller: _conReferer,
                    key: const Key("referer"),
                    autocorrect: true,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    focusNode: _fnReferer,
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
                      hintText: 'Referer',
                      hintStyle: const TextStyle(
                        fontSize: 16,
                        color: Colors.black45,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    validator: (String? value) => value != null
                        ? value.isEmpty
                            ? "Field cannot be form"
                            : null
                        : null,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.black),
                    controller: _conPhone,
                    key: const Key("phone"),
                    autocorrect: true,
                    textInputAction: TextInputAction.send,
                    keyboardType: TextInputType.phone,
                    focusNode: _fnPhone,
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
                      hintText: 'Phone',
                      hintStyle: const TextStyle(
                        fontSize: 16,
                        color: Colors.black45,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    validator: (String? value) => value != null
                        ? value.isEmpty
                            ? "Field cannot be form"
                            : null
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
                              backgroundColor: kPrimaryColor),
                          child: const SizedBox(
                            height: 50,
                            child: Center(
                              child: Text(
                                "Save",
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
                              context.read<UserInfoCubit>().userInfo(
                                    UserInfoParams(
                                      name: _conName.text,
                                      surname: _conSurname.text,
                                      referer: _conReferer.text,
                                      phone: _conPhone.text,
                                    ),
                                  );
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
