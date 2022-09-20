import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codingsolutioneducation/core/core.dart';
import 'package:codingsolutioneducation/features/codingsolutioneducation/data/data.dart';
import 'package:codingsolutioneducation/features/codingsolutioneducation/domain/usecases/courses/get_courses.dart';

abstract class CoursesRemoteDatasource {
  Future<CoursesResponse> courses(CoursesParams registerParams);
}

// TODO: Change Exeption to Failure
class FirebaseCoursesRemoteDatasource implements CoursesRemoteDatasource {
  @override
  Future<CoursesResponse> courses(CoursesParams registerParams) async {
    try {
      final courses = FirebaseFirestore.instance.collection("courses");

      QuerySnapshot querySnapshot = await courses.get();
      final data = querySnapshot.docs.map((doc) => doc.data()).toList();

      return CoursesResponse.fromJson(data);
    } catch (e, s) {
      throw ServerFailure("$e\n$s");
    }
  }
}

// class CodingSolutionCourseRemoteDatasourceImpl
//     implements CoursesRemoteDatasource {
//   final DioClient _client;

//   CodingSolutionCourseRemoteDatasourceImpl(this._client);

//   @override
//   Future<CoursesResponse> courses(CoursesParams coursesParams) async {
//     try {
//       final Response response;

//       if (coursesParams.showRegistered) {
//         response = await _client.getRequest(
//           "${Api.coursesRegister}/",
//           queryParameters: coursesParams.toJson(),
//         );
//       } else {
//         response = await _client.getRequest(
//           "${Api.courses}/",
//           queryParameters: coursesParams.toJson(),
//         );
//       }

//       final result = CoursesResponse.fromJson(response.data);

//       if (response.statusCode == 200) {
//         return result;
//       } else {
//         throw ServerException("Error");
//       }
//     } on ServerException catch (e) {
//       throw ServerException(e.message);
//     }
//   }

//   @override
//   Future<bool> courseRegister(RegisterCourseParams registerCourseParams) async {
//     try {
//       final response = await _client.postRequest(
//         "${Api.courses}/",
//         data: registerCourseParams.toJson(),
//       );
//       final result = RegisterResponse.fromJson(response.data);

//       if (response.statusCode == 200 || response.statusCode == 201) {
//         return true;
//       } else {
//         throw ServerException("Error");
//       }
//     } on ServerException catch (e) {
//       throw ServerException(e.message);
//     }
//   }
// }
