import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codingsolutioneducation/core/core.dart';
import 'package:codingsolutioneducation/features/codingsolutioneducation/data/data.dart';
import 'package:codingsolutioneducation/features/codingsolutioneducation/domain/usecases/courses/get_courses.dart';
import 'package:codingsolutioneducation/features/codingsolutioneducation/domain/usecases/courses/get_enrolled_courses.dart';

abstract class CoursesRemoteDatasource {
  Future<CoursesResponse> courses(CoursesParams registerParams);

  Future<CoursesResponse> enrolledCourses(
      EnrolledCoursesParams enrolledCoursesParams);

  // TODO: Change for params
  Future<bool> addEnrolledCourse(String userId, String courseId);
}

class FirebaseCoursesRemoteDatasource implements CoursesRemoteDatasource {
  @override
  Future<CoursesResponse> courses(CoursesParams courseParams) async {
    try {
      final courses = FirebaseFirestore.instance.collection("courses");

      final querySnapshot = await courses.get();
      final data = querySnapshot.docs.map((doc) => doc.data()).toList();

      return CoursesResponse.fromJson(data);
    } catch (e, s) {
      throw ServerFailure("$e\n$s");
    }
  }

  @override
  Future<CoursesResponse> enrolledCourses(
      EnrolledCoursesParams enrolledCoursesParams) async {
    try {
      final users = FirebaseFirestore.instance.collection("users");

      final user = await users.doc(enrolledCoursesParams.id).get();

      final enrolledCoursesId = user["enrolledCoursesId"];

      if (enrolledCoursesId == null) {
        throw NoDataFailure();
      }

      final courses = FirebaseFirestore.instance.collection("courses");

      List data = [];

      for (String id in enrolledCoursesId) {
        data.add(await courses.doc(id).get());
      }

      return CoursesResponse.fromJson(data);
    } catch (e, s) {
      throw ServerFailure("$e\n$s");
    }
  }

  @override
  Future<bool> addEnrolledCourse(String userId, String courseId) async {
    try {
      final users = FirebaseFirestore.instance.collection("users");

      final userDoc = users.doc(userId);
      final user = await userDoc.get();

      // TODO: See

      await userDoc.update({
        "enrolledCoursesId": [courseId]
      });

      return true;
    } catch (e, s) {
      throw ServerFailure("$e\n$s");
    }
  }
}
