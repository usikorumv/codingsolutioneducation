import 'package:codingsolutioneducation/features/codingsolutioneducation/domain/usecases/auth/get_user.dart';
import 'package:codingsolutioneducation/features/codingsolutioneducation/presentation/pages/auth/cubit/cubit.dart';
import 'package:codingsolutioneducation/features/codingsolutioneducation/presentation/pages/profile_page/cubit/user_cubit.dart';
import 'package:codingsolutioneducation/features/codingsolutioneducation/presentation/widgets/title_and_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();

    context.read<UserCubit>().user(
          UserParams(id: FirebaseAuth.instance.currentUser!.uid),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 80, vertical: 50),
      padding: const EdgeInsets.all(50),
      alignment: Alignment.center,
      child: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (state is UserLoading) {
            return const CircularProgressIndicator();
          }

          if (state is UserFailure) {
            return const Icon(Icons.error);
          }

          if (state is UserSuccess) {
            final user = state.user!;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Profile",
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: Colors.white,
                      ),
                ),
                SizedBox(height: 20),
                Text(
                  "${user.name ?? "Name"} ${user.surname ?? "Surname"}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
                SizedBox(height: 10),
                TitleAndInfo(
                  title: "Status:",
                  // TODO: See
                  info: "Student",
                ),
                TitleAndInfo(
                  title: "Email:",
                  info: user.email,
                ),
                TitleAndInfo(
                  title: "Referer:",
                  info: user.referer!.isEmpty ? "Don`t have" : user.referer,
                ),
                TitleAndInfo(
                  title: "Phone:",
                  info: user.phone,
                ),
                TitleAndInfo(
                  title: "Created at:",
                  info: user.date,
                ),
                SizedBox(height: 50),
                Row(
                  children: [
                    Spacer(),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff5397d4),
                      ),
                      child: SizedBox(
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.logout,
                              color: Colors.white,
                            ),
                            SizedBox(width: 10),
                            Text(
                              "Log Out",
                              style: TextStyle(
                                letterSpacing: 1.2,
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      onPressed: () {
                        context.read<LoginCubit>().logout();
                      },
                    ),
                  ],
                )
              ],
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
