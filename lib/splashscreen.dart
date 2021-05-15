import 'package:animate_do/animate_do.dart';
import 'package:fake_google_io/main.dart';
import 'package:fake_google_io/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:transition/transition.dart';

import 'gen/assets.gen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
        context,
        Transition(
            child: MyHomePage(), transitionEffect: TransitionEffect.FADE),
            (Route<dynamic> route) => false,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff202124),
      body: SafeArea(
        child: Container(
          width: Helpers.getWidthPageSize(context),
          height: Helpers.getHeightPageSize(context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                  Assets.graphics.logo,
                width: 190,
              ),
              SizedBox(height: 32,),
              BounceInUp(
                child: Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 5,
                    valueColor: AlwaysStoppedAnimation(
                      Color(0xff34A753)
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
