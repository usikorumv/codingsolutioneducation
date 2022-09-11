import 'package:codingsolution/features/codingsolution/domain/usecases/courses/get_courses.dart';
import 'package:codingsolution/features/codingsolution/presentation/pages/courses/course_page.dart';
import 'package:codingsolution/features/codingsolution/presentation/pages/courses/cubit/courses_cubit.dart';
import 'package:codingsolution/features/codingsolution/presentation/widgets/item_card.dart';
import 'package:codingsolution/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Courses extends StatefulWidget {
  const Courses({Key? key}) : super(key: key);

  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  @override
  void initState() {
    super.initState();

    context.read<CoursesCubit>().course(CoursesParams());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoursesCubit, CoursesState>(
      builder: (context, state) {
        if (state is CoursesLoading) {
          return Center(child: CircularProgressIndicator());
        }

        if (state is CoursesFailure) {
          return SizedBox();
        }

        if (state is CoursesSuccess) {
          return ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: state.courses!.courses.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CoursePage(),
                    ),
                  );
                },
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 100),
                  child: ItemCard(
                    data: ItemCardData(
                      imageName: state.courses!.courses[index].imageUrl,
                      title: state.courses!.courses[index].title,
                      description: 'Course for test',
                      tags: ['default'],
                      metadata1: 'AUG 19, 2021',
                      metadata2: '2 MIN READ',
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(height: 30);
            },
          );
        }

        return SizedBox();
      },
    );
  }
}
