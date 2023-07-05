import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnengo/Helpers/ImagePickerHelper.dart';
import 'package:learnengo/Widget/MyInput.dart';
import 'package:learnengo/Widget/My_Button.dart';
import 'package:learnengo/Widget/buildBottomSheetChoice.dart';

import '../../temp.dart';

class profileSettings extends StatefulWidget {
  const profileSettings({super.key});

  @override
  State<profileSettings> createState() => _profileSettingsState();
}

class _profileSettingsState extends State<profileSettings>
    with ImagePickerHelper {
  late TextEditingController fullNameController;
  late TextEditingController loginName;
  late TextEditingController phoneNumber;
  late TextEditingController email;
  late TextEditingController dOB;
  @override
  void initState() {
    super.initState();
    fullNameController = TextEditingController();
    loginName = TextEditingController();
    phoneNumber = TextEditingController();
    email = TextEditingController();
    dOB = TextEditingController();
    dOB.text = '';
  }

  @override
  void dispose() {
    super.dispose();
    fullNameController.dispose();
    loginName.dispose();
    phoneNumber.dispose();
    email.dispose();
    dOB.dispose();
  }

  bool enabled = false;
  File? myImage;

  @override
  Widget build(BuildContext context) {
    final List controllers = [
      fullNameController,
      loginName,
      phoneNumber,
      email,
      dOB,
    ];
    final AppLocalizations appLocale = AppLocalizations.of(context)!;
    final List labels = [
      appLocale.fullName,
      appLocale.loginName,
      appLocale.phoneNumber,
      appLocale.emailHint,
      appLocale.dOB,
    ];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            SizedBox(height: 50.h),
            Row(
              children: [
                IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back_ios)),
                SizedBox(width: 12.w),
                Text(
                  appLocale.profile,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Align(
              alignment: Alignment.center,
              child: Stack(
                children: [
                  Container(
                    height: 100.h,
                    width: 100.h,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).scaffoldBackgroundColor),
                    child: myImage == null
                        ? CachedNetworkImage(
                            imageUrl: profile1, fit: BoxFit.cover)
                        : Image.file(myImage!, fit: BoxFit.cover),
                  ),
                  PositionedDirectional(
                    start: 55.w,
                    top: 65.h,
                    child: IconButton(
                      onPressed: () async {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 70.h, horizontal: 30.w),
                              child: Row(
                                children: [
                                  buildBottomSheetChoice(
                                      text: 'Camera',
                                      icon: Icons.camera,
                                      onTap: () async {
                                        var img =
                                            await pickImage(fromCamera: true);
                                        if (img != null) {
                                          setState(() {
                                            myImage = img;
                                          });
                                        }
                                        Navigator.pop(context);
                                      }),
                                  SizedBox(width: 32.w),
                                  buildBottomSheetChoice(
                                      text: 'Gallery',
                                      icon: Icons.photo_library,
                                      onTap: () async {
                                        var img = await pickImage();
                                        if (img != null) {
                                          setState(() {
                                            myImage = img;
                                          });
                                        }
                                        Navigator.pop(context);
                                      }),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      icon: Icon(Icons.camera_alt,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            Column(
              children: [
                Text(
                  name,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                SizedBox(height: 2.h),
                Text(
                  joinedSince,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
            Expanded(
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(labels[index]),
                        SizedBox(height: 12.h),
                        MyInput(
                          onTap: index == 4
                              ? () async {
                                  DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate:
                                          DateTime.now(), //get today's date
                                      firstDate: DateTime(1900),
                                      lastDate:
                                          DateTime(DateTime.now().year + 1));
                                  if (pickedDate != null) {
                                    dOB.text =
                                        '${pickedDate.month.toString()}/${pickedDate.day.toString()}/${pickedDate.year.toString()}';
                                  }
                                }
                              : null,
                          keyboard: index == 2
                              ? TextInputType.phone
                              : index == 3
                                  ? TextInputType.emailAddress
                                  : TextInputType.text,
                          readOnly: index == 4,
                          hint: index != 4 ? labels[index] : 'MM/DD/YY',
                          hintColor: Theme.of(context).colorScheme.onSurface,
                          controller: controllers[index],
                          onChange: (value) {
                            setState(() {
                              enabled = (fullNameController.text.isNotEmpty &&
                                  loginName.text.isNotEmpty &&
                                  phoneNumber.text.isNotEmpty &&
                                  email.text.isNotEmpty &&
                                  dOB.text.isNotEmpty);
                            });
                          },
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 24.h);
                  },
                  itemCount: 5),
            ),
            SizedBox(height: 24.h),
            My_Button(
                buttonText: appLocale.save,
                enabled: enabled,
                onTap: () => Navigator.pop(context)),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
