import 'package:flutter/material.dart';
import '../screens/login/login_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/members/members_list_screen.dart';
import '../screens/add/member_add_screen.dart/add_member_screen.dart';
import '../screens/loan/issue_loan_screen.dart';
import '../screens/loan/loan_collection_screen.dart';
import '../screens/reports/reports_screen.dart';
import '../screens/menu/menu_screen.dart';
import '../screens/add/add_screen.dart';
import '../screens/add/addtilescreen/issue_notice_screen.dart';
import '../screens/add/addtilescreen/loan_emi_screen.dart';
import '../screens/add/addtilescreen/bank_details_screen.dart';
import '../screens/add/addtilescreen/meeting_schedule_screen.dart';
import '../screens/add/addtilescreen/income_expense_screen.dart';
import '../screens/add/addtilescreen/dividend_repay_screen.dart';
import '../screens/add/addtilescreen/fine_collection_screen.dart';
import '../screens/add/addtilescreen/saving_collection_screen.dart';

import '../screens/notification/notification_screen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => const LoginScreen(),
  '/home': (context) => const HomeScreen(),
  '/members': (context) => const MembersListScreen(),
  '/add': (context) => const AddScreen(),
  '/add-member': (context) => const AddMemberScreen(),
  '/issue-loan': (context) => const IssueLoanScreen(),
  '/loan-collection': (context) => const LoanCollectionScreen(),
  '/reports': (context) => const ReportsScreen(),
  '/menu': (context) => const MenuScreen(),
  '/notification': (context) => const NotificationsScreen(),
  '/add-bank-details': (context) => const AddBankDetailsScreen(),
  '/issue-notice': (context) => const IssueNoticeScreen(),
  '/add-saving': (context) => const AddSavingCollectionScreen(),
  '/add-income-expense': (context) => const AddIncomeExpenseScreen(),
  '/add-dividend': (context) => const AddDividendRepayScreen(),
  '/add-meeting': (context) => const ScheduleMeetingScreen(),
  '/add-loan-emi': (context) => const AddLoanEmiScreen(),
  '/add-fine': (context) => const AddFineCollectionScreen(),



};
