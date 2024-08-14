import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelapp/cubit/app_cubit.dart';
import 'package:travelapp/cubit/app_state.dart';
import 'package:travelapp/widgets/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabcontroller = TabController(length: 3, vsync: this);

    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
        if (state is SuccesState) {
          var info = state.places;
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(
                    top: 50,
                    left: 20,
                    right: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.menu,
                          size: 30.sp,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                         
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.noHeader,
                            animType: AnimType.rightSlide,
                            body: Container(
                              padding: const EdgeInsets.all(16.0),
                              margin: const EdgeInsets.all(16.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 3.r,
                                    blurRadius: 7.r,
                                    offset: Offset(0.h, 3.w),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 50.r,
                                    backgroundImage: const AssetImage(
                                        'assets/images/person.jfif'),
                                  ),
                                  SizedBox(height: 20.h),
                                  Text(
                                    'Dina Saleh',
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 10.h),
                                  Text(
                                    'dinasaleh@gmail.com',
                                    style: TextStyle(
                                        fontSize: 15.sp, color: Colors.grey),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                ],
                              ),
                            ),
                          ).show();
                         
                        },
                        child: CircleAvatar(
                          maxRadius: 30.r,
                          backgroundImage: const NetworkImage(
                            "assets/images/person.jfif",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: AppText(
                    text: "Discover",
                    size: 20.sp,
                    textf: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                TabBar(
                  labelColor: Colors.blue,
                  labelStyle: TextStyle(fontSize: 18.sp),
                  isScrollable: true,
                  unselectedLabelStyle: TextStyle(fontSize: 16.sp),
                  dividerColor: Colors.transparent,
                  indicatorColor: Colors.blue[800],
                  indicatorSize: TabBarIndicatorSize.label,
                  controller: _tabcontroller,
                  tabs: const [
                    Tab(
                      text: "Places",
                    ),
                    Tab(
                      text: "Inspiration",
                    ),
                    Tab(
                      text: "Emotions",
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  padding: const EdgeInsets.only(top: 20, left: 10),
                  height: 240.h,
                  width: double.maxFinite,
                  child: TabBarView(
                    controller: _tabcontroller,
                    children: [
                      ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: info.length,
                          itemBuilder: (context, i) {
                            return GestureDetector(
                              onTap: () {
                                BlocProvider.of<AppCubits>(context)
                                    .detailspage(info[i]);
                              },
                              child: Container(
                                height: 210.h,
                                width: 190.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      "http://mark.bslmeiyu.com/uploads/${info[i].imge}",
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                margin: const EdgeInsets.only(
                                  left: 10,
                                  right: 5,
                                ),
                              ),
                            );
                          }),

                      ////////////////

                      ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: info.length,
                          itemBuilder: (context, i) {
                            return GestureDetector(
                              onTap: () {
                                BlocProvider.of<AppCubits>(context)
                                    .detailspage(info[i]);
                              },
                              child: Container(
                                height: 210.h,
                                width: 190.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      "http://mark.bslmeiyu.com/uploads/${info[i].imge}",
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                margin: const EdgeInsets.only(
                                  left: 10,
                                  right: 5,
                                ),
                              ),
                            );
                          }),
                      /////////////
                      ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: info.length,
                          itemBuilder: (context, i) {
                            return GestureDetector(
                              onTap: () {
                                BlocProvider.of<AppCubits>(context)
                                    .detailspage(info[i]);
                              },
                              child: Container(
                                height: 210.h,
                                width: 190.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      "http://mark.bslmeiyu.com/uploads/${info[i].imge}",
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                margin: const EdgeInsets.only(
                                  left: 10,
                                  right: 5,
                                ),
                              ),
                            );
                          }),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        text: "Explore More",
                        size: 18.sp,
                        textf: FontWeight.bold,
                      ),
                      AppText(
                        text: "See all >",
                        size: 18.sp,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  height: 150.h,
                  width: double.maxFinite,
                  margin: const EdgeInsets.only(left: 10),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                BlocProvider.of<AppCubits>(context)
                                    .detailspage(info[index]);
                              },
                              child: Container(
                                margin: const EdgeInsets.all(5),
                                height: 80.h,
                                width: 80.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.r),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        "http://mark.bslmeiyu.com/uploads/${info[index].imge}",
                                      ),
                                      fit: BoxFit.fill,
                                    )),
                              ),
                            ),
                            AppText(
                              text: info.elementAt(index).name,
                            ),
                          ],
                        );
                      }),
                ),
              ],
            ),
          );
        } else {
          return Container();
        }
      }),
    );
  }
}
