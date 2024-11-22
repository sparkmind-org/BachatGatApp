import 'package:flutter/foundation.dart';

@immutable
class Member {
  final String name;
  final String creditScore;
  final String role;
  final String savings;
  final String loan;
  final String mobile;
  final String profileImage;

  const Member({
    required this.name,
    required this.creditScore,
    required this.role,
    required this.savings,
    required this.loan,
    required this.mobile,
    required this.profileImage,
  });

  factory Member.fromMap(Map<String, dynamic> map) {
    return Member(
      name: map['name']?.toString() ?? '',
      creditScore: map['creditScore']?.toString() ?? '0',
      role: map['role']?.toString() ?? '',
      savings: map['savings']?.toString() ?? '0',
      loan: map['loan']?.toString() ?? '0',
      mobile: map['Mobile']?.toString() ?? '',
      profileImage: map['ProfileImage']?.toString() ?? '',
    );
  }

  Map<String, String> toMap() {
    return {
      'name': name,
      'creditScore': creditScore,
      'role': role,
      'savings': savings,
      'loan': loan,
      'Mobile': mobile,
      'ProfileImage': profileImage,
    };
  }

  Member copyWith({
    String? name,
    String? creditScore,
    String? role,
    String? savings,
    String? loan,
    String? mobile,
    String? profileImage,
  }) {
    return Member(
      name: name ?? this.name,
      creditScore: creditScore ?? this.creditScore,
      role: role ?? this.role,
      savings: savings ?? this.savings,
      loan: loan ?? this.loan,
      mobile: mobile ?? this.mobile,
      profileImage: profileImage ?? this.profileImage,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Member &&
        other.name == name &&
        other.creditScore == creditScore &&
        other.role == role &&
        other.savings == savings &&
        other.loan == loan &&
        other.mobile == mobile &&
        other.profileImage == profileImage;
  }

  @override
  int get hashCode {
    return Object.hash(
      name,
      creditScore,
      role,
      savings,
      loan,
      mobile,
      profileImage,
    );
  }
}