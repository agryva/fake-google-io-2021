import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fake_google_io/data/model/product_model.dart';
import 'package:fake_google_io/detail_page.dart';
import 'package:fake_google_io/gen/assets.gen.dart';
import 'package:fake_google_io/gen/fonts.gen.dart';
import 'package:fake_google_io/splashscreen.dart';
import 'package:fake_google_io/utils/bordered_text.dart';
import 'package:fake_google_io/utils/helpers.dart';
import 'package:fake_google_io/utils/text_style.dart';
import 'package:fake_google_io/widget/custom_circle.dart';
import 'package:fake_google_io/widget/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_countdown_timer/index.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ionicons/ionicons.dart';
import 'package:rubber/rubber.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xff202124),
      statusBarIconBrightness: Brightness.dark,
    ));
    return MaterialApp(
      title: 'Google I/O Fake',
      theme: ThemeData(
        primarySwatch: Helpers.generateMaterialColor(Color(0xff202124)),
        canvasColor: Colors.transparent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key,}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  GlobalKey _one = GlobalKey();

  ScrollController _scrollController = ScrollController();
  int endTime = DateTime(2021, 5, 19).millisecondsSinceEpoch + 1000 * 30;

  RubberAnimationController? _controller;

  List<ProductModel> _productModel = [
    ProductModel(
      icon: Assets.graphics.android,
      type: "svg",
      name: "Android"
    ),
    ProductModel(
      icon: Assets.graphics.cloud,
      type: "svg",
      name: "Google Cloud",
    ),
    ProductModel(
      icon: Assets.graphics.firebase.assetName,
      type: "png",
      name: "Firebase",
    ),
    ProductModel(
      icon: Assets.graphics.flutter.assetName,
      type: "png",
      name: "Flutter",
    ),
  ];

  @override
  void initState() {
    _controller = RubberAnimationController(
        vsync: this,
        initialValue: 0.6,
        lowerBoundValue: AnimationControllerValue(percentage: 0.6),
        halfBoundValue: AnimationControllerValue(percentage: 0.92),
        upperBoundValue: AnimationControllerValue(percentage: 0.92),
        duration: Duration(milliseconds: 200));
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff202124),
      body: Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
          bottom: MediaQuery.of(context).padding.bottom,
        ),
        width: Helpers.getWidthPageSize(context),
        height: Helpers.getHeightPageSize(context),
        child: RubberBottomSheet(
          scrollController: _scrollController,
          lowerLayer: _getLowerLayer(),
          upperLayer: _getUpperLayer(),
          animationController: _controller!,
        )
      ),
    );
  }

  Widget _getLowerLayer() {
    return Container(
      width: Helpers.getWidthPageSize(context),
      height: Helpers.getHeightPageSize(context),
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Color(0xff202124)
      ),
      child: Stack(
        children: [
          Positioned(
            top: 100,
            left: 20,
            right: 0,
            child: FadeIn(
              duration: Duration(milliseconds: 500),
              delay: Duration(milliseconds: 200),
              child: CustomCircle(
                size: 40,
                color: Color(0xffF8BB2D)
              ),
            ),
          ),
          Positioned(
            top: 150,
            left: 0,
            right: 10,
            child: Bounce(
              duration: Duration(milliseconds: 500),
              delay: Duration(milliseconds: 200),
              child: CustomCircle(
                size: 40,
                color: Color(0xff34A753)
              ),
            ),
          ),
          Positioned(
            top: 250,
            left: 220,
            right: 0,
            child: BounceInUp(
              duration: Duration(milliseconds: 500),
              delay: Duration(milliseconds: 200),
              child: CustomCircle(
                size: 40,
                color: Color(0xffEA4336)
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                      Assets.graphics.logo
                  ),
                  InkWell(
                    onTap: () {
                      _launchURL("https://events.google.com/io/?lng=en");
                    },
                    child: Icon(
                      Ionicons.information_outline,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              Container(
                width: Helpers.getWidthPageSize(context),
                height: Helpers.getHeightPageSize(context) * 0.3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _countdownWidget(),
                    SizedBox(height: 24,),
                    DefaultTextStyle(
                      style: TextStyle(
                        fontFamily: FontFamily.googleSans,
                        color: Colors.white ,
                        decorationColor: Color(0xff202124),
                        decoration: TextDecoration.none,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                      child: AnimatedTextKit(
                        isRepeatingAnimation: false,
                        animatedTexts: [
                          TypewriterAnimatedText(
                              "I/O is back, online and free for everyone Join us Live",
                              textAlign: TextAlign.center
                          )
                        ],
                      )
                    ),
                    SizedBox(height: 16,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                          decoration: BoxDecoration(
                            color: Color(0xffF9BB2D),
                            borderRadius: BorderRadius.circular(16)
                          ),
                          child: Text(
                              "May 18-20",
                              style: TextStyleCustom.textTimerStyle(
                                fontSize: 12,
                                color: Color(0xff121215)
                              )
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _countdownWidget() {
    return CountdownTimer(
      endTime: endTime,
      widgetBuilder: (_, CurrentRemainingTime? time) {
        if (time == null) {
          return Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(
                        "00",
                        style: TextStyleCustom.textTimerStyle(fontSize: 42)
                    ),
                    SizedBox(height: 8,),
                    Text(
                        "Days",
                        style: TextStyleCustom.textTimerStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        )
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                        "00",
                        style: TextStyleCustom.textTimerStyle(fontSize: 42)
                    ),
                    SizedBox(height: 8,),
                    Text(
                        "Hours",
                        style: TextStyleCustom.textTimerStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        )
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                        "00",
                        style: TextStyleCustom.textTimerStyle(fontSize: 42)
                    ),
                    SizedBox(height: 8,),
                    Text(
                        "Minutes",
                        style: TextStyleCustom.textTimerStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        )
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    BorderedText(
                      strokeWidth: 2,
                      strokeColor: Colors.white,
                      child: Text(
                        "00",
                        style: TextStyle(
                          fontFamily: FontFamily.googleSans,
                          color: Color(0xff202124) ,
                          decorationColor: Color(0xff202124),
                          decoration: TextDecoration.none,
                          fontSize: 42,
                          fontWeight: FontWeight.w700,
                        ),

                      ),
                    ),
                    SizedBox(height: 8,),
                    Text(
                        "Seconds",
                        style: TextStyleCustom.textTimerStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        )
                    ),
                  ],
                ),
              ),
            ],
          );
        }

        return Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Text(
                      "${time.days ?? "00"}",
                      style: TextStyleCustom.textTimerStyle(fontSize: 42)
                  ),
                  SizedBox(height: 8,),
                  Text(
                      "Days",
                      style: TextStyleCustom.textTimerStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      )
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                      "${time.hours ?? "00"}",
                      style: TextStyleCustom.textTimerStyle(fontSize: 42)
                  ),
                  SizedBox(height: 8,),
                  Text(
                      "Hours",
                      style: TextStyleCustom.textTimerStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      )
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                      "${time.min ?? "00"}",
                      style: TextStyleCustom.textTimerStyle(fontSize: 42)
                  ),
                  SizedBox(height: 8,),
                  Text(
                      "Minutes",
                      style: TextStyleCustom.textTimerStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      )
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  BorderedText(
                    strokeWidth: 2,
                    strokeColor: Colors.white,
                    child: Text(
                        "${time.sec ?? "00"}",
                      style: TextStyle(
                        fontFamily: FontFamily.googleSans,
                        color: Color(0xff202124) ,
                        decorationColor: Color(0xff202124),
                        decoration: TextDecoration.none,
                        fontSize: 42,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),

                  SizedBox(height: 8,),
                  Text(
                      "Seconds",
                      style: TextStyleCustom.textTimerStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      )
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _getUpperLayer() {
    return Container(
        height: Helpers.getHeightPageSize(context),
        width: Helpers.getWidthPageSize(context),
        padding: EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
            color: Color(0xff202124),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16))
        ),
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          controller: _scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 8,),
              _forYouPageWidget(),
              SizedBox(height: 32,),
              _googleKeynoteAndProduct()
            ],
          ),
        )
    );
  }

  Widget _forYouPageWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
              "Content you might like",
              style: TextStyleCustom.textTimerStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              )
          ),
        ),
        SizedBox(height: 8,),
        Container(
          height: 340,
          child: ListView.builder(
            itemCount: 6,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return createContentList(160);
            },
          ),
        )
      ],
    );
  }

  Widget _googleKeynoteAndProduct() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
              "Here???s what you can???t miss at I/O this year",
              style: TextStyleCustom.textTimerStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              )
          ),
        ),
        SizedBox(height: 8,),
        Container(
          width: Helpers.getWidthPageSize(context),
          height: 210,
          margin: EdgeInsets.fromLTRB(8, 16, 8, 0),
          decoration: BoxDecoration(
              border: Border.all(color: Color(0xff5f6368)),
              borderRadius: BorderRadius.circular(8)
          ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: "https://events.google.com/io/assets/io_flag.jpeg",
                  height: 210,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => ImageLoadingWidget(),
                  errorWidget: (context, url, error) =>  SvgPicture.asset(
                      Assets.graphics.logo
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: Helpers.getWidthPageSize(context),
                  height: 210,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3)
                  ),
                )
              ),

              Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                              "Google Keynote",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyleCustom.textTimerStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w600,
                              )
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16,),
                    Text(
                        "9:40 AM PT ??? Pre-show",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyleCustom.textTimerStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        )
                    ),
                    SizedBox(height: 8,),
                    Text(
                        "10:00 AM PT ??? Google Keynote",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyleCustom.textTimerStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        )
                    ),
                    SizedBox(height: 8,),
                    Text(
                        "12:15 PM PT ??? Developer Keynote",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyleCustom.textTimerStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        )
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 24,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              for (int i = 0; i < _productModel.length; i++) ... [
                Expanded(
                  child: BouncingWidget(
                    duration: Duration(milliseconds: 100),
                    scaleFactor: 1.5,
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(_productModel[i].name),
                          behavior: SnackBarBehavior.floating,
                        )
                      );
                    },
                    child: createProductCircle(
                        icon: _productModel[i].icon,
                        type: _productModel[i].type
                    ),
                  ),
                ),
                SizedBox(width: 8,),
              ]
            ],
          ),
        ),

        ListView.builder(
          itemCount: 6,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return createContentList(190, paddingBottom: 16);
          },
        )
      ],
    );
  }

  Widget createProductCircle({required String icon, required String type}) {
    return Container(
      width: 80,
      height: 80,
      decoration: new BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (type == "svg") ...[
            SvgPicture.asset(
              icon,
              width: 35,
              height: 35,
            ),
          ] else ...[
            Image.asset(
              icon,
              width: 35,
              height: 35,
            )
          ]
        ],
      ),
    );
  }

  Widget createContentList(double bannerHeight, {double? paddingBottom}) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailPage()),
        );
      },
      child: Container(
        width: Helpers.getWidthPageSize(context) * 0.8,
        margin: EdgeInsets.fromLTRB(8, 16, 8, 15),
        padding: paddingBottom != null ? EdgeInsets.only(bottom: paddingBottom) : null,
        decoration: BoxDecoration(
            border: Border.all(color: Color(0xff5f6368)),
            borderRadius: BorderRadius.circular(8)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: "https://events.google.com/io/assets/sessions/IO21_104.jpg",
                width: Helpers.getWidthPageSize(context),
                height: bannerHeight,
                fit: BoxFit.fill,
                placeholder: (context, url) => ImageLoadingWidget(),
                errorWidget: (context, url, error) =>  SvgPicture.asset(
                    Assets.graphics.logo
                ),
              ),
            ),
            SizedBox(height: 16,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "DAY 2, 10:00PM - 11:00PM",
                          style: TextStyleCustom.textTimerStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(width: 8,),
                      Icon(
                        Ionicons.ticket_outline,
                        color: Colors.white,
                        size: 18,
                      ),
                      SizedBox(width: 16,),
                      Icon(
                        Ionicons.star_outline,
                        color: Colors.white,
                        size: 18,
                      ),
                    ],
                  ),
                  SizedBox(height: 16,),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Fireside chat with Flutter + Firebase [Americas]",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyleCustom.textTimerStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16,),
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          "Meetups",
                          style: TextStyleCustom.textTimerStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(width: 8,),
                      Flexible(
                        child: Text(
                          "Open Source",
                          style: TextStyleCustom.textTimerStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(width: 8,),
                      Flexible(
                        child: Text(
                          "Asia Pacific",
                          style: TextStyleCustom.textTimerStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }

  void _launchURL(String _url) async =>
      await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';


}
