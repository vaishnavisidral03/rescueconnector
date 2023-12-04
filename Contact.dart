import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  late TextEditingController _phoneNumberController;

  @override
  void initState() {
    super.initState();
    _phoneNumberController = TextEditingController();
  }

  @override
  void dispose() {
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: const Text('Contact Page'), // Set a default title or leave it empty
      ),
      body: Builder(
        builder: (BuildContext context) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: _phoneNumberController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: 'Enter phone number',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () async {
                      final phoneNumber = _phoneNumberController.text.trim();
                      if (phoneNumber.isEmpty || phoneNumber.length < 10) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content:
                              Text('Please enter a valid phone number')),
                        );
                      } else {
                        if (!await launch('tel:$phoneNumber')) {
                          throw 'Could not launch';
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue, // Set button background color here
                    ),
                    child: const Text(
                      'CALL',
                      style:
                      TextStyle(color: Colors.white), // Set text color here
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () async {
                      final phoneNumber = _phoneNumberController.text.trim();
                      if (phoneNumber.isEmpty || phoneNumber.length < 10) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content:
                              Text('Please enter a valid phone number')),
                        );
                      } else {
                        if (!await launch('sms:$phoneNumber')) {
                          throw 'Could not launch';
                        }
                      }
        },
        style: ElevatedButton.styleFrom(
                      primary: Colors.blue, // Set button background color here
                    ),
                    child: const Text(
                      'SMS',
                      style:
                      TextStyle(color: Colors.white), // Set text color here
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
