import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testproject/screen/home_screen.dart';
import 'package:testproject/widgets/common/common_layout.dart';
import 'package:testproject/widgets/common/custom_button.dart';
import 'package:testproject/widgets/common/custom_text_form_field.dart';

import '../../../utils/constants/app_color.dart';
import '../../../utils/constants/routes.dart';
import '../../../widgets/common/common_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = "", password = "";

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  userLogin() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red.shade700,
            content: const Text(
              "No User Found for that Email",
              style: TextStyle(fontSize: 15.0),
            )));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red.shade700,
            content: const Text(
              "Wrong Password Provided by User",
              style: TextStyle(fontSize: 15.0),
            )));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return CommonLayout(
      backgroundImage: true,
      image: 'assets/images/login.jpg',
      hedingTitle: 'Login',
      body: Column(
        children: [
          SizedBox(
            height: 100.h,
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
          SizedBox(
            height: 5.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CommonText(
                text: 'Forgot your ',
                whiteTextSize: 11.r,
                // alignment: Alignment.topLeft
              ),
              CommonText(
                text: 'Password?',
                whiteTextSize: 12.r,
                fontWeight: FontWeight.bold,
                textColor: AppColors.secondary,
                underLine: TextDecoration.underline,
                underlineColor: AppColors.secondary,
                onTap: () {},
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          CustomButton(
            bordercolor: AppColors.secondary,
            borderWidth: 1.0,
            color: AppColors.secondary,
            boxShape: BoxShape.rectangle,
            buttonText: 'Sign In',
            btnTextColor: AppColors.whiteColor,
            btnFontSize: 14.r,
            btnFontWeight: FontWeight.w500,
            onTap: () {
              if (_formkey.currentState!.validate()) {
                setState(() {
                  email = _emailController.text;
                  password = _passwordController.text;
                });
              }
              userLogin();
              // Navigator.of(context).pushNamed(Routes.homeScreen);
            },
          ),
          SizedBox(
            height: 25.h,
          ),
          CommonText(
            text: 'OR ',
            whiteTextSize: 15.r,
            fontWeight: FontWeight.bold,
            textColor: AppColors.secondary,
            underlineColor: AppColors.secondary,
          ),
          SizedBox(
            height: 10.h,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                child: authenticationBtn(
                    image: 'assets/images/google.png',
                    fillColor: AppColors.whiteColor,
                    authBtnText: 'Sign In With Google',
                    textColor: AppColors.primary),
                onTap: () {},
              ),
              SizedBox(
                height: 15.h,
              ),
              GestureDetector(
                child: authenticationBtn(
                    image: 'assets/images/facebook.png',
                    fillColor: AppColors.secondary,
                    authBtnText: 'Sign In With Facebook',
                    textColor: AppColors.whiteColor),
                onTap: () {},
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonText(
                text: "Don’t have an account? ",
                whiteTextSize: 11.r,
                // alignment: Alignment.topLeft
              ),
              CommonText(
                text: 'Sign Up',
                whiteTextSize: 13.r,
                fontWeight: FontWeight.bold,
                textColor: AppColors.secondary,
                underLine: TextDecoration.underline,
                underlineColor: AppColors.secondary,
                onTap: () {
                  Navigator.of(context).pushNamed(Routes.signUpScreen);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container authenticationBtn({
    Color? borderColor,
    required String image,
    required Color fillColor,
    required String authBtnText,
    required Color textColor,
  }) {
    return Container(
      height: 40.h,
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      margin: EdgeInsets.symmetric(horizontal: 50.w),
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.all(
          Radius.circular(10.r),
        ),
      ),
      child: Row(
        children: [
          Container(
            height: 35.h,
            width: 35.w,
            padding: EdgeInsets.all(10.h),
            decoration: BoxDecoration(
                // color: AppColors.whiteColor,
                border: Border.all(
                  color: borderColor ?? Colors.transparent,
                  width: 1.0,
                  style: BorderStyle.solid,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10.0),
                ),
                image: DecorationImage(
                    image: AssetImage(image),
                    alignment: Alignment.center,
                    fit: BoxFit.fill),
                shape: BoxShape.rectangle),
          ),
          SizedBox(
            width: 20.w,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              authBtnText,
              style: TextStyle(
                fontSize: 12.r,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
