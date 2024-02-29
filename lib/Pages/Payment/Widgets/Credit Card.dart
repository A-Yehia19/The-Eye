import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:multi_value_listenable_builder/multi_value_listenable_builder.dart';

import '../Data/Variables.dart';

class CreditCard extends StatelessWidget {
  const CreditCard({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiValueListenableBuilder(
      valueListenables: [
        cardNumber,
        expiryDate,
        cardHolderName,
        cvvCode,
        isCvvFocused,],
      builder:(context, values, child) => CreditCardWidget(
        enableFloatingCard: true,
        cardNumber: cardNumber.value,
        expiryDate: expiryDate.value,
        cardHolderName: cardHolderName.value,
        cvvCode: cvvCode.value,
        bankName: 'CREDIT CARD',
        showBackView: isCvvFocused.value,
        isHolderNameVisible: true,
        obscureCardCvv: false,
        obscureCardNumber: false,
        isSwipeGestureEnabled: true,
        backgroundImage: 'assets/images/bg-dark.png',
        customCardTypeIcons: <CustomCardTypeIcon>[
          CustomCardTypeIcon(
            cardType: CardType.mastercard,
            cardImage: Image.asset(
              'assets/icons/mastercard.png',
              height: 48,
              width: 48,
            ),
          ),
          CustomCardTypeIcon(
            cardType: CardType.visa,
            cardImage: Image.asset(
              'assets/icons/visa.png',
              height: 48,
              width: 48,
            ),
          ),
        ],
        onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
      ),
    );
  }
}
