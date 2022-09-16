import 'package:codingsolution/features/codingsolution/domain/entities/courses/mentor.dart';
import 'package:codingsolution/features/codingsolution/presentation/pages/auth/login_page.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key, required this.mentors}) : super(key: key);

  final List<Mentor> mentors;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: mentors.length,
      itemBuilder: (_, index) => StaffMembersInfo(mentor: mentors[index]),
      separatorBuilder: (_, index) => SizedBox(height: 60),
    );
  }
}

class StaffMembersInfo extends StatelessWidget {
  const StaffMembersInfo({super.key, required this.mentor});

  final Mentor mentor;

  @override
  Widget build(BuildContext context) {
    print(mentor.imageUrl);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 60),
      child: ResponsiveWidget(
        mobile: Column(
          children: [
            CircleAvatar(
              radius: 50.w,
              backgroundImage: mentor.imageUrl != null
                  ? NetworkImage(mentor.imageUrl!)
                  : const AssetImage("assets/images/staff.png")
                      as ImageProvider,
            ),
            const SizedBox(height: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "About Staff",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 25),
                Text(
                  mentor.title ?? "Title",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  mentor.description ?? "Description",
                  style: TextStyle(
                    color: Colors.grey[400],
                  ),
                ),
              ],
            ),
          ],
        ),
        desktop: Row(
          children: [
            CircleAvatar(
              radius: 50.w,
              backgroundImage: mentor.imageUrl != null
                  ? NetworkImage(mentor.imageUrl!)
                  : const AssetImage("assets/images/staff.png")
                      as ImageProvider,
            ),
            const Spacer(),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "About Mentors",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 25),
                  Text(
                    mentor.title ?? "Title",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    mentor.description ?? "Description",
                    style: TextStyle(
                      color: Colors.grey[400],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
