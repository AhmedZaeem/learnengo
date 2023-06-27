import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnengo/Helpers/Nav_Helper.dart';
import 'package:learnengo/Screens/MainMenu.dart';
import 'package:learnengo/Screens/login/forgotPassword.dart';
import 'package:learnengo/Widget/MyInput.dart';
import 'package:learnengo/Widget/My_Button.dart';
import 'package:learnengo/Widget/socialMediaLogin.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Widget/MyCheckBox.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> with Nav_Helper {
  late TextEditingController passwordController;
  late TextEditingController emailController;
  setBoolData(String key, bool data) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(key, data);
    loginFirst = true;
  }

  boardingSelection() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var x = preferences.getBool('noBoarding');
    if (x != null) {
      setState(() {
        loginFirst = x;
      });
    }
  }

  bool loginFirst = false;
  String? emailError;
  String? passwordError;
  @override
  void initState() {
    super.initState();
    boardingSelection();
    setBoolData('noBoarding', true);
    passwordController = TextEditingController();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    passwordController.dispose();
    emailController.dispose();
  }

  var rememberMe = false;
  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocale = AppLocalizations.of(context)!;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsetsDirectional.only(
            start: 16.w,
            bottom: 16.h,
            end: 16.w,
            top: loginFirst ? 74.h : 50.h),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              loginFirst
                  ? const SizedBox.shrink()
                  : IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: 24.w,
                      ),
                    ),
              Center(
                child: Text(
                  appLocale.login,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              SizedBox(height: 24.h),
              Text(appLocale.emailHint),
              SizedBox(height: 12.h),
              MyInput(
                onErrorMessage: emailError,
                hint: appLocale.emailHint,
                controller: emailController,
                keyboard: TextInputType.emailAddress,
              ),
              SizedBox(height: 16.h),
              Text(appLocale.passwordHint),
              SizedBox(height: 12.h),
              MyInput(
                isPassword: true,
                isObscure: true,
                onErrorMessage: passwordError,
                controller: passwordController,
                keyboard: TextInputType.visiblePassword,
                hint: appLocale.passwordHint,
              ),
              SizedBox(height: 16.h),
              InkWell(
                onTap: () {
                  setState(() {
                    rememberMe = !rememberMe;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    MyCheckBox(checked: rememberMe),
                    SizedBox(width: 8.w),
                    Text(appLocale.rememberMe),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              My_Button(
                buttonText: appLocale.login,
                onTap: () {
                  if (emailController.text.isEmpty ||
                      !emailController.text.contains('@') ||
                      !emailController.text.contains('.')) {
                    setState(() {
                      emailError = appLocale.emailError;
                    });
                  } else {
                    emailError = null;
                  }
                  if (passwordController.text.isEmpty ||
                      passwordController.text.length < 8) {
                    setState(() {
                      passwordError = appLocale.passwordError;
                    });
                  } else {
                    passwordError = null;
                  }
                  if (passwordError == null && emailError == null) {
                    setBoolData('autoLogin', rememberMe);
                    jump(context, const MainMenu(), replace: true);
                  }
                },
              ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () => jump(context, const forgotPassword()),
                    child: Text(
                      appLocale.forgotPassword,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            letterSpacing: 1,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              const socialMediaLogin()
            ],
          ),
        ),
      ),
    );
  }
}
