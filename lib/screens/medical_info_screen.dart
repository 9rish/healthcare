import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MedicalInfoScreen extends StatefulWidget {
  const MedicalInfoScreen({super.key});

  @override
  _MedicalInfoScreenState createState() => _MedicalInfoScreenState();
}

class _MedicalInfoScreenState extends State<MedicalInfoScreen> {
  final _formKey = GlobalKey<FormState>();
  final _ageController = TextEditingController();
  final _weightController = TextEditingController();
  final _heightController = TextEditingController();
  // Other controllers for remaining fields

  Future<void> _saveMedicalInfo() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('age', _ageController.text);
    await prefs.setString('weight', _weightController.text);
    await prefs.setString('height', _heightController.text);
    // Save other fields similarly

    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Medical Info')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            TextFormField(
              controller: _ageController,
              decoration: InputDecoration(labelText: 'Age'),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: _weightController,
              decoration: InputDecoration(labelText: 'Weight'),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: _heightController,
              decoration: InputDecoration(labelText: 'Height'),
              keyboardType: TextInputType.number,
            ),
            // Add similar fields for other medical info
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveMedicalInfo,
              child: Text('Save Medical Info'),
            ),
          ],
        ),
      ),
    );
  }
}