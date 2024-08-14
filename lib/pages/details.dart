import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelapp/cubit/app_cubit.dart';
import 'package:travelapp/cubit/app_state.dart';
import 'package:travelapp/widgets/app_text.dart';
import 'package:travelapp/widgets/button.dart';

class detailsPage extends StatefulWidget {
  const detailsPage({super.key});

  @override
  State<detailsPage> createState() => _detailsPageState();
}

class _detailsPageState extends State<detailsPage> {
  int gottenstart = 4;
  int isclick = -1;
  bool isfavorit = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
      DetailsState details = state as DetailsState;
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Image.network(
                    "http://mark.bslmeiyu.com/uploads/${details.place.imge}",
                    width: double.infinity,
                    fit: BoxFit.fill,
                    height: 300.h,
                  ),
                  Positioned(
                    top: 50,
                    left: 20,
                    child: IconButton(
                      onPressed: () {
                        BlocProvider.of<AppCubits>(context).gohome();
                      },
                      icon: const Icon(Icons.arrow_back),
                      color: Colors.white,
                      iconSize: 30.sp,
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(10.r),
                      right: Radius.circular(10.r)),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    left: 20,
                    right: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText(
                            text: details.place.name,
                            size: 20.sp,
                            textf: FontWeight.bold,
                          ),
                          AppText(
                            text: "\$${details.place.price}",
                            size: 20.sp,
                            textf: FontWeight.bold,
                            color: const Color.fromARGB(255, 3, 49, 105),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.grey,
                            size: 25.sp,
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                          AppText(
                            text: details.place.location,
                            color: Colors.grey,
                            size: 15.sp,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(5, (index) {
                              return Icon(
                                Icons.star_outlined,
                                color: index < details.place.starts
                                    ? Colors.yellow[700]
                                    : Colors.grey,
                              );
                            }),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          AppText(
                            text: "(${details.place.starts}.0)",
                            color: Colors.grey,
                            size: 15.sp,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      AppText(
                        text: "People",
                        textf: FontWeight.bold,
                        size: 20.sp,
                      ),
                      AppText(
                        text: "number of peopple in your group",
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Wrap(
                        children: List.generate(5, (index) {
                          return InkWell(
                            onTap: () {
                              isclick = index;
                              setState(() {});
                            },
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.r),
                                  color: isclick == index
                                      ? Colors.black
                                      : Colors.grey[400]),
                              child: AppText(
                                text: "${index + 1}".toString(),
                                size: 18.sp,
                                color: isclick == index
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          );
                        }),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      AppText(
                        text: "Description",
                        size: 20.sp,
                        textf: FontWeight.bold,
                      ),
                      AppText(
                        text: details.place.description,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              isfavorit = true;
                              setState(() {});
                            },
                            child: Container(
                              padding: const EdgeInsets.all(15),
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                  ),
                                  borderRadius: BorderRadius.circular(15.r),
                                  color: Colors.transparent),
                              child: isfavorit
                                  ? const Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    )
                                  : const Icon(
                                      Icons.favorite_border,
                                    ),
                            ),
                          ),
                          CustomButton(
                            hight: 50.h,
                            width: 50.w,
                            onPressed: () {},
                            text: "Book Trip Now -->>>",
                            tsize: 18.sp,
                            btcolor: Colors.blue[800],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
