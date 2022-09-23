import 'package:codingsolutioneducation/features/codingsolutioneducation/domain/entities/entities.dart';
import 'package:codingsolutioneducation/features/codingsolutioneducation/domain/usecases/courses/get_enrolled_courses.dart';
import 'package:codingsolutioneducation/features/codingsolutioneducation/presentation/pages/auth/login_page.dart';
import 'package:codingsolutioneducation/features/codingsolutioneducation/presentation/pages/enrolled_courses/cubit/enrolled_courses_cubit.dart';
import 'package:codingsolutioneducation/features/codingsolutioneducation/presentation/pages/enrolled_courses/enrolled_course_page.dart';
import 'package:codingsolutioneducation/features/codingsolutioneducation/presentation/widgets/footer.dart';
import 'package:codingsolutioneducation/features/codingsolutioneducation/presentation/widgets/item_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EnrolledCoursesPage extends StatefulWidget {
  const EnrolledCoursesPage({super.key});

  @override
  State<EnrolledCoursesPage> createState() => _EnrolledCoursesPageState();
}

class _EnrolledCoursesPageState extends State<EnrolledCoursesPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Courses(),
        Footer(),
      ],
    );
  }
}

class Courses extends StatefulWidget {
  const Courses({Key? key}) : super(key: key);

  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  @override
  void initState() {
    super.initState();

    context.read<EnrolledCoursesCubit>().courses(
          EnrolledCoursesParams(FirebaseAuth.instance.currentUser!.uid),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EnrolledCoursesCubit, EnrolledCoursesState>(
      builder: (context, state) {
        if (state is EnrolledCoursesLoading) {
          return const Padding(
            padding: EdgeInsets.only(bottom: 120),
            child: CircularProgressIndicator(),
          );
        }

        if (state is EnrolledCoursesFailure) {
          return Padding(
            padding: const EdgeInsets.only(top: 50, left: 50),
            child: Column(
              children: [
                const Icon(
                  Icons.error,
                  size: 40,
                  color: Colors.grey,
                ),
                const SizedBox(height: 20),
                Text(
                  "Error: ${state.message}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
          );
        }

        if (state is EnrolledCoursesEmpty) {
          return const Padding(
            padding: EdgeInsets.only(bottom: 30),
            child: Center(
              child: Text(
                "No more courses to load",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
          );
        }

        if (state is EnrolledCoursesSuccess) {
          final data = state.courses;
          final courses = data != null ? data.courses : <Course>[];

          return ListView.separated(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 40) +
                const EdgeInsets.only(top: 40),
            itemCount: courses.length,
            itemBuilder: (BuildContext context, int index) {
              final currentCourse = courses[index];
              // final nextCourse =
              //     index + 1 != courses.length - 1 ? courses[index + 1] : null;

              return ResponsiveWidget(
                desktop: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  children: List.generate(
                    // TODO: See
                    1,
                    (index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EnrolledCoursePage(
                                course: courses[index],
                              ),
                            ),
                          );
                        },
                        child: ItemCard(
                          data: ItemCardData(
                            imageProvider: currentCourse.imageUrl != null
                                ? NetworkImage(currentCourse.imageUrl!)
                                : const AssetImage("assets/images/.png")
                                    as ImageProvider,
                            title: currentCourse.title ?? "Title",
                            description: currentCourse.metadata1 ?? "",
                            tags: ['Salesforce'],
                            metadata1: '14 SEP 2022',
                            metadata2: '',
                          ),
                        ),
                      );
                    },
                  ),
                ),
                mobile: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EnrolledCoursePage(
                          course: courses[index],
                        ),
                      ),
                    );
                  },
                  child: ItemCard(
                    data: ItemCardData(
                      imageProvider: currentCourse.imageUrl != null
                          ? NetworkImage(currentCourse.imageUrl!)
                          : const AssetImage("assets/images/staff.png")
                              as ImageProvider,
                      title: currentCourse.title ?? "Title",
                      description: currentCourse.metadata1 ?? "",
                      tags: ['Salesforce'],
                      metadata1: '14 SEP 2022',
                      metadata2: '',
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 30);
            },
          );
        }

        return const SizedBox();
      },
    );
  }
}
