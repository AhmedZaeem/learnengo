import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learnengo/Helpers/Nav_Helper.dart';
import 'package:learnengo/Screens/login/otp/otpReceive.dart';
import 'package:learnengo/Widget/MyInput.dart';
import 'package:learnengo/Widget/My_Button.dart';

class forgotPassword extends StatefulWidget {
  const forgotPassword({super.key});

  @override
  State<forgotPassword> createState() => _forgotPasswordState();
}

class _forgotPasswordState extends State<forgotPassword> with Nav_Helper {
  var enabled = false;
  String? error;
  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocale = AppLocalizations.of(context)!;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsDirectional.only(
              start: 24.w, bottom: 32.h, end: 24.w, top: 50.h),
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
              SizedBox(height: 115.h),
              Center(
                child: SvgPicture.asset(
                  'assets/images/svgs/06.svg',
                  width: 160.w,
                  height: 160.h,
                ),
              ),
              SizedBox(height: 40.h),
              Center(
                  child: Text(
                appLocale.forgotPassword,
                style: Theme.of(context).textTheme.headlineMedium,
              )),
              SizedBox(height: 8.h),
              Text(
                appLocale.enterYourEmail,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: 37.h),
              MyInput(
                keyboard: TextInputType.emailAddress,
                hint: appLocale.emailHint,
                onErrorMessage: error,
                onChange: (value) {
                  setState(() {
                    if (value.toString().contains('@') &&
                        value.toString().contains('.')) {
                      enabled = true;
                      error = null;
                    } else {
                      enabled = false;
                      error = appLocale.emailError;
                    }
                  });
                },
              ),
              SizedBox(height: 153.h),
              My_Button(
                buttonText: appLocale.continueBTNText,
                enabled: enabled,
                onTap: () => jump(context, const otpReceive()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
