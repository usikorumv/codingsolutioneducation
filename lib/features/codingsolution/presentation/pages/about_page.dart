import 'package:flutter/material.dart';

import 'package:codingsolution/features/codingsolution/presentation/widgets/footer/footer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(minHeight: size.height),
          child: Column(
            children: const [
              SizedBox(height: 60),
              StaffMembersInfo(
                imagePath: "assets/niven-shah.jpg",
                title: "I'm Sara Khan, A Salesforce Administrator",
                subTitle:
                    "I have 4 years of experience in all stages of Salesforce Administrator. I have worked on projects Including; Bayzat, Elysian Group Of Company In Dubai.I also have 2 years of experience as a mentor (Salesforce Administrator) and i have taught many students Salesforce Administration and still teaching.",
              ),
              SizedBox(height: 60),
              StaffMembersInfo(
                imagePath: "assets/nipuna-cooray.jpg",
                title:
                    "I'm Shaid. A Salesforce Consultant and Senior Salesforce",
                subTitle:
                    "I am Salesforce Consultant / Senior Salesforce with total experience of 9 years including 6-7 years with Salesforce customization, implementation using Sales Cloud, Service Cloud, Community Cloud, Salesforce Lightning Community, Salesforce Integration with other application, using Web Services.",
              ),
              SizedBox(height: 100),
            ],
          ),
        ),
        const Footer(),
      ],
    );
  }
}

class StaffMembersInfo extends StatelessWidget {
  const StaffMembersInfo(
      {super.key, this.imagePath, required this.title, required this.subTitle});

  final String? imagePath, title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          CircleAvatar(
            radius: 100.w,
            backgroundImage: AssetImage(imagePath!),
          ),
          SizedBox(height: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "About Staff",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 25),
              Text(
                title ?? "Title",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                subTitle ?? "Sub Title",
                style: TextStyle(
                  color: Colors.grey[400],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
