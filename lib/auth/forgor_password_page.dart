// ignore_for_file: prefer_const_constructors

import 'package:alma_mater/style/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future resetPassword() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());

      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(
                  'Ссылка на восстановление пароля была отправлена на ваш электронный адрес почты'),
            );
          });
    } on FirebaseAuthException catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PRIMARY_COLOR,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Введите свой электронный адрес и мы вам отправим ссылку на восстановление пароля',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Электронная почта',
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          MaterialButton(
            onPressed: resetPassword,
            color: Color.fromRGBO(255, 192, 207, 0.8),
            child: Text(
              'Восстановить пароль',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
