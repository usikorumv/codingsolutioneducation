import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codingsolutioneducation/core/core.dart';
import 'package:codingsolutioneducation/features/codingsolutioneducation/data/data.dart';
import 'package:codingsolutioneducation/features/codingsolutioneducation/data/model/auth/user_info_response.dart';
import 'package:codingsolutioneducation/features/codingsolutioneducation/data/model/users_response.dart';
import 'package:codingsolutioneducation/features/codingsolutioneducation/domain/domain.dart';
import 'package:codingsolutioneducation/features/codingsolutioneducation/domain/usecases/auth/get_user.dart';
import 'package:codingsolutioneducation/features/codingsolutioneducation/domain/usecases/auth/post_user_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

abstract class AuthRemoteDatasource {
  Future<RegisterResponse> register(RegisterParams registerParams);

  Future<LoginResponse> login(LoginParams loginParams);

  Future<UserInfoResponse> userInfo(UserInfoParams userInfo);

  Future<UserResponse> user(UserParams userInfo);
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
      final users = FirebaseFirestore.instance.collection("users");

      final data = userInfoParams.toJson();

      final now = DateTime.now();
      final date = DateFormat('kk:mm:ss \n EEE d MMM').format(now);

      final id = FirebaseAuth.instance.currentUser!.uid;

      data.addAll(
        {
          "email": FirebaseAuth.instance.currentUser!.email,
          "date": date,
        },
      );

      await users.doc(id).set(data);

      return const UserInfoResponse(message: "User Info saved");
    } on FirebaseAuthException catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future<UserResponse> user(UserParams userParams) async {
    try {
      final users = FirebaseFirestore.instance.collection("users");

      final user = await users.doc(userParams.id).get();

      return UserResponse.fromJson(user);
    } on FirebaseAuthException catch (e) {
      throw ServerException(e.message);
    }
  }
}
