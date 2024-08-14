import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/cubit/app_cubit.dart';
import 'package:travelapp/widgets/app_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelapp/widgets/button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    "assets/images/welcome2.png",
    "assets/images/welcome3.png",
    "assets/images/welcome.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Container(
            height: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  images[index],
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 70, left: 50, right: 70),
              child: Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        text: 'Trips',
                        size: 50.sp,
                        textf: FontWeight.bold,
                      ),
                      AppText(
                        text: 'Mountain',
                        size: 20.sp,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 150.w,
                        child: AppText(
                          text:
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been ",
                          size: 15.sp,
                          textf: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomButton(
                        hight: 50.h,
                        width: 10.w,
                        btcolor: Colors.blue[500],
                        onPressed: () {
                          BlocProvider.of<AppCubits>(context).getData();
                        },
                        text: "Skip",
                        tsize: 30,
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 500),
                    child: Container(
                      height: 21,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue),
                      child: Row(
                        children: List.generate(3, (context) {
                          return Container(
                            margin: const EdgeInsets.only(left: 3, right: 3),
                            decoration: BoxDecoration(
                              color: index == context
                                  ? Colors.blue[900]
                                  : Colors.blue[50],
                              borderRadius: BorderRadius.circular(5.r),
                            ),
                            height: 6.w,
                            width: index == context ? 20.h : 8.h,
                          );
                        }),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
