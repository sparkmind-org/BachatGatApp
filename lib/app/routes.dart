import 'package:flutter/material.dart';
import '../screens/login/login_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/members/members_list_screen.dart';
import '../screens/members/add_member_screen.dart';
import '../screens/loan/issue_loan_screen.dart';
import '../screens/loan/loan_collection_screen.dart';
import '../screens/reports/reports_screen.dart';
import '../screens/menu/menu_screen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => const LoginScreen(),
  '/home': (context) => const HomeScreen(),
  '/members': (context) => const MembersListScreen(),
  '/add-member': (context) => const AddMemberScreen(),
  '/issue-loan': (context) => const IssueLoanScreen(),
  '/loan-collection': (context) => const LoanCollectionScreen(),
  '/reports': (context) => const ReportsScreen(),
  '/menu': (context) => const MenuScreen(),
};
