import 'package:flutter/material.dart';
import 'package:youapp_frontend/core/core.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return const DefaultScaffold(
      body: Center(
        child: Text('Profile Screen'),
      ),
    );
  }
}
