import 'package:flutter/material.dart';

class CreditStatus {
  final String status;
  final Color color;

  const CreditStatus({required this.status, required this.color});

  static CreditStatus fromScore(int score) {
    if (score >= 750) {
      return const CreditStatus(status: 'Excellent', color: Colors.green);
    } else if (score >= 700) {
      return const CreditStatus(status: 'Good', color: Colors.blue);
    } else if (score >= 650) {
      return const CreditStatus(status: 'Fair', color: Colors.orange);
    }
    return const CreditStatus(status: 'Poor', color: Colors.red);
  }
}