



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/app_sizes.dart';
import '../../driver_contact_rider/presentation/driver_contact_rider.dart';

class DriverRideRequest extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios)),
            Text('Ride Request'),
            CircleAvatar(
              radius: 17,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 14,
                child: Icon(
                  Icons.question_mark,
                  size: 25,
                  color: Colors.white,
                ),
                backgroundColor: Colors.blue,
              ),
            )
          ],
        ),
      ),

      body: Column(
        children: [


          Container(
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 1,
                color: Colors.white,
              )

            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Row(
                      children: [

                        Container(
                          height: getHeight(80),
                          width: getWidth(80),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/dummy_customer_image.png'))),
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Burkina Faso',style: GoogleFonts.nunito(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),),
                            Text('3 km / 12 mins',style: GoogleFonts.nunito(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),),
                          ],
                        )


                      ],
                    ),



                    Text('(4.8 ⭐)',style: GoogleFonts.nunito(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.amberAccent),)


                  ],
                ),


                Text('Pickup: ',style: GoogleFonts.nunito(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),),
                Text('123 Main St',style: GoogleFonts.nunito(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),),

                Text('Drop off Time :',style: GoogleFonts.nunito(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),),

                Text('456 Elm St',style: GoogleFonts.nunito(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),),


                Text('Estimated Fare: \$10',style: GoogleFonts.nunito(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),),

                SizedBox(height: 16,),



                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey
                      ),
                      child: Icon(Icons.close),
                      height: 40,
                      width: 100,
                    ),

                    InkWell(
                      onTap: (){


                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => DriverContactRider()));



                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color(0xff3AD896)
                        ),
                        child: Icon(Icons.check),
                        height: 40,
                        width: 100,
                      ),
                    ),


                  ],
                ),

                SizedBox(height: 20,),







              ],
            ),
          )




        ],
      ),



    );
  }

}