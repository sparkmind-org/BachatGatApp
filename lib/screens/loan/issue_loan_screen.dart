import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../widgets/custom_footer.dart';
import '../../../../routes/route.dart';
import 'package:go_router/go_router.dart'; // Ensure the path is correct

class IssueLoanScreen extends StatefulWidget {
  const IssueLoanScreen({super.key});

  @override
  IssueLoanScreenState createState() => IssueLoanScreenState();
}

class IssueLoanScreenState extends State<IssueLoanScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _accountNumberController = TextEditingController(text: '2481049815242');
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _interestRateController = TextEditingController(text: '2.0 %');
  final TextEditingController _amountController = TextEditingController(text: '₹ 50,000');
  int _selectedIndex = 2;

  // Function to handle date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _dateController.text = DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }

  // Bottom navigation logic
    void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
    final routes = [
      Routes.home,
      Routes.members,
      Routes.add,
      Routes.reports,
      Routes.menu,
    ];
    
    if (index >= 0 && index < routes.length) {
      context.go(routes[index]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Issue Loan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    'Issue Loan Members',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Account Number
                TextFormField(
                  controller: _accountNumberController,
                  decoration: const InputDecoration(
                    labelText: 'Acc No',
                    border: OutlineInputBorder(),
                  ),
                  readOnly: true,
                ),
                const SizedBox(height: 16),

                // Date Field
                TextFormField(
                  controller: _dateController,
                  decoration: InputDecoration(
                    labelText: 'Date',
                    hintText: 'DD/MM/YYYY',
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.calendar_today),
                      onPressed: () => _selectDate(context),
                    ),
                  ),
                  readOnly: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Date cannot be empty';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Rate of Interest
                TextFormField(
                  controller: _interestRateController,
                  decoration: const InputDecoration(
                    labelText: 'Rate of interest',
                    border: OutlineInputBorder(),
                  ),
                  readOnly: true,
                ),
                const SizedBox(height: 16),

                // Amount Field
                TextFormField(
                  controller: _amountController,
                  decoration: const InputDecoration(
                    labelText: 'Amount',
                    border: OutlineInputBorder(),
                  ),
                  readOnly: true,
                ),
                const SizedBox(height: 32),

                // Buttons: Save and Cancel
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Logic to handle save action
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 12),
                      ),
                      child: const Text('Save'),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 12),
                        side: const BorderSide(color: Colors.red),
                      ),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Active Loans Overview Table
                const Text(
                  'Active Loans Overview',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),

                // Data Table for Active Loans
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: const [
                      DataColumn(label: Text('Loan Money')),
                      DataColumn(label: Text('Left to repay')),
                      DataColumn(label: Text('Duration')),
                      DataColumn(label: Text('Interest rate')),
                      DataColumn(label: Text('Installment')),
                    ],
                    rows: const [
                      DataRow(cells: [
                        DataCell(Text('₹ 1,00,000')),
                        DataCell(Text('₹ 47,000')),
                        DataCell(Text('5 Month')),
                        DataCell(Text('12 %')),
                        DataCell(Text('₹ 1,500')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('₹ 70,000')),
                        DataCell(Text('₹ 7,000')),
                        DataCell(Text('11 Month')),
                        DataCell(Text('12 %')),
                        DataCell(Text('₹ 1,000')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('₹ 2,00,000', style: TextStyle(color: Colors.green))),
                        DataCell(Text('₹ 0', style: TextStyle(color: Colors.green))),
                        DataCell(Text('42 Month')),
                        DataCell(Text('12 %')),
                        DataCell(Text('₹ 2,000')),
                      ]),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
     bottomNavigationBar: CustomFooter(
        currentIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}