import 'package:custom_check_box/custom_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnengo/Helpers/Nav_Helper.dart';
import 'package:learnengo/Screens/Home.dart';
import 'package:learnengo/Widget/MyInput.dart';

import '../../../Widget/My_Button.dart';

class newPassword extends StatefulWidget {
  const newPassword({super.key});

  @override
  State<newPassword> createState() => _newPasswordState();
}

class _newPasswordState extends State<newPassword> with Nav_Helper {
  late TextEditingController c1;
  late TextEditingController c2;
  bool enabled = false;
  @override
  void initState() {
    super.initState();
    c1 = TextEditingController();
    c2 = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    c1.dispose();
    c2.dispose();
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
            SizedBox(height: 24.h),
            Center(
              child: Text(
                appLocale.createNewPassword,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              appLocale.newPasswordMsg,
              textAlign: TextAlign.center,
            ),
            _buidNewPasswordInput(
              appLocale.yourPassword,
              appLocale.createNewPassword,
              c1,
              (_) {
                if (c1.text.isNotEmpty &&
                    c1.text == c2.text &&
                    c1.text.length >= 8) {
                  setState(() {
                    enabled = true;
                  });
                } else {
                  setState(() {
                    enabled = false;
                  });
                }
              },
            ),
            _buidNewPasswordInput(
              appLocale.yourPassword,
              appLocale.confirmANewPassword,
              c2,
              (_) {
                if (c1.text.isNotEmpty &&
                    c1.text == c2.text &&
                    c1.text.length >= 8) {
                  setState(() {
                    enabled = true;
                  });
                } else {
                  setState(() {
                    enabled = false;
                  });
                }
              },
            ),
            SizedBox(height: 20.h),
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
            const Spacer(),
            My_Button(
              buttonText: appLocale.continueBTNText,
              onTap: () => jump(context, const Home(), replace: true),
              enabled: enabled,
            )
          ],
        ),
      ),
    );
  }

  Widget _buidNewPasswordInput(String hint, String label,
      TextEditingController controller, Function(dynamic) onChange) {
    return Column(
      children: [
        SizedBox(height: 24.h),
        Text(
          label,
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(fontSize: 16.sp),
        ),
        SizedBox(height: 12.h),
        MyInput(
          hint: hint,
          controller: controller,
          isPassword: true,
          onChange: onChange,
          isObscure: true,
          keyboard: TextInputType.visiblePassword,
        ),
      ],
    );
  }
}
