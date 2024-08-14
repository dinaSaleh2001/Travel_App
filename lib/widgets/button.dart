import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    this.tsize,
    this.onPressed,
    this.text,
    this.hight,
    this.width,
    this.btcolor,
  });
  void Function()? onPressed;
  String? text;
  double? width;
  double? hight;
  double? tsize;
  Color? btcolor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width!, hight!),
        backgroundColor: btcolor,
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text!,
        style: TextStyle(
          fontSize: tsize,
          color: Colors.white,
        ),
      ),
    );
  }
}
