import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rydleap/core/app_icons.dart';
import 'package:rydleap/core/app_imagese.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/utility/app_colors.dart';

class EmailSupportScreen extends StatefulWidget {
  const EmailSupportScreen({super.key});

  @override
  State<EmailSupportScreen> createState() => _EmailSupportScreenState();
}

class _EmailSupportScreenState extends State<EmailSupportScreen> {
  final TextEditingController _issueController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  File? _selectedImage;

  final ImagePicker _picker = ImagePicker();

  final String _imageKey = "stored_image_path";

  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? image = await _picker.pickImage(source: source);
      if (image != null) {
        setState(() {
          _selectedImage = File(image.path);
        });
        // _storeImagePath(image.path);
      }
    } catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future<bool> _checkPermissions(ImageSource source) async {
    if (source == ImageSource.camera) {
      final cameraStatus = await Permission.camera.status;
      if (cameraStatus.isGranted) {
        final result = await Permission.camera.request();
        return result.isGranted;
      }
    } else if (source == ImageSource.gallery) {
      final storageStatus = await Permission.photos.request();
      if (storageStatus.isGranted) {
        final result = await Permission.photos.request();
        return result.isGranted;
      }
    }
    return true;
  }

  void _showImageSourceSelection(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.appbarColor,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text('Take a Photo'),
              onTap: () async {
                if (await _checkPermissions(ImageSource.gallery)) {
                  _pickImage(ImageSource.camera);
                }

                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.photo_library),
              title: Text('Choose from Gallery'),
              onTap: () async {
                if (await _checkPermissions(ImageSource.gallery)) {
                  _pickImage(ImageSource.gallery);
                }

                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.textBlack,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.appbarColor,
        centerTitle: true,
        title: Text(
          "Email Support",
          style: GoogleFonts.inter(
              fontSize: getWidth(20), fontWeight: FontWeight.w600),
        ),
        leading: Padding(
          padding: EdgeInsets.only(left: getWidth(20)),
          child: SizedBox(
            height: getHeight(26),
            width: getWidth(26),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.close),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: screenHeight(),
            width: double.infinity,
            color: AppColors.textBlack,
          ),
          Image.asset(
            'assets/images/Ellipse_9.png',
            width: 150.w,
            height: 50.h,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: EdgeInsets.only(
                top: getHeight(35), left: getWidth(20), right: getWidth(20)),
            child: Column(
              children: [
                //issute type section
                Container(
                  height: getHeight(51),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff6D6A6A), width: 0.6),
                      borderRadius: BorderRadius.circular(getWidth(8))),
                  child: TextField(
                    readOnly: true,
                    keyboardType: TextInputType.number,
                    controller: _issueController,
                    decoration: InputDecoration(
                      hintText: "Issue Type",
                      hintStyle: GoogleFonts.nunito(
                          fontSize: getWidth(15),
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                      suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Image.asset(AppIcons.arrowDown)),
                      contentPadding: EdgeInsets.only(
                          bottom: 10.5, left: 15, top: 10.5, right: 15),
                      enabledBorder:
                          OutlineInputBorder(borderSide: BorderSide.none),
                      focusedBorder:
                          OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),
                SizedBox(
                  height: getHeight(16),
                ),
                //subject section
                Container(
                  height: getHeight(51),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff6D6A6A), width: 0.6),
                      borderRadius: BorderRadius.circular(getWidth(8))),
                  child: TextField(
                    controller: _subjectController,
                    decoration: InputDecoration(
                      hintText: "Subject",
                      hintStyle: GoogleFonts.nunito(
                          fontSize: getWidth(15),
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                      contentPadding: EdgeInsets.only(
                          bottom: 10.5, left: 15, top: 10.5, right: 15),
                      enabledBorder:
                          OutlineInputBorder(borderSide: BorderSide.none),
                      focusedBorder:
                          OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),
                SizedBox(
                  height: getHeight(30),
                ),
                Container(
                  height: getHeight(141),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  child: TextField(
                    controller: _descriptionController,
                    maxLines: 7,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      hintText: "Tell us more about your problem",

                      hintStyle: GoogleFonts.nunito(
                          fontSize: getWidth(14),
                          fontWeight: FontWeight.w400,
                          color: Color(0xffB6B3B3)),
                      // contentPadding: EdgeInsets.only(
                      //     bottom: 10.5, left: 15, top: 10.5, right: 15),
                      enabledBorder:
                          OutlineInputBorder(borderSide: BorderSide.none),
                      focusedBorder:
                          OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),
                SizedBox(
                  height: getHeight(20),
                ),
                Text(
                  "You can upload png/jpg/mov",
                  style: GoogleFonts.nunito(
                      fontSize: getWidth(14),
                      fontWeight: FontWeight.w400,
                      color: Color(0xffB6B3B3)),
                ),
                SizedBox(
                  height: getHeight(12),
                ),
                InkWell(
                  onTap: () {
                    _showImageSourceSelection(context);
                  },
                  child: Container(
                      width: double.infinity,
                      child: Image.asset(
                        "assets/images/frame.png",
                        fit: BoxFit.cover,
                      )),
                ),
                Spacer(),
                Material(
                  borderRadius: BorderRadius.circular(getWidth(46)),
                  color: Color(0xff3AD896),
                  child: InkWell(
                    onTap: () {
                      _customBottomSheet(context);
                    },
                    borderRadius: BorderRadius.circular(getWidth(46)),
                    splashColor: Colors.grey.withOpacity(0.5),
                    child: Container(
                      height: getHeight(50),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 0.6),
                        borderRadius: BorderRadius.circular(getWidth(46)),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xffFFFFFF).withOpacity(0.2),
                            offset: Offset(0, 1),
                            blurRadius: 10,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              height: getHeight(22),
                              width: getWidth(22),
                              child: Image.asset(AppIcons.send)),
                          SizedBox(
                            height: getWidth(11),
                          ),
                          Text(
                            "Send",
                            style: GoogleFonts.inter(
                              fontSize: getWidth(17),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: getHeight(20),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<dynamic> _customBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Make the bottom sheet take the full screen
      backgroundColor: Colors.transparent, // Transparent background
      barrierColor: Color(
          0xff001B26), // Semi-transparent black background for the barrier
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
                        // height: getHeight(120),
                        width: getWidth(95),
                        child: Image.asset(AppImagese.successIcon),
                      ),
                      Text(
                        'Your support request has been sent.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.nunito(
                          color: Color(0xff001B26),
                          fontSize: getWidth(17),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Expected response time: 24 hours',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.nunito(
                          color: Color(0xff001B26),
                          fontSize: getWidth(12),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top:
                    getHeight(30), // Adjust the top margin for the close button
                right: getWidth(
                    20), // Adjust the right margin for the close button
                child: SizedBox(
                  height: getHeight(26),
                  width: getWidth(26),
                  child: IconButton(
                    icon: Icon(Icons.close, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
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
}
