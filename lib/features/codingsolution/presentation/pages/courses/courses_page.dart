import 'package:codingsolution/features/codingsolution/presentation/pages/courses/courses.dart';
import 'package:flutter/material.dart';

import '../../widgets/footer/footer.dart';

class CoursesPage extends StatelessWidget {
  const CoursesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Courses(),
        Footer(),
      ],
    );
  }
}
