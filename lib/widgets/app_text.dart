// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelapp/util/colors.dart';

class AppText extends StatelessWidget {
  AppText({
    super.key,
    this.size = 16,
    this.color = Colors.black,
    required this.text,
    this.textf,
  });

  String text;
  double size = 16.sp;
  Color color = appcolor.colorblack;
  FontWeight? textf;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color, fontSize: size, fontWeight: textf),
    );
  }
}
