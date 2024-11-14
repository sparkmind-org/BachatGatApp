import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../widgets/custom_footer.dart'; // Ensure the path is correct

class LoanCollectionScreen extends StatefulWidget {
  const LoanCollectionScreen({Key? key}) : super(key: key);

  @override
  _LoanCollectionScreenState createState() => _LoanCollectionScreenState();
}

class _LoanCollectionScreenState extends State<LoanCollectionScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _accountNumberController = TextEditingController(text: '2481049815242');
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _emiController = TextEditingController(text: '₹ 5,000');
  final TextEditingController _dueController = TextEditingController(text: '₹ 50,000');
  final TextEditingController _totalAmountController = TextEditingController(text: '₹ 50,000');
  final TextEditingController _interestRateController = TextEditingController(text: '12 %');
  final TextEditingController _remainingAmountController = TextEditingController(text: '₹ 50,000');
  int _selectedIndex = 2;
  bool isLoanSelected = true;

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
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/home');
        break;
      case 1:
        Navigator.pushNamed(context, '/members');
        break;
      case 2:
        Navigator.pushNamed(context, '/add');
        break;
      case 3:
        Navigator.pushNamed(context, '/reports');
        break;
      case 4:
        Navigator.pushNamed(context, '/menu');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Collection Entry'),
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
                    'Collection Entry Details',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Toggle Buttons for Saving / Loan
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isLoanSelected = false;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isLoanSelected ? Colors.grey[300] : Colors.blue,
                      ),
                      child: const Text('Saving'),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isLoanSelected = true;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isLoanSelected ? Colors.blue : Colors.grey[300],
                      ),
                      child: const Text('Loan'),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Common Form Fields
                TextFormField(
                  controller: _accountNumberController,
                  decoration: const InputDecoration(
                    labelText: 'Acc No',
                    border: OutlineInputBorder(),
                  ),
                  readOnly: true,
                ),
                const SizedBox(height: 16),

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

                TextFormField(
                  controller: _emiController,
                  decoration: const InputDecoration(
                    labelText: 'EMI',
                    border: OutlineInputBorder(),
                  ),
                  readOnly: true,
                ),
                const SizedBox(height: 16),

                TextFormField(
                  controller: _dueController,
                  decoration: const InputDecoration(
                    labelText: 'DUE',
                    border: OutlineInputBorder(),
                  ),
                  readOnly: true,
                ),
                const SizedBox(height: 16),

                TextFormField(
                  controller: _totalAmountController,
                  decoration: const InputDecoration(
                    labelText: 'Total Amount',
                    border: OutlineInputBorder(),
                  ),
                  readOnly: true,
                ),
                const SizedBox(height: 16),

                // Additional Fields for Loan Form Only
                if (isLoanSelected) ...[
                  TextFormField(
                    controller: _interestRateController,
                    decoration: const InputDecoration(
                      labelText: 'Rate of Interest',
                      border: OutlineInputBorder(),
                    ),
                    readOnly: true,
                  ),
                  const SizedBox(height: 16),
                  
                  TextFormField(
                    controller: _remainingAmountController,
                    decoration: const InputDecoration(
                      labelText: 'Remaining Amount',
                      border: OutlineInputBorder(),
                    ),
                    readOnly: true,
                  ),
                  const SizedBox(height: 32),
                ],

                // Save and Cancel Buttons
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
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                      ),
                      child: const Text('Save'),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
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

                // Recent Collection Report Table
                const Text(
                  'Recent Collection Report',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),

                // Data Table for Recent Collection Report
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: const [
                      DataColumn(label: Text('Loan Money')),
                      DataColumn(label: Text('Left to repay')),
                      DataColumn(label: Text('Date')),
                    ],
                    rows: const [
                      DataRow(cells: [
                        DataCell(Text('₹ 1,00,000')),
                        DataCell(Text('₹ 47,000')),
                        DataCell(Text('20-OCT-2024')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('₹ 2,50,000')),
                        DataCell(Text('₹ 1,27,000')),
                        DataCell(Text('20-OCT-2022')),
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
        onItemTapped: (index) {
          _onItemTapped(index);
        },
      ),
    );
  }
}
