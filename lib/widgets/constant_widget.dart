import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rto_exam/utils/colors.dart';
import 'package:rto_exam/utils/constant.dart';
import 'package:rto_exam/widgets/constant_widget.dart';
import 'common_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget getAssetImage(String image, {double? width, double? height, Color? color, BoxFit boxFit = BoxFit.contain}) {
  return Image.asset(
    Constant.assetImagePath + image,
    color: color,
    width: width?.w,
    height: height?.h,
    fit: boxFit,
  );
}

Widget getSvgImage(String image, {double? width, double? height, Color? color, BoxFit boxFit = BoxFit.contain}) {
  return SvgPicture.asset(
    Constant.svgAssetImagePath + image,
    color: color,
    width: width?.w,
    height: height?.h,
    fit: boxFit,
  );
}
