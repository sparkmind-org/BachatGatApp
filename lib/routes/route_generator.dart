import 'package:flutter/material.dart';

// Import all your screens
import '../screens/login/login_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/members/members_list_screen.dart';
import '../screens/add/add_screen.dart';
import '../screens/add/member_add/add_member_screen.dart';
import '../screens/loan/issue_loan_screen.dart';
import '../screens/loan/loan_collection_screen.dart';
import '../screens/reports/reports_screen.dart';
import '../screens/menu/menu_screen.dart';
import '../screens/add/addtilescreen/issue_notice_screen.dart';
import '../screens/add/addtilescreen/loan_emi_screen.dart';
import '../screens/add/addtilescreen/bank_details_screen.dart';
import '../screens/add/addtilescreen/schedule_meeting/schedule_meeting_screen.dart';
//import '../screens/add/addtilescreen/meeting_schedule_screen.dart';

import '../screens/add/addtilescreen/income_expense_screen.dart';
import '../screens/add/addtilescreen/dividend_repay_screen.dart';
import '../screens/add/addtilescreen/fine_collection_screen.dart';
import '../screens/add/addtilescreen/saving_collection_screen.dart';
import '../screens/reports/reportcard/loan_distribution_screen.dart';
import '../screens/reports/reportcard/pending_loan_emi_screen.dart';
import '../screens/reports/reportcard/pending_saving_emi_screen.dart';
import '../screens/reports/reportcard/other_expenses_screen.dart';
import '../screens/reports/reportcard/other_income_screen.dart';
import '../screens/reports/reportcard/balance_sheet_bachat_screen.dart';
import '../screens/reports/reportcard/balance_sheet_members_screen.dart';
import '../screens/reports/reportcard/loan_risk_validation_screen.dart';
import '../screens/notification/notification_screen.dart';
import '/error/error_screen.dart'; // For unknown routes

export 'route_generator.dart';


class RouteGenerator {
  // Route name constants
  static const String login = '/';
  static const String home = '/home';
  static const String members = '/members';
  static const String add = '/add';
  static const String addMember = '/add-member';
  static const String issueLoan = '/issue-loan';
  static const String loanCollection = '/loan-collection';
  static const String reports = '/reports';
  static const String menu = '/menu';
  static const String notifications = '/notification';
  static const String addBankDetails = '/add-bank-details';
  static const String issueNotice = '/issue-notice';
  static const String addSaving = '/add-saving';
  static const String addIncomeExpense = '/add-income-expense';
  static const String addDividend = '/add-dividend';
  static const String addMeeting = '/add-meeting';
  static const String addLoanEmi = '/add-loan-emi';
  static const String addFine = '/add-fine';
  static const String loanDistribution = '/loan-distribution';
  static const String pendingSavingEmi = '/pending-saving-emi';
  static const String pendingLoanEmi = '/pending-loan-emi';
  static const String otherExpenses = '/other-expenses';
  static const String otherIncome = '/other-income';
  static const String balanceSheetBachat = '/balance-sheet-bachat';
  static const String balanceSheetMembers = '/balance-sheet-members';
  static const String loanRiskValidation = '/loan-risk-validation';

  // Route generator function
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case members:
        return MaterialPageRoute(builder: (_) => const MembersListScreen());
      case add:
        return MaterialPageRoute(builder: (_) => const AddScreen());
      case addMember:
        return MaterialPageRoute(builder: (_) => const AddMemberScreen());
      case issueLoan:
        return MaterialPageRoute(builder: (_) => const IssueLoanScreen());
      case loanCollection:
        return MaterialPageRoute(builder: (_) => const LoanCollectionScreen());
      case reports:
        return MaterialPageRoute(builder: (_) => const ReportsScreen());
      case menu:
        return MaterialPageRoute(builder: (_) => const MenuScreen());
      case notifications:
        return MaterialPageRoute(builder: (_) => const NotificationsScreen());
      case addBankDetails:
        return MaterialPageRoute(builder: (_) => const AddBankDetailsScreen());
      case issueNotice:
        return MaterialPageRoute(builder: (_) => const IssueNoticeScreen());
      case addSaving:
        return MaterialPageRoute(builder: (_) => const AddSavingCollectionScreen());
      case addIncomeExpense:
        return MaterialPageRoute(builder: (_) => const AddIncomeExpenseScreen());
      case addDividend:
        return MaterialPageRoute(builder: (_) => const AddDividendRepayScreen());
      case addMeeting:
        return MaterialPageRoute(builder: (_) => const ScheduleMeetingScreen());
      case addLoanEmi:
        return MaterialPageRoute(builder: (_) => const AddLoanEmiScreen());
      case addFine:
        return MaterialPageRoute(builder: (_) => const AddFineCollectionScreen());
      case loanDistribution:
        return MaterialPageRoute(builder: (_) => const LoanDistributionScreen());
      case pendingSavingEmi:
        return MaterialPageRoute(builder: (_) => const PendingSavingEmiScreen());
      case pendingLoanEmi:
        return MaterialPageRoute(builder: (_) => const PendingLoanEmiScreen());
      case otherExpenses:
        return MaterialPageRoute(builder: (_) => const OtherExpensesScreen());
      case otherIncome:
        return MaterialPageRoute(builder: (_) => const OtherIncomeScreen());
      case balanceSheetBachat:
        return MaterialPageRoute(builder: (_) => const BalanceSheetBachatScreen());
      case balanceSheetMembers:
        return MaterialPageRoute(builder: (_) => const BalanceSheetMembersScreen());
      case loanRiskValidation:
        return MaterialPageRoute(builder: (_) => const LoanRiskValidationScreen());
      default:
        // Unknown route fallback
        return _errorRoute();
    }
  }

  // Fallback route for unknown paths
  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => const ErrorScreen(),
    );
  }
}

