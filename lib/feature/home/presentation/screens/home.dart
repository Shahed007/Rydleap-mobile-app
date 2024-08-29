import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rydleap/core/utility/app_colors.dart';
import 'package:rydleap/core/utility/custom_circle.dart';
import 'package:rydleap/core/utility/destination_tile.dart';


class Home extends StatefulWidget {
   Home({super.key});

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();


  double poslat=0.00;
  double poslong=0.00;
  LatLng currentpos=LatLng(23.7547124, 90.3630302);


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        automaticallyImplyLeading: false,

        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('assets/images/main_logo.png',width: 48,height: 45,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Hello,",
                  style: GoogleFonts.nunito(
                  fontWeight: FontWeight.w500,
                  fontSize: 25
                ),
                ),
                Text("User", style: GoogleFonts.nunito(
                    fontWeight: FontWeight.w400,
                    fontSize: 12
                ),),
              ],
            ),


            CircleAvatar(
              backgroundColor: Colors.grey.shade300.withOpacity(.3),
              radius: 23,
              child: CircleAvatar(
                radius: 20.5,
                backgroundColor: Colors.grey.shade300.withOpacity(.7),
                child: CircleAvatar(
                  radius: 17,
                  child: Icon(Icons.notifications_none,size: 25,color: Colors.black,),
                  backgroundColor: Colors.grey.shade300,
                ),
              ),
            )



          ],
        ),
      ),
      body: Stack(
        children: [
          Container(

            height: 100.h,
            width: 100.w,
            margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            child: GoogleMap(
              //initialCameraPosition: _kGoogle,
              markers: {
                Marker(
                  markerId: MarkerId("Source"),
                  position: currentpos,
                ),
              },
              mapType: MapType.normal,
              myLocationEnabled: true,
              compassEnabled: true,
              initialCameraPosition: CameraPosition(
                target: currentpos,
                zoom: 13,
              ),
              onMapCreated: (GoogleMapController controller){
                //_controller.complete(controller);
              },
            ),
          ),
          
          Positioned(

            top: 45.h,
            child:
          Container(
            height: 50.h,
            width: 100.w,
            decoration: BoxDecoration(
              color: AppColors.navy_blue
            ),
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 12.81.h, 0, 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                border: Border.all(
                  color: AppColors.lightPrimary
                ),
                color: AppColors.navy_blue,

                boxShadow: [
                  BoxShadow(
                    color: AppColors.lightPrimary,
                    spreadRadius: 7,
                    blurRadius: 22,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  SizedBox(height: 5,),
                  Container(
                    width: 100,
                      child: Divider(thickness: 5,color: Colors.grey,)),


                  SizedBox(height: 10,),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [


                      DestinationTile(title: 'Home', subtitle: '724 S Spring St, Los Angeles, CA 90014, USA724 S Spring St, Los Angeles, CA 90014, USA'),
                      DestinationTile(title: 'Office', subtitle: '724 S Spring St, Los Angeles, CA 90014, USA724 S Spring St, Los Angeles, CA 90014, USA'),





                    ],
                  ),
                ],
              ),
            ),
          ),),


          Positioned(

              top: 38.h,
              child: Container(

                margin: EdgeInsets.symmetric(horizontal: 20),
                 padding: EdgeInsets.symmetric(horizontal: 10),
                 height: 17.h,
                width: 90.w,
                decoration: BoxDecoration(
                color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.amberAccent,width: 1.5)
                ),

                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [

                        CustomCircle(radious: 7, color: Colors.amber),


                        Icon(Icons.more_vert),

                        // for(int i=0;i<4;i++)
                        //   CircleAvatar(radius: 2,backgroundColor: Colors.black,),


                        CustomCircle(radious: 7, color: Colors.purpleAccent),

                      ],
                    ),






                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 11.h/2,
                            width: 70.w,
                            padding: EdgeInsets.fromLTRB(10, 10, 20, 0),
                            child: TextFormField(

                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14
                              ),
                              decoration: InputDecoration(
                                hintText: 'Pickup location',
                                hintStyle: TextStyle(

                                    fontSize: 14
                                ),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,

                              ),

                            ),),


                        Container(
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [


                              Container(
                                height: 1,
                                width: 70.w,
                                color: Colors.grey,
                              ),


                              Icon(Icons.swap_vert),

                            ],
                          ),
                        ),


                        Container(
                            height: 11.h/2,
                          width: 70.w,
                          padding: EdgeInsets.fromLTRB(10, 0, 20, 10),
                            child: TextFormField(

                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14
                              ),
                              decoration: InputDecoration(
                                hintText: 'Enter Dropoff',
                                hintStyle: TextStyle(

                                    fontSize: 14
                                ),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,

                              ),

                            ),),
                      ],
                    ),
                  ],
                ),
              ))


          
          
          
          
        ],
      ),
    );
  }
}