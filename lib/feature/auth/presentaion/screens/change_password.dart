import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydleap/core/app_icons.dart';
import 'package:rydleap/core/app_imagese.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/global_widgets/custom_background.dart';
import 'package:rydleap/core/global_widgets/custom_blur_button.dart';
import 'package:rydleap/core/global_widgets/custom_gradient_button.dart';
import 'package:rydleap/core/global_widgets/custom_textfield.dart';
import 'package:rydleap/feature/auth/presentaion/screens/login_screen.dart';
import 'package:rydleap/feature/profile/dummy_data/about_model.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  TextEditingController _currentPasswordController = TextEditingController();
  TextEditingController _newPasswordController = TextEditingController(text: "12345678@");
  TextEditingController _confirmPasswordController = TextEditingController(text: "12345678@");
  bool checkPass = false;

  bool isConditionMet = false;

  bool containsNumber(String password) {
    return password.contains(RegExp(r'\d'));
  }

  bool containsSpecialCharacter(String password) {
    return password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  }

  List<String> passwordCondition = [
    "At least 8 characters",
    "Includes a number",
    "Includes a special character",
  ];

  bool get isPasswordStrong {
    String password = _newPasswordController.text;
    return password.length >= 8 &&
        containsNumber(password) &&
        containsSpecialCharacter(password);
  }

  bool get isPasswordMatch {
    return _newPasswordController.text == _confirmPasswordController.text &&
        _newPasswordController.text.isNotEmpty;
  }

  String get passwordStrengthMessage {
    if (isPasswordMatch && isPasswordStrong) {
      return "Strong";
    } else if (isPasswordMatch && !isPasswordStrong) {
      return "Week";
    } else {
      return "Passwords do not match.";
    }
  }

  Widget get passwordStrengthIcon {
    if (isPasswordMatch && isPasswordStrong) {
      return Image.asset(AppIcons.checkFill);
    } else {
      return Icon(
        Icons.error_outline,
        color: Colors.red,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Custombackground(
        widget: Padding(
          padding: EdgeInsets.only(top: getHeight(50)),
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: getHeight(129),
              width: getWidth(138),
              child: Image.asset(AppImagese.lockIcon),
            ),
          ),
        ),
        bottomContainerHeight: screenHeight() * 0.7,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: getHeight(35),),
            Text(
              "Change Password",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(
              height: getHeight(24),
            ),
            CustomTextfield(
              controller: _currentPasswordController,
              obsecureText: checkPass,
              hintext: "Current Password",
              suffixIcon: SizedBox(),
              onChanged: (value) {
                setState(() {});
              },
            ),
            SizedBox(
              height: getHeight(18),
            ),
            CustomTextfield(
              controller: _newPasswordController,
              obsecureText: checkPass,
              hintext: "New Password",
              suffixIcon: InkWell(
                onTap: () {
                  setState(() {
                    checkPass = !checkPass;
                  });
                },
                child: SizedBox(
                  height: getHeight(24),
                  width: getWidth(24),
                  child: Icon(
                    checkPass ? Icons.visibility_off : Icons.visibility,
                    color: Color(0xffF8F8F8),
                  ),
                ),
              ),
              onChanged: (value) {
                setState(() {});
              },
            ),
            SizedBox(
              height: getHeight(18),
            ),
            CustomTextfield(
              controller: _confirmPasswordController,
              obsecureText: checkPass,
              hintext: "Re-password",
              suffixIcon: SizedBox(
                  height: getHeight(24),
                  width: getWidth(24),
                  child: passwordStrengthIcon),
              onTap: () {
                setState(() {
                  checkPass = !checkPass;
                });
              },
              onChanged: (value) {
                setState(() {});
              },
            ),
            SizedBox(
              height: getHeight(16),
            ),
            Row(
              children: [
                SizedBox(
                    height: getHeight(24),
                    width: getWidth(24),
                    child: passwordStrengthIcon),
                SizedBox(
                  width: 10,
                ),
                Text(
                  passwordStrengthMessage,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            //password conditon section
            ListView.builder(
              shrinkWrap: true,
              itemCount: passwordCondition.length,
              itemBuilder: (context, index) {
                final condition = passwordCondition[index];

                switch (index) {
                  case 0:
                    isConditionMet = _newPasswordController.text.length >= 8;
                    break;
                  case 1:
                    isConditionMet =
                        containsNumber(_newPasswordController.text);
                    break;
                  case 2:
                    isConditionMet =
                        containsSpecialCharacter(_newPasswordController.text);
                    break;
                }

                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: [
                      Container(
                        height: getWidth(12),
                        width: getWidth(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1),
                          border: Border.all(
                            color: isConditionMet
                                ? Colors.white
                                : Color(0xff9B9A9A),
                          ),
                          color: isConditionMet
                              ? Color(0xff30B64D)
                              : Color(0xffF50D0D),
                        ),
                        child: isConditionMet
                            ? Icon(
                                Icons.check,
                                color: Colors.white,
                                size: getWidth(10),
                              )
                            : Icon(
                                Icons.close,
                                color: Colors.white,
                                size: getWidth(10),
                              ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        condition,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color:
                                  Theme.of(context).textTheme.bodySmall?.color,
                            ),
                      ),
                    ],
                  ),
                );
              },
            ),
            Spacer(),
            isPasswordMatch && isPasswordStrong
                ? CustomGradientButton(
                    text: "Continue",
                    onTap: () {
                      _currentPasswordController.clear();
                      _newPasswordController.clear();
                      _confirmPasswordController.clear();
                      _customBottomSheet(context);
                    })
                : CustomBlurButton(
                    text: "Continue",
                    // isPasswordMatch && isPasswordStrong
                    //     ? () {
                    //         // Navigate to the next page
                    //       }
                    //     : null, // Disable the button if conditions are not met
                  ),
            SizedBox(
              height: getHeight(20),
            ),
          ],
        ),
      ),
    );
  }

 Future<dynamic> _customBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true, // Make the bottom sheet take the full screen
    backgroundColor: Colors.transparent, // Transparent background
    barrierColor: Color(
          0xff001B26).withOpacity(0.8),
    builder: (BuildContext context) {
      return Align(
        alignment: Alignment.center, // Center the container on the screen
        child: Stack(
          children: [
            Container(
              height: screenHeight(),
              width: double.infinity,
              color: Colors.transparent,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: getWidth(38)),
                height: getHeight(238),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: getHeight(95),
                      width: getWidth(95),
                      child: Image.asset(AppImagese.successIcon),
                    ),
                    Text(
                      'Your password has been changed successfully!',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.nunito(
                        color: Color(0xff001B26),
                        fontSize: getWidth(17),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: getHeight(40),
              right: getWidth(20),
              child: SizedBox(
                height: getHeight(26),
                width: getWidth(26),
                child: IconButton(
                  icon: Icon(Icons.close, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context); // Close the bottom sheet
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (_) => LoginScreen()),
                    // );
                  },
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

  @override
  void dispose() {
    _currentPasswordController.clear();
    _newPasswordController.clear();
    _confirmPasswordController.clear();
    super.dispose();
  }
}
