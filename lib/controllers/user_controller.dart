import 'package:apple/models/user_model.dart';
import 'package:apple/providers/user_provider.dart';
import 'package:apple/utils/custom_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class UserController {
  CollectionReference userCollection =
      FirebaseFirestore.instance.collection('Users');

  Future<void> saveUserData(BuildContext context) async {
    try {
      final user = Provider.of<UserProvider>(context, listen: false).user;
      await userCollection.doc(user!.uid).set(user.toJson());
      Logger().f("User Data Saved");
      CustomDialog.dismissLoader();
    } catch (e) {
      if (context.mounted) {
        CustomDialog.showDialog(context,
            title: 'Something went wrong', content: e.toString());
      }
      CustomDialog.dismissLoader();
    }
  }

  Future<void> fetchUserData(BuildContext context) async {
    try {
      final uid = FirebaseAuth.instance.currentUser!.uid;
      Logger().f(uid);
      await Future.delayed(const Duration(seconds: 2));
      final userData = await userCollection.doc(uid).get();
      Logger().f(userData.data());
      UserModel user =
          UserModel.fromJson(userData.data() as Map<String, dynamic>);
      if (context.mounted) {
        Provider.of<UserProvider>(context, listen: false).setUser(user);
      }
    } catch (e) {
      Logger().e(e);
    }
  }
}
