import 'package:alma_mater/main.dart';
import 'package:alma_mater/style/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:profile/profile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: SafeArea(
            child: Column(
              children: [
                Profile(
                  imageUrl:
                      "https://images.unsplash.com/photo-1598618356794-eb1720430eb4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
                  name: "Дарига Ахметова",
                  website: "",
                  designation: "Беременная мама",
                  email: "cse.shamimosmanpailot@gmail.com",
                  phone_number: "01757736053",
                ),
                ElevatedButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                  },
                  child: Text('Выйти из аккаунта'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
