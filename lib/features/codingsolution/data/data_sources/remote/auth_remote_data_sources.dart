import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codingsolution/core/core.dart';
import 'package:codingsolution/features/codingsolution/data/data.dart';
import 'package:codingsolution/features/codingsolution/data/model/auth/user_info_response.dart';
import 'package:codingsolution/features/codingsolution/domain/domain.dart';
import 'package:codingsolution/features/codingsolution/domain/usecases/auth/post_user_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

abstract class AuthRemoteDatasource {
  Future<RegisterResponse> register(RegisterParams registerParams);

  Future<LoginResponse> login(LoginParams loginParams);

  Future<UserInfoResponse> userInfo(UserInfoParams userInfo);
}

// TODO: Split this implementation with service
class FirebaseAuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  FirebaseAuthRemoteDatasourceImpl();

  @override
  Future<RegisterResponse> register(
    RegisterParams registerParams,
  ) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: registerParams.email,
        password: registerParams.password,
      );

      return const RegisterResponse(message: "Registered successful!");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw ServerException("The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        throw ServerException("The account already exists for that email.");
      }
      throw ServerException(e.message);
    }
  }

  @override
  Future<LoginResponse> login(LoginParams loginParams) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: loginParams.email,
        password: loginParams.password,
      );

      return const LoginResponse();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw ServerException('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw ServerException('Wrong password provided for that user.');
      }
      throw ServerException(e.message);
    }
  }

  @override
  Future<UserInfoResponse> userInfo(UserInfoParams userInfoParams) async {
    try {
      final users = database.collection("users");

      Map<String, dynamic> data = userInfoParams.toJson();

      DateTime now = DateTime.now();
      String date = DateFormat('kk:mm:ss \n EEE d MMM').format(now);

      String id = FirebaseAuth.instance.currentUser!.uid;

      data.addAll(
        {
          "date": date,
          "referer": "${data['name']} ${data['surname']}",
        },
      );

      await users.doc(id).set(data);

      return const UserInfoResponse(message: "User Info saved");
    } on FirebaseAuthException catch (e) {
      throw ServerException(e.message);
    }
  }

  DocumentReference get database => FirebaseFirestore.instance
      .collection('database')
      .doc("Mk7qmrqXD2p2Qre0z3MO");
}
