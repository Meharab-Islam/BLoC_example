// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers

import 'package:bloc_practice/constant/full_app_color.dart';
import 'package:bloc_practice/constant/full_app_text_style.dart';
import 'package:bloc_practice/global-widgets/full_app_textField.dart';
import 'package:bloc_practice/screens/authentication/bloc/signup_bloc/signup_validator_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Color prefixIconColor = Colors.orange;
    TextEditingController _nameController = TextEditingController();
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    TextEditingController _designationController = TextEditingController();
    var signupValidatroBlock = BlocProvider.of<SignupValidatorBloc>(context);
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     "Sign Up",
      //     style: TextStyle(
      //         fontSize: 30,
      //         fontWeight: FontWeight.w800,
      //         color: Color.fromARGB(255, 255, 255, 255)),
      //   ),
      //   backgroundColor: Colors.transparent,
      //   shadowColor: Colors.transparent,
      //   automaticallyImplyLeading: false,
      //   centerTitle: true,
      //   elevation: 0,
      // ),
      resizeToAvoidBottomInset: true,
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                // 'assets/images/authPageImage.jfif',
                'assets/images/jack3.jpg',
              ),
              fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          reverse: true,
          child: Column(children: [
            SizedBox(
              height: 200,
            ),
            NormalTextField(
                controller: _nameController,
                onChangeEvent: (value) {
                  signupValidatroBlock.add(SignUpTextChangeEvent(
                      nameValue: _nameController.text,
                      emailValue: _emailController.text,
                      passwordValue: _passwordController.text,
                      designationValue: _designationController.text));
                },
                prefixIconColor: prefixIconColor,
                textFieldBackgroundColor: texFieldWhiteFillColor,
                prefixIcon: Icon(Icons.person_outline),
                hintText: "Enter your name",
                keboardType: TextInputType.text),
            SizedBox(
              height: 10,
            ),
            NormalTextField(
                controller: _emailController,
                onChangeEvent: (value) {
                  signupValidatroBlock.add(SignUpTextChangeEvent(
                      nameValue: _nameController.text,
                      emailValue: _emailController.text,
                      passwordValue: _passwordController.text,
                      designationValue: _designationController.text));
                },
                prefixIconColor: prefixIconColor,
                textFieldBackgroundColor: texFieldWhiteFillColor,
                prefixIcon: Icon(Icons.email_outlined),
                hintText: "Enter  email address",
                keboardType: TextInputType.emailAddress),
            SizedBox(
              height: 10,
            ),
            NormalPasswordTextField(
              controller: _passwordController,
              onChangeEvent: (value) {
                signupValidatroBlock.add(SignUpTextChangeEvent(
                    nameValue: _nameController.text,
                    emailValue: _emailController.text,
                    passwordValue: _passwordController.text,
                    designationValue: _designationController.text));
              },
              prefixIconColor: prefixIconColor,
              textFieldBackgroundColor: texFieldWhiteFillColor,
              prefixIcon: Icon(Icons.password_outlined),
              hintText: "Enter password ",
            ),
            SizedBox(
              height: 10,
            ),
            NormalTextField(
                controller: _designationController,
                onChangeEvent: (value) {
                  signupValidatroBlock.add(SignUpTextChangeEvent(
                      nameValue: _nameController.text,
                      emailValue: _emailController.text,
                      passwordValue: _passwordController.text,
                      designationValue: _designationController.text));
                },
                prefixIconColor: prefixIconColor,
                textFieldBackgroundColor: texFieldWhiteFillColor,
                prefixIcon: Icon(Icons.work_outline),
                hintText: "Enter your designation",
                keboardType: TextInputType.text),
            SizedBox(
              height: 10,
            ),
            BlocBuilder<SignupValidatorBloc, SignupValidatorState>(
                builder: (context, state) {
              if (state is SignUpErrorState) {
                return Text(
                  state.errorMessage,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.red,
                      fontWeight: FontWeight.w800),
                );
              } else {
                return Container();
              }
            }),
            SizedBox(
              height: 10,
            ),
            BlocBuilder<SignupValidatorBloc, SignupValidatorState>(
                builder: (context, state) {
              return CupertinoButton(
                onPressed: (state is SignUpValidState)
                    ? () {
                        Navigator.pushNamed(context, '/');
                      }
                    : null,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
                color: authButtonColor,
                child: Text(
                  "Sign In",
                  style: buttonTextStyle,
                ),
              );
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account  ",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                Icon(
                  Icons.line_axis_sharp,
                  color: Colors.amber,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/');
                    },
                    child: Text(
                      "SignIn",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                    ))
              ],
            ),
            SizedBox(
              height: 20,
            ),
          ]),
        ),
      ),
    );
  }
}
