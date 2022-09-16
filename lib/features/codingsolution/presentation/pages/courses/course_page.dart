import 'package:auto_size_text/auto_size_text.dart';
import 'package:codingsolution/features/codingsolution/domain/domain.dart';
import 'package:codingsolution/features/codingsolution/domain/entities/courses/timetable.dart';
import 'package:codingsolution/features/codingsolution/presentation/pages/about_page.dart';
import 'package:codingsolution/features/codingsolution/presentation/pages/auth/login_page.dart';
import 'package:codingsolution/features/codingsolution/presentation/widgets/footer.dart';

import 'package:flutter/material.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({super.key, required this.course});

  final Course course;

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  @override
  Widget build(BuildContext context) {
    final course = widget.course;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: ResponsiveWidget(
                desktop: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: "Coding Solution ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Education",
                                style: TextStyle(
                                  color: Colors.amber,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Home",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                mobile: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.home,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 30),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: "Coding Solution ",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: "Education",
                                  style: TextStyle(
                                    color: Colors.amber,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 90),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: AutoSizeText(
                course.metadata1 ?? "Metadata 1",
                maxLines: 2,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 55,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: AutoSizeText(
                course.metadata2 ?? "Metadata 2",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 19,
                ),
              ),
            ),
            const SizedBox(height: 40),
            Text(
              "Syllabus".toUpperCase(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 60),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  final syllable = course.syllabus?[index];
                  return ListTile(
                    leading: Text(
                      index.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    title: Text(
                      syllable ?? "Syllable",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  );
                },
                itemCount: widget.course.syllabus?.length,
              ),
            ),
            const SizedBox(height: 70),
            Builder(
              builder: (context) {
                if (course.timetable != null) {
                  return Column(
                    children: [
                      Text(
                        course.timetable!.title!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(height: 5),
                      TimetableAndSyllabuses(
                        timetable: course.timetable!,
                      ),
                      const SizedBox(height: 50),
                    ],
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            Text(
              "Mentors".toUpperCase(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
            const SizedBox(height: 10),
            AboutPage(
              mentors: course.mentors ?? [],
            ),
            const SizedBox(height: 30),
            const Footer(),
          ],
        ),
      ),
    );
  }
}

class TimetableAndSyllabuses extends StatelessWidget {
  const TimetableAndSyllabuses({super.key, required this.timetable});

  final Timetable timetable;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: timetable.syllabuses?.length ?? 0,
      itemBuilder: (context, index) {
        final syllabuses = timetable.syllabuses;

        return Column(
          children: [
            Text(
              syllabuses?[index].title ?? "Title",
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 40),
            Wrap(
              runSpacing: 20,
              spacing: 20,
              children: List.generate(syllabuses?[index].syllabus?.length ?? 0,
                  (index) {
                final syllabus = syllabuses![index].syllabus;

                return TimetableSyllabus(
                  syllabus: syllabus![index],
                );
              }),
            ),
          ],
        );
      },
      separatorBuilder: (BuildContext context, int index) =>
          const SizedBox(height: 10),
    );
  }
}

class TimetableSyllabus extends StatelessWidget {
  const TimetableSyllabus({super.key, required this.syllabus});

  final Syllabus syllabus;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      constraints: const BoxConstraints(minHeight: 250),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey[700],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 10, right: 20),
            child: Text(
              syllabus.title ?? "Title",
              style: const TextStyle(fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 20),
            child: Text(
              syllabus.descriptions != null
                  ? syllabus.descriptions!.map((e) => "# $e").join("\n")
                  : "# Description",
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
