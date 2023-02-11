// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, no_leading_underscores_for_local_identifiers

import 'package:bloc_practice/global-widgets/full_app_textField.dart';
import 'package:bloc_practice/screens/authentication/bloc/signin_bloc/sign_in_form_validator_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constant/full_app_color.dart';
import '../../constant/full_app_text_style.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    print('build signIn screen');
    var validatorBloc = BlocProvider.of<SignInFormValidatorBloc>(context);
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     "Sign In",
      //     style: TextStyle(
      //         fontSize: 30,
      //         fontWeight: FontWeight.w800,
      //         color: Color.fromARGB(255, 54, 150, 240)),
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
              // 'assets/images/signInPageImage.jfif',
              'assets/images/jack1.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          reverse: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 250,
              ),
              NormalTextField(
                hintText: 'Enter email address',
                keboardType: TextInputType.emailAddress,
                controller: _emailController,
                onChangeEvent: (value) {
                  validatorBloc.add(
                    SigninTextChangeEvent(
                        emailValue: _emailController.text,
                        passwordValue: _passwordController.text),
                  );
                },
                prefixIconColor: Color.fromARGB(255, 59, 151, 64),
                textFieldBackgroundColor: texFieldWhiteFillColor,
                prefixIcon: Icon(Icons.email_outlined),
              ),
              SizedBox(
                height: 15,
              ),
              NormalPasswordTextField(
                hintText: 'Enter password',
                controller: _passwordController,
                onChangeEvent: (value) {
                  validatorBloc.add(
                    SigninTextChangeEvent(
                        emailValue: _emailController.text,
                        passwordValue: _passwordController.text),
                  );
                },
                prefixIconColor: Color.fromARGB(255, 59, 151, 64),
                textFieldBackgroundColor: texFieldWhiteFillColor,
                prefixIcon: Icon(Icons.password_outlined),
              ),
              SizedBox(
                height: 5,
              ),
              BlocBuilder<SignInFormValidatorBloc, SignInFormValidatorState>(
                builder: (context, state) {
                  if (state is SignInFormValidatonErrorState) {
                    return Text(
                      state.errorMessage,
                      style: TextStyle(
                          color: Color.fromARGB(255, 230, 75, 64),
                          // backgroundColor: Color.fromARGB(169, 0, 0, 0),
                          fontSize: 16,
                          fontWeight: FontWeight.w800),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
              SizedBox(
                height: 15,
              ),
              BlocBuilder<SignInFormValidatorBloc, SignInFormValidatorState>(
                builder: (context, state) {
                  return CupertinoButton(
                    onPressed: (state is SignInFormValidateState)
                        ? () {
                            Navigator.pushNamed(context, '/home');
                          }
                        : null,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                    color: authButtonColor,
                    child: Text(
                      'Submit',
                      style: buttonTextStyle,
                    ),
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have any account  ",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Icon(
                    Icons.line_axis_sharp,
                    color: Colors.amber,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.popUntil(context, (route) => route.isFirst);
                        Navigator.pushReplacementNamed(context, '/sign-up');
                      },
                      child: Text(
                        "SignUp",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                        ),
                      ))
                ],
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
