import 'package:flutter/material.dart';

class ProneAreaPage extends StatefulWidget {
  const ProneAreaPage({Key? key}) : super(key: key);

  @override
  _ProneAreaPageState createState() => _ProneAreaPageState();
}

class _ProneAreaPageState extends State<ProneAreaPage> {
  List<Map<String, List<String>>> proneAreas = [];

  @override
  void initState() {
    super.initState();
    // Setting up default prone areas
    _setDefaultProneAreas();
  }

  void _setDefaultProneAreas() {
    // Prone Area 1
    List<String> proneArea1Hospitals = ['Hospital A', 'Hospital B', 'Hospital C'];

    Map<String, List<String>> proneArea1 = {
      'Hospitals': proneArea1Hospitals,
    };

    // Prone Area 2
    List<String> proneArea2Hospitals = ['Hospital X', 'Hospital Y', 'Hospital Z'];

    Map<String, List<String>> proneArea2 = {
      'Hospitals': proneArea2Hospitals,
    };

    // Adding default prone areas to the list
    proneAreas.add(proneArea1);
    proneAreas.add(proneArea2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prone Area Page'),
      ),
      backgroundColor: Colors.grey[200],
      body: ListView.builder(
        itemCount: proneAreas.length,
        itemBuilder: (context, index) {
          return _buildProneArea(
            title: 'Prone Area ${index + 1}',
            hospitals: proneAreas[index]['Hospitals']!,
          );
        },
      ),
    );
  }

  Widget _buildProneArea({
    required String title,
    required List<String> hospitals,
  }) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: Colors.white,
      child: ExpansionTile(
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.indigo,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        children: [
          _buildSection(title: 'Hospitals', departments: hospitals),
          _buildSendAlertButton(),
        ],
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required List<String> departments,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.indigo,
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
        ),
        for (var department in departments)
          ListTile(
            title: Text(department),
          ),
      ],
    );
  }

  Widget _buildSendAlertButton() {
    return ElevatedButton(
      onPressed: () {
        _showAlert();
      },
      child: const Text('Send Alert'),
    );
  }

  void _showAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alert Sent'),
          content: const Text('Alert has been sent!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
