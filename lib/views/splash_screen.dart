import 'package:flutter/material.dart';
import 'package:forecast_now/utility/app_colors.dart';
import 'package:forecast_now/utility/spacing.dart';
import 'package:forecast_now/utility/utils.dart';
import 'package:forecast_now/views/landing_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appbgColor,
      body: Column(
        children: [
          VerticalSpacing(UIExt(context).screenHeight()*0.4),
          Center(child: Image(image: AssetImage("assets/images/splash_img.png"),)),
          VerticalSpacing(UIExt(context).screenHeight()*0.29),
          Text("Powered By Tech Idara",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5), () => {
    Navigator.pushReplacement(
    context, MaterialPageRoute(builder: (context) => LandingScreen()))});
  }
}
