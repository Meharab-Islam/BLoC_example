// ignore_for_file: prefer_const_constructors

import 'package:bloc_practice/api/cubit/api_handel_cubit.dart';
import 'package:bloc_practice/constant/routing.dart';
import 'package:bloc_practice/global_bloc/cubit/toggle_password_cubit.dart';
import 'package:bloc_practice/screens/authentication/bloc/signin_bloc/sign_in_form_validator_bloc.dart';
import 'package:bloc_practice/screens/authentication/bloc/signup_bloc/signup_validator_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() {
  runApp( MultiBlocProvider(
    providers: [
       BlocProvider<SignInFormValidatorBloc>(
      create: (BuildContext context) => SignInFormValidatorBloc(),
    ),
       BlocProvider<TogglePasswordCubit>(
      create: (BuildContext context) => TogglePasswordCubit(),
    ),
       BlocProvider<SignupValidatorBloc>(
      create: (BuildContext context) => SignupValidatorBloc(),
    ),
       BlocProvider<ApiHandelCubit>(
      create: (BuildContext context) => ApiHandelCubit(),
    ),
    
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.indigo,
          fontFamily: 'GentiumBookPlus'),
      onGenerateRoute: Routes.onGeneratedRoute,
      initialRoute: '/',
    );
  }
}
