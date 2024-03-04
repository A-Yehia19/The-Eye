import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Common/Widgets/Back.dart';
import '../../Common/Widgets/button_widget.dart';
import 'Data/Variables.dart';
import 'Widgets/Credit Card.dart';
import 'Widgets/Credit Form.dart';
import 'Widgets/Payment Options.dart';

class Payment extends StatelessWidget {
  const Payment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Align(alignment: Alignment.topLeft, child: Back()),
                const CreditCard(),
                const CreditForm(),
                SizedBox(height: 25.h),
                const PaymentOptions(),
                SizedBox(height: 20.h),
                const CustomButton(
                  onPressed: checkout,
                  child: Text('Checkout',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20)
                  ),
                ),
                SizedBox(height: 10.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

checkout() {
  if (formKey.currentState?.validate() ?? false || price > 0) {
    formKey.currentState?.save();
    print('Validated');
  }
}