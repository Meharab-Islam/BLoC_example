import 'package:bloc_practice/global_bloc/cubit/toggle_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NormalTextField extends StatelessWidget {
  final double height;
  final double width;
  final Icon prefixIcon;
  final Color prefixIconColor;
  final Color textFieldBackgroundColor;
  final TextEditingController? controller;
  final ValueChanged<String>? onChangeEvent;
  final String hintText;
  final TextInputType keboardType;

  const NormalTextField({
    super.key,
    this.height = 45,
    this.width = 320,
    required this.prefixIconColor,
    required this.textFieldBackgroundColor,
    this.controller,
    this.onChangeEvent,
    required this.prefixIcon,
    required this.hintText,
    required this.keboardType,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextField(
        controller: controller,
        onChanged: onChangeEvent,
        keyboardType: keboardType,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: prefixIcon,
          prefixIconColor: prefixIconColor,
          fillColor: textFieldBackgroundColor,
          filled: true,
          contentPadding: const EdgeInsets.only(
            bottom: 2,
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

class NormalPasswordTextField extends StatelessWidget {
  final double height;
  final double width;
  final Icon prefixIcon;
  final Color prefixIconColor;
  final Color textFieldBackgroundColor;
  final TextEditingController? controller;
  final ValueChanged<String>? onChangeEvent;
  final String hintText;

  const NormalPasswordTextField({
    super.key,
    this.height = 45,
    this.width = 320,
    required this.prefixIconColor,
    required this.textFieldBackgroundColor,
    this.controller,
    this.onChangeEvent,
    required this.prefixIcon,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    var toggleObscecure = BlocProvider.of<TogglePasswordCubit>(context);
    print('build password textfield');
    return SizedBox(
      width: width,
      height: height,
      child: BlocBuilder<TogglePasswordCubit, bool>(
        builder: (context, state) {
          return TextField(
            controller: controller,
            onChanged: onChangeEvent,
            obscureText: state,
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
              hintText: hintText,
              prefixIcon: prefixIcon,
              prefixIconColor: prefixIconColor,
              fillColor: textFieldBackgroundColor,
              filled: true,
              suffixIcon: InkWell(
                onTap: () {
                  toggleObscecure.toggleState();
                },
                child: state == false
                    ? const Icon(Icons.visibility_off_outlined)
                    : const Icon(Icons.visibility_outlined),
              ),
              contentPadding: const EdgeInsets.only(
                bottom: 2,
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
            ),
          );
        },
      ),
    );
  }
}
