import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

import '../Data/Variables.dart';

class CreditForm extends StatelessWidget {
  const CreditForm({super.key});

  @override
  Widget build(BuildContext context) {
    return CreditCardForm(
      formKey: formKey,
      cardNumber: '',
      expiryDate: '',
      cardHolderName: '',
      cvvCode: '',
      isHolderNameVisible: true,
      isCardNumberVisible: true,
      isExpiryDateVisible: true,
      inputConfiguration: const InputConfiguration(
        cardNumberDecoration: InputDecoration(
          labelText: 'Card Number',
          hintText: 'XXXX XXXX XXXX XXXX',
          prefixIcon: Icon(Icons.credit_card),
        ),
        expiryDateDecoration: InputDecoration(
          labelText: 'Expiry Date',
          hintText: 'XX/XX',
        ),
        cvvCodeDecoration: InputDecoration(
          labelText: 'CVV',
          hintText: 'XXX',
          prefixIcon: Icon(Icons.lock),
        ),
        cardHolderDecoration: InputDecoration(
          labelText: 'Card Holder',
          prefixIcon: Icon(Icons.person),
        ),
      ),
      onCreditCardModelChange: onCreditCardModelChange,
    );
  }
}

void onCreditCardModelChange(CreditCardModel creditCardModel) {
  cardNumber.value = creditCardModel.cardNumber;
  expiryDate.value = creditCardModel.expiryDate;
  cardHolderName.value = creditCardModel.cardHolderName;
  cvvCode.value = creditCardModel.cvvCode;
  isCvvFocused.value = creditCardModel.isCvvFocused;
}