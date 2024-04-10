import 'package:apple/screens/homepage/profile/admin_view/admin_view.dart';
import 'package:apple/screens/homepage/profile/profile_update/profile_update.dart';
import 'package:apple/utils/custom_navigator.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            CustomNavigator.push(context, const AdminView());
          },
          child: const Icon(Icons.admin_panel_settings)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: size.width,
            height: 180,
            child: Stack(
              children: [
                Container(
                  width: size.width,
                  height: 140,
                  decoration: const BoxDecoration(
                      color: Colors.grey,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://images.wallpapersden.com/image/download/abstract-shapes-2021-minimalist_bG1lZm6UmZqaraWkpJRmbmdmrWZlbWY.jpg'))),
                ),
                const Align(
                  alignment: Alignment.bottomCenter,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                        'https://static-00.iconduck.com/assets.00/profile-circle-icon-2048x2048-cqe5466q.png'),
                  ),
                ),
                const SafeArea(child: BackButton(color: Colors.white)),
              ],
            ),
          ),
          Text(
            "Nimal Karunarathne",
            style: TextStyle(
                fontSize: 22,
                color: Colors.grey.shade800,
                fontWeight: FontWeight.w600),
          ),
          Text(
            "nimal@gmail.com",
            style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w400),
          ),
          FilledButton(
              onPressed: () {
                CustomNavigator.push(context, const ProfileUpdate());
              },
              child: const Text("Edit Profile"))
        ],
      ),
    );
  }
}
