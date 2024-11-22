import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
import '../../../widgets/custom_footer.dart'; // Ensure this import path is correct

class AddMemberScreen extends StatefulWidget {
  const AddMemberScreen({super.key});

  @override
  AddMemberScreenState createState() => AddMemberScreenState();
}

class AddMemberScreenState extends State<AddMemberScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  int _selectedIndex = 2; // Index for the 'Add' screen in bottom navigation

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
        title: const Text('Member Add'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FormBuilder(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    'ADD MEMBER DETAILS',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Name Field
                FormBuilderTextField(
                  name: 'name',
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    hintText: 'Enter your name',
                    border: OutlineInputBorder(),
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.minLength(3),
                  ]),
                ),
                const SizedBox(height: 16),

                // Role Dropdown
                FormBuilderDropdown<String>(
                  name: 'role',
                  decoration: const InputDecoration(
                    labelText: 'Role',
                    border: OutlineInputBorder(),
                  ),
                  items: ['Admin', 'Member']
                      .map((role) => DropdownMenuItem(
                            value: role,
                            child: Text(role),
                          ))
                      .toList(),
                  validator: FormBuilderValidators.required(),
                ),
                const SizedBox(height: 16),

                // Date Field
                FormBuilderDateTimePicker(
                  name: 'date',
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                  format: DateFormat('dd/MM/yyyy'),
                  inputType: InputType.date,
                  decoration: const InputDecoration(
                    labelText: 'Date',
                    hintText: 'DD/MM/YYYY',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                  validator: FormBuilderValidators.required(),
                ),
                const SizedBox(height: 16),

                // Mobile Number
                FormBuilderTextField(
                  name: 'mobile',
                  decoration: const InputDecoration(
                    labelText: 'Mob No',
                    hintText: 'Enter your mobile number',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.phone,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.numeric(),
                    FormBuilderValidators.minLength(10),
                  ]),
                ),
                const SizedBox(height: 16),

                // Address Field
                FormBuilderTextField(
                  name: 'address',
                  decoration: const InputDecoration(
                    labelText: 'Address',
                    hintText: 'Enter your address',
                    border: OutlineInputBorder(),
                  ),
                  validator: FormBuilderValidators.required(),
                ),
                const SizedBox(height: 16),

                // Email ID
                FormBuilderTextField(
                  name: 'email',
                  decoration: const InputDecoration(
                    labelText: 'Email ID',
                    hintText: 'Enter your email address',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.email(),
                  ]),
                ),
                const SizedBox(height: 16),

                // Password Field
                FormBuilderTextField(
                  name: 'password',
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.minLength(6),
                  ]),
                ),
                const SizedBox(height: 16),

                // Document Upload Field
                FormBuilderTextField(
                  name: 'document',
                  decoration: const InputDecoration(
                    labelText: 'Upload Doc',
                    hintText: 'Choose File',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.attach_file),
                  ),
                  readOnly: true,
                  onTap: () {
                    // Logic for file picker can be added here
                  },
                ),
                const SizedBox(height: 32),

                // Buttons: Save and Cancel
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.saveAndValidate()) {
                          final formData = _formKey.currentState!.value;
                          // Process formData
                          print('Form Data: $formData');
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
