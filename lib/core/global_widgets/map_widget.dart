




import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidget extends StatelessWidget{

  LatLng currentpos = LatLng(31.119318, -99.245435);
  final double height;
  final double width;

   MapWidget({super.key, required this.height, required this.width});



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: height,
      width: width,
      margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
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
        onMapCreated: (GoogleMapController controller) {
          //_controller.complete(controller);
        },
      ),
    );
  }

}