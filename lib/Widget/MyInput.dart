import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class MyInput extends StatefulWidget {
  final String? hint;
  final Color? hintColor;
  final String? onErrorMessage;
  final bool start;
  final String? label;
  final bool isPassword;
  final Color? fillColor;
  final bool hasBoarder;
  bool isObscure;
  final TextEditingController? controller;
  final TextInputType? keyboard;
  final String? suffix;
  final Function(String value)? onSubmit;
  final Function(dynamic value)? onChange;
  MyInput(
      {super.key,
      this.onSubmit,
      this.hintColor,
      this.hasBoarder = true,
      this.fillColor,
      this.label,
      this.isPassword = false,
      this.isObscure = false,
      this.onErrorMessage,
      this.controller,
      this.start = false,
      this.hint,
      this.keyboard,
      this.onChange,
      this.suffix});

  @override
  State<MyInput> createState() => _MyInputState();
}

class _MyInputState extends State<MyInput> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: widget.onSubmit,
      controller: widget.controller,
      obscureText: widget.isObscure,
      obscuringCharacter: '*',
      decoration: _decoration,
      autofocus: widget.start,
      keyboardType: widget.keyboard,
      onChanged: (value) {
        setState(() {
          widget.onChange!(value);
        });
      },
    );
  }

  InputDecoration get _decoration => InputDecoration(
        fillColor: widget.fillColor,
        filled: widget.fillColor != null,
        errorText: widget.onErrorMessage,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: widget.suffix == '' && !widget.isPassword
            ? const SizedBox.shrink()
            : widget.isPassword
                ? IconButton(
                    onPressed: () => setState(() {
                      widget.isObscure = !widget.isObscure;
                    }),
                    icon: widget.isObscure
                        ? SvgPicture.asset(
                            'assets/images/svgs/eye.svg',
                            color: Theme.of(context).colorScheme.inversePrimary,
                          )
                        : SvgPicture.asset(
                            'assets/images/svgs/eyeoff.svg',
                            color: Theme.of(context).colorScheme.inversePrimary,
                          ),
                  )
                : SvgPicture.asset(
                    'assets/images/svgs/${widget.suffix}.svg',
                    width: 20.w,
                    height: 20.h,
                    fit: BoxFit.scaleDown,
                  ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: widget.hasBoarder
              ? BorderSide(
                  width: 1.w,
                  color: Theme.of(context).colorScheme.onSurface,
                )
              : BorderSide.none,
        ),
        isDense: true,
        label: Text(widget.label ?? ''),
        labelStyle: Theme.of(context).textTheme.labelSmall,
        hintText: widget.hint,
        hintStyle: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(color: widget.hintColor),
      );
}
