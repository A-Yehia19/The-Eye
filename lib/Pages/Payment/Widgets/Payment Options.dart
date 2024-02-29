import 'package:flutter/material.dart';
import 'package:the_eye/Constants/Colors.dart';
import 'package:the_eye/Pages/Payment/Data/Variables.dart';

import '../../../Common/Widgets/Custom Radio.dart';

class PaymentOptions extends StatefulWidget {
  const PaymentOptions({super.key});

  @override
  State<PaymentOptions> createState() => _PaymentOptionsState();
}

class _PaymentOptionsState extends State<PaymentOptions> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Row(
              children: [
                CustomRadio(
                  value: 3,
                  groupValue: price,
                  onChanged: (value) =>  setState(() => price = value.toDouble()),
                ),
                const Text('Monthly', style: TextStyle(color: secondaryColor, fontSize: 14),),
              ],
            ),
            const Text('\$3.00', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),),
          ],
        ),
        Column(
          children: [
            Row(
              children: [
                CustomRadio(
                  value: 30,
                  groupValue: price,
                  onChanged: (value) => setState(() => price = value.toDouble()),
                ),
                const Text('Annual', style: TextStyle(color: secondaryColor, fontSize: 14),),
              ],
            ),
            const Text.rich(
              style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
              TextSpan(
                children: [
                  TextSpan(
                    text: '\$36.00',
                    style: TextStyle(decoration: TextDecoration.lineThrough, decorationColor: Colors.white, decorationThickness: 2),
                  ),
                  TextSpan(
                    text: '  \$30.00',
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}