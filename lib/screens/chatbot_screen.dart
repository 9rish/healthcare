import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({super.key});

  @override
  _ChatbotScreenState createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  final TextEditingController _controller = TextEditingController();
  String _response = "";

  Future<void> sendVoiceCommand(String query) async {
    final url = Uri.parse('http://127.0.0.1:5000/chatbot');  // Replace with your server's IP
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: json.encode({"query": query}),
    );
    if (response.statusCode == 200) {
      setState(() {
        _response = json.decode(response.body)['response'];
      });
    } else {
      setState(() {
        _response = "Error connecting to server.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chatbot Assistant")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: "Enter your query"),
            ),
            ElevatedButton(
              onPressed: () {
                sendVoiceCommand(_controller.text);
              },
              child: Text("Send"),
            ),
            SizedBox(height: 20),
            Text(
              _response,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
