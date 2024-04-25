import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_eye/Common/Models/Classes/Child.dart';
import 'package:the_eye/Common/Models/Classes/Parent.dart';
import 'package:the_eye/Constants/Colors.dart';
import 'package:the_eye/Pages/Parent/Parent%20Home/Widgets/Child%20Selection%20Button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../Common/Firebase/Firestore/get child.dart';

class ChildrenAccounts extends StatefulWidget {
  @override
  _ChildrenAccountsState createState() => _ChildrenAccountsState();
}

class _ChildrenAccountsState extends State<ChildrenAccounts> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  List<Child> children = [];
  Parent? parent;

  @override
  void initState() {
    super.initState();
    fetchChildren();
  }

  Future<void> fetchChildren() async {
    print('fetchChildren started');
    final User? user = auth.currentUser;
    if (user == null) {
      print('User is null');
      return;
    }
    try {
      final parentDoc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
      if (!parentDoc.exists) {
        print('Parent document does not exist');
        return;
      }
      final parentData = parentDoc.data();
      if (parentData == null) {
        print('Parent data is null');
        return;
      }
      parent = Parent.fromMap(parentData);
      final childrenIds = List<String>.from(parentData['children'] ?? []);

      await Future.wait(childrenIds.map((childId) async {
        final childDoc = await FirebaseFirestore.instance.collection('users').doc(childId).get();
        if (childDoc.exists) {
          final childData = childDoc.data();
          if (childData != null) {
            children.add(Child.fromMap(childData));
          }
        }
      }));

      print('fetchChildren completed');
      setState(() {});
    } catch (e) {
      print('Error fetching children: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    print('Building ChildrenAccounts');
    print('Number of children: ${children.length}');
    if (parent == null) {
      return CircularProgressIndicator();
    }

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 15.w),
          padding: EdgeInsets.all(15.r),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.black,
              width: 1.5,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: children.map((child) {
              print('Building ChildSelectionButton for child ${child.id}');
              return ChildSelectionButton(parent: parent!, child: child);
            }).toList(),
          ),
        ),
        Positioned(
          top: -10,
          left: 25.w,
          child: Text(
            ' Children Accounts',
            style: TextStyle(
              color: textColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              backgroundColor: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
