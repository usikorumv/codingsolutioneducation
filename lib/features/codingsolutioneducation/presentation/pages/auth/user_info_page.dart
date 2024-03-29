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
      backgroundColor: const Color(0xffecf4fa),
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
          child: Column(
            children: [
              const SizedBox(height: 150),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  UserInfoCard(),
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
                const SizedBox(height: 15),
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
                            : value.isValidPhone()
                                ? null
                                : "Phone is not valid"
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
                                      name: _conName.text.trim(),
                                      surname: _conSurname.text.trim(),
                                      // TODO: See
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
                const SizedBox(height: 10),
                Text(
                  "Fill forms to finish Registration",
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
