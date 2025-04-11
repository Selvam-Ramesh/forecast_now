import 'package:flutter/material.dart';
import 'package:forecast_now/utility/app_colors.dart';
import 'package:forecast_now/utility/utils.dart';
import 'package:forecast_now/widgets/List_Tile.dart';
import '../services/remoteservices/geolocator_service.dart';
import 'package:geolocator/geolocator.dart';
import '../services/remoteservices/weather_forcast_service.dart';
import '../utility/spacing.dart';
import 'home_screen.dart';
class CitySelectionScreen extends StatelessWidget {
  const CitySelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appbgColor,
      body: Column(
        children: [
          VerticalSpacing(UIExt(context).screenHeight()*0.070),
          Row(
            children: [
              HorizontalSpacing(UIExt(context).screenWidth()*0.020),
              GestureDetector(onTap: ()=>onback_pressed(context),child: Icon(Icons.arrow_back)),
            ],
          ),
          VerticalSpacing(UIExt(context).screenHeight()*0.010),
          Row(
            children: [
              HorizontalSpacing(UIExt(context).screenWidth()*0.030),
              Text("Select City",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600,color: AppColors.appsecondryColor))
            ],
          ),
          Container(
          margin: const EdgeInsets.only(left: 15,right: 15),
          padding:  EdgeInsets.all(10),
          decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(5)),
          child: TextFormField(
          style: const TextStyle(color: Colors.black, fontSize: 15,fontWeight: FontWeight.w500),
            decoration:InputDecoration(
              hintText:"Enter your city name",
              border: OutlineInputBorder(
                borderSide:BorderSide(color:AppColors.lightgreyColor, width: 2.0),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:BorderSide(color:AppColors.lightgreyColor, width: 2.0),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          )),

          Expanded(
            child: ListView(children: [
              List_Tile(title: "Current Location", color: Color(0xffF6F6F6),icon: Icon(Icons.my_location), onlist_tap: ()=>onlist_tap(context),),
          /*    List_Tile(title: "Karachi, Pakistan",color: Color(0xffF6F6F6), onlist_tap: () {  },),
              List_Tile(title: "Sydney, Australia",color: Color(0xffF6F6F6), onlist_tap: () {  },),
              List_Tile(title: "Barcelona, Argnetina",color: Color(0xffF6F6F6), onlist_tap: () {  },),*/
            ],),
          )
        ],
      ),
    );
  }

  onback_pressed(BuildContext context) {
    Navigator.pop(context);
  }

  onlist_tap(BuildContext context) {
    Future<Position> position=determinePosition();
    position.then((value) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => HomeScreen(position:value)));
    });
  }
}
