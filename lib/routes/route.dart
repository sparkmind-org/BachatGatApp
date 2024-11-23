import 'package:go_router/go_router.dart';

// Import all screens
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
import '../error/error_screen.dart';

// Route names as constants
class Routes {
  static const login = '/';
  static const home = '/home';
  static const members = '/members';
  static const add = '/add';
  static const addMember = '/add-member';
  static const issueLoan = '/issue-loan';
  static const loanCollection = '/loan-collection';
  static const reports = '/reports';
  static const menu = '/menu';
  static const notification = '/notification';
  static const addBankDetails = '/add-bank-details';
  static const issueNotice = '/issue-notice';
  static const addSaving = '/add-saving';
  static const addIncomeExpense = '/add-income-expense';
  static const addDividend = '/add-dividend';
  static const addMeeting = '/add-meeting';
  static const addLoanEmi = '/add-loan-emi';
  static const addFine = '/add-fine';
  static const loanDistribution = '/loan-distribution';
  static const pendingSavingEmi = '/pending-saving-emi';
  static const pendingLoanEmi = '/pending-loan-emi';
  static const otherExpenses = '/other-expenses';
  static const otherIncome = '/other-income';
  static const balanceSheetBachat = '/balance-sheet-bachat';
  static const balanceSheetMembers = '/balance-sheet-members';
  static const loanRiskValidation = '/loan-risk-validation';
}

final router = GoRouter(
  initialLocation: Routes.login,
  errorBuilder: (context, state) => const ErrorScreen(),
  routes: [
    GoRoute(
      path: Routes.login,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: Routes.home,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: Routes.members,
      builder: (context, state) => const MembersListScreen(),
    ),
    GoRoute(
      path: Routes.add,
      builder: (context, state) => const AddScreen(),
    ),
    GoRoute(
      path: Routes.addMember,
      builder: (context, state) => const AddMemberScreen(),
    ),
    GoRoute(
      path: Routes.issueLoan,
      builder: (context, state) => const IssueLoanScreen(),
    ),
    GoRoute(
      path: Routes.loanCollection,
      builder: (context, state) => const LoanCollectionScreen(),
    ),
    GoRoute(
      path: Routes.reports,
      builder: (context, state) => const ReportsScreen(),
    ),
    GoRoute(
      path: Routes.menu,
      builder: (context, state) => const MenuScreen(),
    ),
    GoRoute(
      path: Routes.notification,
      builder: (context, state) => const NotificationsScreen(),
    ),
    GoRoute(
      path: Routes.addBankDetails,
      builder: (context, state) => const AddBankDetailsScreen(),
    ),
    GoRoute(
      path: Routes.issueNotice,
      builder: (context, state) => const IssueNoticeScreen(),
    ),
    GoRoute(
      path: Routes.addSaving,
      builder: (context, state) => const AddSavingCollectionScreen(),
    ),
    GoRoute(
      path: Routes.addIncomeExpense,
      builder: (context, state) => const AddIncomeExpenseScreen(),
    ),
    GoRoute(
      path: Routes.addDividend,
      builder: (context, state) => const AddDividendRepayScreen(),
    ),
    GoRoute(
      path: Routes.addMeeting,
      builder: (context, state) => const ScheduleMeetingScreen(),
    ),
    GoRoute(
      path: Routes.addLoanEmi,
      builder: (context, state) => const AddLoanEmiScreen(),
    ),
    GoRoute(
      path: Routes.addFine,
      builder: (context, state) => const AddFineCollectionScreen(),
    ),
    GoRoute(
      path: Routes.loanDistribution,
      builder: (context, state) => const LoanDistributionScreen(),
    ),
    GoRoute(
      path: Routes.pendingSavingEmi,
      builder: (context, state) => const PendingSavingEmiScreen(),
    ),
    GoRoute(
      path: Routes.pendingLoanEmi,
      builder: (context, state) => const PendingLoanEmiScreen(),
    ),
    GoRoute(
      path: Routes.otherExpenses,
      builder: (context, state) => const OtherExpensesScreen(),
    ),
    GoRoute(
      path: Routes.otherIncome,
      builder: (context, state) => const OtherIncomeScreen(),
    ),
    GoRoute(
      path: Routes.balanceSheetBachat,
      builder: (context, state) => const BalanceSheetBachatScreen(),
    ),
    GoRoute(
      path: Routes.balanceSheetMembers,
      builder: (context, state) => const BalanceSheetMembersScreen(),
    ),
    GoRoute(
      path: Routes.loanRiskValidation,
      builder: (context, state) => const LoanRiskValidationScreen(),
    ),
  ],
);