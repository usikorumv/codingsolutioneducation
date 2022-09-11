import 'package:codingsolution/features/codingsolution/presentation/pages/about_page.dart';
import 'package:codingsolution/features/codingsolution/presentation/presentation.dart';
import 'package:codingsolution/main.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({super.key});

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 90),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                "Sell smarter and grow your business faster from anywere",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "With SALESFORCE 2 September MONDAY-TUESDAY-THURSDAY-SATURDAY8-11 pm east",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 40),
            Text(
              "Syllabus".toUpperCase(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 60),
              child: Column(
                children: [
                  const ListTile(
                    leading: Text(
                      "0",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    title: Text(
                      "Introduction",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            const Text(
              "Test 1",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "WEEK 1",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 20),
            Wrap(
              runSpacing: 20,
              spacing: 20,
              children: [
                const Calendar(),
                const Calendar(),
              ],
            ),
            const SizedBox(height: 50),
            Text(
              "Staff".toUpperCase(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
            const AboutPage(),
          ],
        ),
      ),
    );
  }
}

class Calendar extends StatelessWidget {
  const Calendar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 200,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey[700],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20, bottom: 10),
            child: Text(
              "Day 1",
              style: TextStyle(fontSize: 20),
            ),
          ),
          const Text(
            "# Testing",
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
