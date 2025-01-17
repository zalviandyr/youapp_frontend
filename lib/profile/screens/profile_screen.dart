import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/iconic_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:youapp_frontend/core/core.dart';
import 'package:youapp_frontend/profile/profile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final AuthModel _auth = App.instance.currentUser()!;
  late ProfileBloc _profileBloc;

  @override
  void initState() {
    _profileBloc = BlocProvider.of(context);
    _profileBloc.add(ProfileFetch());

    super.initState();
  }

  void _logoutAction() {
    App.instance.logout();

    context.pushReplacement(AppRoute.login);
  }

  void _saveAboutAction(ProfileModel profile) {
    _profileBloc.add(ProfileSave(profile: profile));
  }

  void _toInterest() {
    context.push(AppRoute.interest);
  }

  void _profileListener(BuildContext context, ProfileState state) {
    if (state is ProfileLoading) {
      SmartDialog.showLoading();
    }

    if (state is ProfileSaveSuccess ||
        state is ProfileFetchSuccess ||
        state is ProfileError) {
      SmartDialog.dismiss();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(
      listener: _profileListener,
      child: DefaultScaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.transparent,
              automaticallyImplyLeading: false,
              centerTitle: true,
              title: Text(
                '@${_auth.username}',
                style: const TextStyle(
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
            About(onSave: _saveAboutAction),
            SliverToBoxAdapter(child: SizedBox(height: 15.h)),
            Interest(onEdit: _toInterest),
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
