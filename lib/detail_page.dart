import 'package:cached_network_image/cached_network_image.dart';
import 'package:fake_google_io/utils/helpers.dart';
import 'package:fake_google_io/utils/text_style.dart';
import 'package:fake_google_io/widget/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ionicons/ionicons.dart';

import 'gen/assets.gen.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff202124),
      body: SafeArea(
        child: Container(
          width: Helpers.getWidthPageSize(context),
          height: Helpers.getHeightPageSize(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Icon(
                      Ionicons.arrow_back,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Fireside chat with Flutter + Firebase [Americas]",
                          style: TextStyleCustom.textTimerStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 16,),
                        Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                          style: TextStyleCustom.textTimerStyle(
                            fontSize: 16,
                            color: Color(0xffe8eaed),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 16,),
                        Text(
                          "Speakers",
                          style: TextStyleCustom.textTimerStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 16,),
                        for (int i = 0; i < 5; i++) ...[
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: CachedNetworkImage(
                                  imageUrl: "https://lh3.googleusercontent.com/YJv3Yq1jH0blm4d_wQZaEFoi0n3q5yFLIUGPW8ClISPfmptJOCC65OlJhKnkT_NC9MetdlyMP5Eehlagx11Tv0cC2UE2qeWRJBvW=s120",
                                  height: 40,
                                  width: 40,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => ImageLoadingWidget(
                                    size: 20,
                                  ),
                                  errorWidget: (context, url, error) =>  SvgPicture.asset(
                                      Assets.graphics.logo
                                  ),
                                ),
                              ),
                              SizedBox(width: 16,),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Sandeep Gupta",
                                      style: TextStyleCustom.textTimerStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      "Product Manager, TensorFlow",
                                      style: TextStyleCustom.textTimerStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16,),
                        ],
                        SizedBox(height: 16,),
                        Center(
                          child: Container(
                            width: Helpers.getWidthPageSize(context),
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Color(0xff363B4A).withOpacity(0.4),
                              borderRadius: BorderRadius.circular(8)
                            ),
                            child: SvgPicture.asset(
                                Assets.graphics.qrUrl
                            ),
                          ),
                        ),

                      ],
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
