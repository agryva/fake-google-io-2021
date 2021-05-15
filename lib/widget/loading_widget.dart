

import 'package:animate_do/animate_do.dart';
import 'package:fake_google_io/widget/custom_circle.dart';
import 'package:flutter/material.dart';

class ImageLoadingWidget extends StatelessWidget {
  final double? size;
  const ImageLoadingWidget({Key? key, this.size = 40}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BounceInUp(
          child: CustomCircle(
              size: 40,
              color: Color(0xff34A753)
          ),
        ),
        SizedBox(width: 8,),
        BounceInDown(
          child: CustomCircle(
              size: 40,
              color: Color(0xffE94334)
          ),
        ),
      ],
    );
  }
}
