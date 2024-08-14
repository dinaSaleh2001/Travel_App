import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25.sp,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              icon: Icon(
                Icons.settings,
                size: 25.sp,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(16.0),
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
                      backgroundImage:
                          const NetworkImage('assets/images/person.jfif'),
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      'Dina Saleh',
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      'dinasaleh@gmail.com',
                      style: TextStyle(fontSize: 15.sp, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 18.sp,
                      ),
                      label: Text(
                        'Edit Profile',
                        style: TextStyle(fontSize: 18.sp, color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[500],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.h),
              ListTile(
                leading: Icon(
                  Icons.lock,
                  color: Colors.blue,
                  size: 20.sp,
                ),
                title: Text(
                  'Change Password',
                  style: TextStyle(fontSize: 18.sp),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 20.sp,
                ),
                onTap: () {},
              ),
              const Divider(),
              ListTile(
                leading: Icon(
                  Icons.exit_to_app,
                  color: Colors.red,
                  size: 20.sp,
                ),
                title: Text(
                  'Logout',
                  style: TextStyle(fontSize: 20.sp),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 20.sp,
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
