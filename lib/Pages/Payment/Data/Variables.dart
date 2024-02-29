import 'package:flutter/material.dart';

ValueNotifier<String> cardNumber = ValueNotifier<String>('');
ValueNotifier<String> expiryDate = ValueNotifier<String>('');
ValueNotifier<String> cardHolderName = ValueNotifier<String>('');
ValueNotifier<String> cvvCode = ValueNotifier<String>('');
ValueNotifier<bool> isCvvFocused = ValueNotifier<bool>(false);

final GlobalKey<FormState> formKey = GlobalKey<FormState>();
double price = 0.0;
