import 'package:codingsolutioneducation/features/codingsolutioneducation/presentation/pages/courses/courses.dart';
import 'package:codingsolutioneducation/features/codingsolutioneducation/presentation/widgets/footer.dart';

import 'package:flutter/material.dart';

class CoursesPage extends StatelessWidget {
  const CoursesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;

    return Column(
      children: const [
        Courses(),
        Footer(),
      ],
    );
  }
}
