import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testproject/utils/constants/routes.dart';

import '../../../utils/constants/app_color.dart';
import '../../../widgets/common/common_layout.dart';
import '../../../widgets/common/common_text.dart';
import '../../../widgets/common/custom_button.dart';
import '../../../widgets/common/custom_text_form_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String name = '', email = '', password = '', reTypePassword = '';

//Asign to the form fields in Text Editing Controllers
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

//form validation 
  registration() async {
    if (password != null &&
        _nameController.text != "" &&
        _emailController.text != "" &&
        _passwordController.text != "" &&
        _confirmPasswordController.text != "") {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: AppColors.secondary,
            content: Text(
              "Registered Successfully",
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        );
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushNamed(Routes.loginScreen);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(
             SnackBar(
              backgroundColor: Colors.red.shade700,
              content: const Text(
                "Password Provided is too Weak",
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          );
        } else if (e.code == "email-already-in-use") {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red.shade700,
              content: const Text(
                "Account Already exists",
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return CommonLayout(
      backgroundImage: true,
      image: 'assets/images/sign_up.jpg',
      hedingTitle: 'Sign Up',
      body: Form(
        key: _formkey,
        child: Column(
          children: [
            SizedBox(
              height: 80.h,
            ),
            CustomTextFromField(
              controller: _nameController,
              lableText: 'Name',
              hintText: 'Enter Your Name',
              keyboardType: TextInputType.emailAddress,
            ),
            CustomTextFromField(
              controller: _emailController,
              lableText: 'Email Address',
              hintText: 'Enter Your Email Addres',
              keyboardType: TextInputType.emailAddress,
            ),
            CustomTextFromField(
              controller: _passwordController,
              lableText: 'Password',
              hintText: 'Enter Your Password',
              obsecureText: true,
            ),
            CustomTextFromField(
              controller: _confirmPasswordController,
              lableText: 'Confirm Password',
              hintText: 'Re-Enter Your Password',
              obsecureText: true,
            ),
            SizedBox(
              height: 70.h,
            ),
            //sign up button
            CustomButton(
              bordercolor: AppColors.secondary,
              borderWidth: 1.0,
              color: AppColors.secondary,
              boxShape: BoxShape.rectangle,
              buttonText: 'Sign Up',
              btnTextColor: AppColors.whiteColor,
              btnFontSize: 14.r,
              btnFontWeight: FontWeight.w500,
              onTap: () {
                if (_formkey.currentState!.validate()) {
                  setState(() {
                    name = _nameController.text;
                    email = _emailController.text;
                    password = _passwordController.text;
                    reTypePassword = _confirmPasswordController.text;
                  });
                }
                registration();
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonText(
                  text: "Already have an account? ",
                  whiteTextSize: 11.r,
                  // alignment: Alignment.topLeft
                ),
                CommonText(
                  text: 'Log In',
                  whiteTextSize: 13.r,
                  fontWeight: FontWeight.bold,
                  textColor: AppColors.secondary,
                  underLine: TextDecoration.underline,
                  underlineColor: AppColors.secondary,
                  onTap: () {
                    Navigator.of(context).pushNamed(Routes.loginScreen);
                  },
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).viewInsets.bottom,
            ),
          ],
        ),
      ),
    );
  }
}
