import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydleap/core/app_imagese.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/utility/app_colors.dart';
import 'package:rydleap/feature/safety_tips/dummy_data/safety_model.dart';

class SafetyTipsScreen extends StatelessWidget {
  const SafetyTipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appbarColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.appbarColor,
        title: Text(
          "Safety Tips",
          style: GoogleFonts.inter(
            fontSize: getWidth(20),
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: Padding(
          padding: EdgeInsets.only(left: getWidth(20)),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 20,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            color: AppColors.textBlack,
          ),
          Image.asset(
            'assets/images/Ellipse_9.png',
            width: 150.w,
            height: 60.h,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
            child: Column(
              children: [
                SizedBox(height: getHeight(20)),
                Row(
                  children: [
                    SizedBox(
                      height: getHeight(98),
                      width: getWidth(98),
                      child: Image.asset(AppImagese.safety),
                    ),
                    SizedBox(width: getWidth(40)),
                    Text(
                      "Introduction",
                      style: GoogleFonts.inter(
                        fontSize: getWidth(24),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: getHeight(18),
                ),
                Text(
                  "Your safety is our top priority. Follow these tips to ensure a safe and secure ride experience. ",
                  style: GoogleFonts.nunito(
                    fontSize: getWidth(16),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: getHeight(30),
                ),
                // The ListView.builder with flexible height inside the scroll view
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: safetyItems.length,
                  itemBuilder: (context, index) {
                    final data = safetyItems[index];
                    return Padding(
                      padding: EdgeInsets.only(bottom: getHeight(15)),
                      child: ListTile(
                        title: Text(
                          data.title,
                          style: GoogleFonts.inter(
                              fontSize: getWidth(17),
                              fontWeight: FontWeight.w500),
                        ),
                        
                        subtitle: Text(
                          data.subTitle,
                          style: GoogleFonts.nunito(
                              fontSize: getWidth(14),
                              fontWeight: FontWeight.w400,
                              color: Color(0xffDED9D9)),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          // Positioned container at the bottom
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
                height: getHeight(100),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //back buton
                    Material(
                      borderRadius: BorderRadius.circular(88),
                      color: Colors.white,
                      child: InkWell(
                        splashColor: Colors.grey.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(88),
                        onTap: (){
                          print("Back");
                        },
                        child: Container(
                          height: getHeight(40),
                          width: getWidth(100),
                          decoration: BoxDecoration(
                              
                              borderRadius: BorderRadius.circular(88),
                              border:
                                  Border.all(color: Color(0xff3AD896), width: 0.4)),
                          child: Center(
                            child: Text(
                              "Back",
                              style: GoogleFonts.nunito(
                                
                                  fontSize: getWidth(13),
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xffB7BBBD)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: getWidth(39),),
                    //report button
                    Material(
                      borderRadius: BorderRadius.circular(88),
                      color: Color(0xff3AD896),
                      child: InkWell(
                        splashColor: Colors.grey.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(88),
                        onTap: (){
                          print("Back");
                        },
                        child: Container(
                          height: getHeight(40),
                          width: getWidth(100),
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(88),
                              border:
                                  Border.all(color:Colors.white,  width: 0.4)),
                          child: Center(
                            child: Text(
                              "Report",
                              style: GoogleFonts.nunito(
                                
                                  fontSize: getWidth(13),
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff001B26)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
