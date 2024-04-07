import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/iconic_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:youapp_frontend/core/core.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void _logoutAction() {
    context.pushReplacement(AppRoute.login);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            title: const Text(
              '@Profile',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(
                  FontAwesome.logout,
                  size: 20.r,
                  color: Colors.red.withOpacity(.6),
                ),
                onPressed: _logoutAction,
              )
            ],
          ),
          SliverToBoxAdapter(child: SizedBox(height: 15.h)),
          _buildProfilePicture(),
          SliverToBoxAdapter(child: SizedBox(height: 15.h)),
          _buildAbout(),
          SliverToBoxAdapter(child: SizedBox(height: 15.h)),
          _buildInterest(),
        ],
      ),
    );
  }

  Widget _buildAbout() {
    return SliverToBoxAdapter(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 15.w,
          vertical: 15.h,
        ),
        decoration: BoxDecoration(
          color: Pallette.blackPrimary,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'About',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Iconic.pencil,
                    size: 15.r,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30.h),
            const Text('Add in your your to help others know you better'),
          ],
        ),
      ),
    );
  }

  Widget _buildInterest() {
    return SliverToBoxAdapter(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 15.w,
          vertical: 15.h,
        ),
        decoration: BoxDecoration(
          color: Pallette.blackPrimary,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Interest',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Iconic.pencil,
                    size: 15.r,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30.h),
            const Text('Add in your interest to find a better match'),
          ],
        ),
      ),
    );
  }

  Widget _buildProfilePicture() {
    return SliverToBoxAdapter(
      child: Stack(
        children: [
          Container(
            height: 150.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Pallette.blackSecondary,
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
          Positioned(
            bottom: 13.h,
            left: 13.w,
            child: const Text(
              '@Johndoe',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
          ),
          Positioned(
            top: 2.h,
            right: 2.w,
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Iconic.pencil,
                size: 15.r,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
