import 'package:flutter/material.dart';
import 'package:forecast_now/utility/app_colors.dart';
import 'package:forecast_now/utility/constants.dart';
import 'package:forecast_now/utility/spacing.dart';
import 'package:forecast_now/utility/utils.dart';
import 'package:forecast_now/views/city_selection_screen.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:forecast_now/views/home_screen.dart';

import '../utility/form_validator.dart';

class LandingScreen extends StatefulWidget {
  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    String _country;
    return Scaffold(
      backgroundColor: AppColors.appbgColor,
      body: Column(
        children: [
          VerticalSpacing(UIExt(context).screenHeight() * 0.038),
          Row(
            children: [
              HorizontalSpacing(UIExt(context).screenWidth() * 0.050),
              Text("Hello,", style: TextStyle(fontSize: 60, fontWeight: FontWeight.w600, color: AppColors.appsecondryColor))
            ],
          ),
          Row(
            children: [
              HorizontalSpacing(UIExt(context).screenWidth() * 0.050),
              Text("let’s set you", style: TextStyle(fontSize: 60, fontWeight: FontWeight.w600, color: AppColors.lightgreyColor))
            ],
          ),
          Row(
            children: [
              HorizontalSpacing(UIExt(context).screenWidth() * 0.050),
              Text("weather", style: TextStyle(fontSize: 60, fontWeight: FontWeight.w600, color: AppColors.appprimaryColor))
            ],
          ),
          Image(image: AssetImage('assets/images/landing_img.png')),
          VerticalSpacing(UIExt(context).screenHeight() * 0.020),
          GestureDetector(
            onTap: () => oncurrentloc_tap(context),
            child: Container(
              width: 300,
              height: 72,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(9)),
                color: Color(0xffE0E0E0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  HorizontalSpacing(UIExt(context).screenWidth() * 0.050),
                  Text("Select Current Location", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                  Spacer(),
                  Icon(Icons.arrow_forward),
                  HorizontalSpacing(UIExt(context).screenWidth() * 0.050),
                ],
              ),
            ),
          ),
          VerticalSpacing(UIExt(context).screenHeight() * 0.020),
          Container(
            width: 300,
            height: 62,
            decoration: BoxDecoration(
                color: AppColors.appprimaryColor,
                borderRadius: BorderRadius.circular(9)),
            child: DropdownButtonFormField2(
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
              hint: Text(
                'Select Your Country',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: AppColors.whiteColor),
              ),
              // icon: const Icon(
              //   Icons.arrow_drop_down,
              //   color: Color(0xFF868889),
              // ),
              // iconSize: 30,
              // buttonHeight: 40,
              // buttonPadding: const EdgeInsets.only(left: 10, right: 10),
              // dropdownDecoration: BoxDecoration(
              //   borderRadius: BorderRadius.circular(10),
              // ),
              items: Constants.cityList
                  .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ))
                  .toList(),
              validator: (value) => validateDropDownField(value.toString()),
              onChanged: (value) {
                ondropdown_change(value.toString(), context);
              },
              onSaved: (value) {},
            ),
          ),
        ],
      ),
    );
  }

  oncurrentloc_tap(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => CitySelectionScreen()));
  }

  ondropdown_change(String? value, BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => HomeScreen(city: value)));
  }
}
