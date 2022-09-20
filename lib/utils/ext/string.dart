import 'package:codingsolutioneducation/features/codingsolutioneducation/presentation/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

import '../helper/common.dart';

extension StringExtension on String {
  bool isValidEmail() {
    return RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
    ).hasMatch(this);
  }

  void toToastError() {
    try {
      final message = isEmpty ? "error" : this;

      //dismiss before show toast
      dismissAllToast(showAnim: true);

      showToastWidget(
        // Row(
        //   children: [
        //     Text(message),
        //     const SizedBox(width: 5),
        //     Container(
        //       height: 5,
        //       width: 5,
        //       color: Colors.redAccent,
        //     )
        //   ],
        // ),
        Toast(
          // bgColor: Palette.red,
          icon: Icons.error,
          message: message,
          textColor: Colors.white,
        ),
        dismissOtherToast: true,
        position: ToastPosition.top,
        duration: const Duration(seconds: 3),
      );
    } catch (e) {
      log.e("error $e");
    }
  }

  void toToastSuccess() {
    try {
      final message = isEmpty ? "success" : this;

      //dismiss before show toast
      dismissAllToast(showAnim: true);

      // showToast(msg)
      showToastWidget(
        // Row(
        //   children: [
        //     Text(message),
        //     const SizedBox(width: 5),
        //     Container(
        //       height: 5,
        //       width: 5,
        //       color: Colors.greenAccent,
        //     )
        //   ],
        // ),
        Toast(
          bgColor: Colors.green,
          icon: Icons.check_circle,
          message: message,
          textColor: Colors.white,
        ),
        dismissOtherToast: true,
        position: ToastPosition.top,
        duration: const Duration(seconds: 5),
      );
    } catch (e) {
      log.e("$e");
    }
  }

  void toToastLoading() {
    try {
      final message = isEmpty ? "loading" : this;
      //dismiss before show toast
      dismissAllToast(showAnim: true);

      showToastWidget(
        // Row(
        //   children: [
        //     Text(message),
        //     const SizedBox(width: 5),
        //     const CircularProgressIndicator(),
        //   ],
        // ),
        Toast(
          bgColor: Colors.black,
          icon: Icons.info,
          message: message,
          textColor: Colors.white,
        ),
        dismissOtherToast: true,
        position: ToastPosition.top,
        duration: const Duration(seconds: 3),
      );
    } catch (e) {
      log.e("$e");
    }
  }
}
