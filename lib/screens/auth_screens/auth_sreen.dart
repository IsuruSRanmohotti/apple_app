import 'package:apple/controllers/auth_controller.dart';
import 'package:flutter/material.dart';

import '../../components/buttons/custom_button.dart';
import 'widgets/custom_text_field.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  String type = 'signup';
  final TextEditingController _emaiController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: size.width,
              height: size.height * 0.25,
              decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25)),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/auth_banner.jpg'))),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    type == 'signup'
                        ? 'Create Account'
                        : type == 'signin'
                            ? "Sign In"
                            : 'Forgot Password',
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade800),
                  ),
                  Text(
                    type == 'signup'
                        ? 'Sign Up With Your User Account'
                        : type == 'signin'
                            ? 'Connect with your user account'
                            : 'Please enter your email for get reset mail',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade800),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    hint: 'Email',
                    prefixIcon: Icons.email,
                    controller: _emaiController,
                  ),
                  type != 'forgot'
                      ? CustomTextField(
                          hint: 'Password',
                          controller: _passwordController,
                          prefixIcon: Icons.password_rounded,
                          isPassword: true,
                        )
                      : const SizedBox(),
                  type != 'signin'
                      ? const SizedBox()
                      : Align(
                          alignment: Alignment.bottomRight,
                          child: TextButton(
                              onPressed: () {
                                setState(() {
                                  type = 'forgot';
                                });
                              },
                              child: const Text(
                                'Forgot password?',
                                style: TextStyle(color: Colors.black),
                              )),
                        ),
                  type == 'signup'
                      ? const CustomTextField(
                          hint: 'Confirm Password',
                          isPassword: true,
                          prefixIcon: Icons.password_rounded,
                        )
                      : const SizedBox(),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                      size: size,
                      text: type == 'signup'
                          ? 'Sign Up'
                          : type == 'signin'
                              ? 'Sign In'
                              : 'Send Reset Email',
                      ontap: () {
                        AuthController.createUserAccount(
                            _emaiController.text, _passwordController.text);
                      }),
                  CustomButton(
                    size: size,
                    text: type == 'signup'
                        ? 'Sign In'
                        : type == 'signin'
                            ? 'Sign Up'
                            : 'Cancel',
                    ontap: () {
                      setState(() {
                        if (type == 'signin') {
                          type = 'signup';
                        } else if (type == 'signup') {
                          type = 'signin';
                        } else {
                          type = 'signup';
                        }
                      });
                    },
                    bgColor: Colors.white,
                    fontColor: Colors.black,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
