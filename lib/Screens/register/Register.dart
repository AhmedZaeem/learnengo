import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnengo/Helpers/Nav_Helper.dart';
import 'package:learnengo/Screens/welcomeAfterSignup.dart';
import 'package:learnengo/Widget/MyInput.dart';
import 'package:learnengo/Widget/My_Button.dart';
import 'package:learnengo/Widget/socialMediaLogin.dart';

class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> with Nav_Helper {
  late TextEditingController age;
  late TextEditingController name;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;
  @override
  void initState() {
    super.initState();
    age = TextEditingController();
    password = TextEditingController();
    name = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    age.dispose();
    age.dispose();
    name.dispose();
    email.dispose();
    phone.dispose();
  }

  var check = '';
  var enabled = false;
  String? errorMessage;
  int index = 0;
  var isObscure = false;
  @override
  Widget build(BuildContext context) {
    var controllers = [age, name, email, phone, password];
    AppLocalizations appLocale = AppLocalizations.of(context)!;

    var headerText = [
      appLocale.howOldAreYou,
      appLocale.whatIsYourName,
      appLocale.whatIsYourEmailAddress,
      appLocale.whatIsYourNumber,
      appLocale.createAPassword,
    ];
    var hint = [
      appLocale.age,
      appLocale.nameHint,
      appLocale.emailHint,
      appLocale.phoneNumberHint,
      appLocale.passwordHint
    ];
    var errorMsg = [
      appLocale.enterAge,
      appLocale.nameError,
      appLocale.emailError,
      appLocale.phoneError,
      appLocale.passwordError
    ];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsetsDirectional.only(
            start: 24.w, end: 24.w, top: 53.h, bottom: 34.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              IconButton(
                  onPressed: () {
                    if (index == 0) {
                      Navigator.pop(context);
                    } else {
                      setState(() {
                        index--;
                      });
                    }
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
              SizedBox(
                  width: 12
                      .w), // This is not the same width taken from the Figma file but a better one

              Container(
                width: 250.w,
                height: 12.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Theme.of(context).colorScheme.onPrimary),
                child: Container(
                  margin: EdgeInsetsDirectional.only(
                      end: (250 - (250 * (index + 1) / 5)).w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: Theme.of(context).colorScheme.primary),
                ),
              ),
            ]),
            SizedBox(height: 28.h),
            Text(
              headerText[index],
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: 20.h),
            MyInput(
              controller: controllers[index],
              keyboard: index == 0
                  ? TextInputType.number
                  : index == 2
                      ? TextInputType.emailAddress
                      : index == 3
                          ? TextInputType.phone
                          : TextInputType.name,
              suffix: check,
              hint: hint[index],
              isObscure: index == 4,
              isPassword: index == 4,
              onErrorMessage: errorMessage,
              onChange: (value) {
                if ((index == 0 && int.parse(value.toString()) > 12) ||
                    (index == 1 && value.toString().isNotEmpty) ||
                    (index == 2 &&
                        ((value.toString().contains('@') &&
                            (value.toString().contains('.'))))) ||
                    (index == 3 && value.toString().length >= 9) ||
                    (index == 4 && value.toString().length >= 8)) {
                  setState(() {
                    check = 'check';
                    enabled = true;
                    errorMessage = null;
                  });
                } else {
                  setState(() {
                    errorMessage = errorMsg[index];
                    check = '';
                    enabled = false;
                  });
                }
              },
            ),
            index != 0 ? const Spacer() : SizedBox(height: 20.h),
            My_Button(
              buttonText: appLocale.continueBTNText,
              enabled: enabled,
              onTap: !enabled
                  ? null
                  : () {
                      setState(() {
                        if (index == 4) {
                          jump(context, const welcomeAfterSignUp(),
                              replace: true);
                        } else {
                          FocusScope.of(context).nextFocus();
                          index++;
                          enabled = false;
                          check = '';
                          errorMessage = null;
                        }
                      });
                    },
            ),
            index != 0 ? const SizedBox.shrink() : const Spacer(),
            index == 0 ? const socialMediaLogin() : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
