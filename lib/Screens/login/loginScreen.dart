import 'package:custom_check_box/custom_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnengo/Helpers/Nav_Helper.dart';
import 'package:learnengo/Screens/Home.dart';
import 'package:learnengo/Screens/login/forgotPassword.dart';
import 'package:learnengo/Widget/MyInput.dart';
import 'package:learnengo/Widget/My_Button.dart';
import 'package:learnengo/Widget/socialMediaLogin.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> with Nav_Helper {
  late TextEditingController passwordController;
  late TextEditingController emailController;
  @override
  void initState() {
    super.initState();
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
            start: 16.w, bottom: 32.h, end: 16.w, top: 50.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
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
              controller: passwordController,
              keyboard: TextInputType.visiblePassword,
              hint: appLocale.passwordHint,
            ),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 20.w,
                  height: 20.h,
                  child: CustomCheckBox(
                    borderRadius: 8.r,
                    borderWidth: 0,
                    checkBoxSize: 20.w,
                    checkedFillColor: Theme.of(context).colorScheme.primary,
                    value: rememberMe,
                    onChanged: (value) => setState(
                      () {
                        rememberMe = !rememberMe;
                      },
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                Text(appLocale.rememberMe),
              ],
            ),
            SizedBox(height: 20.h),
            My_Button(
              buttonText: appLocale.login,
              onTap: () => jump(context, const Home(), replace: true),
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
            const Spacer(),
            const socialMediaLogin()
          ],
        ),
      ),
    );
  }
}
