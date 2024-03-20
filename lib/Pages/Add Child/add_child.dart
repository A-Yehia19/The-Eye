// add_child.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_eye/Common/Widgets/button_widget.dart';
import 'package:the_eye/Pages/Add%20Child/Widgets/choose_content.dart';
import 'package:the_eye/Pages/Add%20Child/Widgets/custom_app_bar.dart';
import 'Widgets/add_child_form.dart';

class AddChild extends StatefulWidget {
  const AddChild({Key? key}) : super(key: key);

  @override
  _AddChildState createState() => _AddChildState();
}

class _AddChildState extends State<AddChild> {
  final GlobalKey<AddChildFormState> formKey =
  GlobalKey(); // Changed to AddChildFormState
  final GlobalKey<ChooseChildContentState> contentKey =
  GlobalKey(); // Changed to ChooseChildContentState

  void submit() {
    final formState = formKey.currentState;
    final contentState = contentKey.currentState;

    if (formState != null && contentState != null) {
      final name = formState.nameController.text;
      final age = formState.ageController.text;
      final password = formState.passwordController.text;
      final gender = formState.selectedGender; // Changed to selectedGender
      final categories = contentState.categories;
      final isSelected = contentState.isSelected;

      // Here you can handle the submission of the data
      // For example, you can print the data
      print('Name: $name');
      print('Age: $age');
      print('Password: $password');
      print('Gender: $gender');
      for (int i = 0; i < categories.length; i++) {
        print('Category: ${categories[i]}, Selected: ${isSelected[i]}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: ListView( // Change Column to ListView
            children: [
              const AddChildAppBar(),
              AddChildForm(key: formKey),
              ChooseChildContent(key: contentKey),
              SizedBox(height: 70.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.w),
                child: CustomButton(
                    onPressed: submit,
                    child: const Text(
                      "Create child account",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}