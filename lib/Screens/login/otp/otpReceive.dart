import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnengo/Helpers/Nav_Helper.dart';
import 'package:learnengo/Screens/login/otp/newPassword.dart';
import 'package:learnengo/Widget/My_Button.dart';

class otpReceive extends StatefulWidget {
  const otpReceive({super.key});

  @override
  State<otpReceive> createState() => _otpReceiveState();
}

class _otpReceiveState extends State<otpReceive> with Nav_Helper {
  int counter = 60;
  late TextEditingController o1;
  late TextEditingController o2;
  late TextEditingController o3;
  late TextEditingController o4;
  late Timer _timer;
  bool enabled = false;
  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (counter == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            counter--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    o1 = TextEditingController();
    o2 = TextEditingController();
    o3 = TextEditingController();
    o4 = TextEditingController();
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    o1.dispose();
    o2.dispose();
    o3.dispose();
    o4.dispose();
    super.dispose();
  }

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
                appLocale.pleaseCheckYourEmail,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              appLocale.otpSentMsg,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
            ),
            SizedBox(height: 32.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildOTPField(o1),
                _buildOTPField(o2),
                _buildOTPField(o3),
                _buildOTPField(o4),
              ],
            ),
            SizedBox(height: 32.h),
            Center(
              child: Text(
                appLocale.didNotReceiveEmail,
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
              ),
            ),
            SizedBox(height: 8.h),
            counter != 0
                ? Center(
                    child: Text.rich(
                      TextSpan(
                        children: <InlineSpan>[
                          TextSpan(
                            text: appLocale.youCanResendCodeIn,
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall
                                ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary),
                          ),
                          TextSpan(
                            text: '$counter ',
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall
                                ?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                          ),
                          TextSpan(
                              text: appLocale.s,
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .inversePrimary)),
                        ],
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
            counter == 0
                ? Center(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          counter = 60;
                          startTimer();
                        });
                      },
                      child: Text(
                        appLocale.resendOTP,
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall
                            ?.copyWith(
                                color: Theme.of(context).colorScheme.primary),
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
            const Spacer(),
            My_Button(
              buttonText: appLocale.confirmBTNText,
              enabled: enabled,
              onTap: () => jump(context, const newPassword()),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildOTPField(TextEditingController controller) {
    return Container(
      height: 70.h,
      alignment: Alignment.center,
      width: 70.w,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.inverseSurface,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: TextField(
        controller: controller,
        textAlign: TextAlign.center,
        onChanged: (value) {
          setState(() {
            if (o1.text.isEmpty ||
                o1.text == '' ||
                o2.text.isEmpty ||
                o2.text == '' ||
                o3.text.isEmpty ||
                o3.text == '' ||
                o4.text.isEmpty ||
                o4.text == '') {
              enabled = false;
            } else {
              enabled = true;
            }
          });
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          } else {
            FocusScope.of(context).previousFocus();
            setState(() {
              enabled = false;
            });
          }
        },
        keyboardType: TextInputType.number,
        style: Theme.of(context)
            .textTheme
            .headlineMedium
            ?.copyWith(fontWeight: FontWeight.w600),
        decoration: const InputDecoration(
          focusedBorder: InputBorder.none,
          border: InputBorder.none,
        ),
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
    );
  }
}
