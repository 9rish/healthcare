import 'package:flutter/material.dart';
import 'medical_info_screen.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({super.key});

  @override
  _PersonalInfoScreenState createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  int age = 0;
  String email = '';
  String phone = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Personal Information')),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Name'),
                  validator: (value) => value!.isEmpty ? 'Enter your name' : null,
                  onChanged: (value) => name = value,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Age'),
                  validator: (value) => value!.isEmpty ? 'Enter your age' : null,
                  keyboardType: TextInputType.number,
                  onChanged: (value) => age = int.parse(value),
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Email'),
                  validator: (value) => value!.isEmpty ? 'Enter your email' : null,
                  onChanged: (value) => email = value,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Phone'),
                  validator: (value) => value!.isEmpty ? 'Enter your phone number' : null,
                  onChanged: (value) => phone = value,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Navigate to Medical Information Screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MedicalInfoScreen()),
                      );
                    }
                  },
                  child: const Text('Next'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
