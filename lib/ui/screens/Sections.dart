import 'package:flutter/material.dart';

class Sections extends StatefulWidget {
  const Sections({super.key});

  @override
  _SectionsState createState() => _SectionsState();
}

class _SectionsState extends State<Sections> {
  Map<String, bool> sectionStates = {
    'Personal Details': false,
    'Languages': false,
    'Education': false,
    'Experience': false,
    'Skills': false,
    'References': false,
    'Interests': false,
  };

  void _handleSectionToggle(String section, bool value) {
    setState(() {
      sectionStates[section] = value;
    });
  }

  void _handleSubmit() {
    // Handle submission logic using sectionStates
    print(sectionStates);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CV Sections'),
      ),
      body: ListView(
        children: sectionStates.keys.map((section) {
          return ListTile(
            leading: Icon(Icons.person), // Replace with appropriate icons
            title: Text(section),
            trailing: Switch(
              thumbIcon: MaterialStateProperty.all(const Icon(Icons.check)),
              value: sectionStates[section]!,
              onChanged: (bool value) {
                _handleSectionToggle(section, value);
              },
            ),
          );
        }).toList()
          ..add(
            ListTile(
              title: ElevatedButton(
                onPressed: _handleSubmit,
                child: const Text('Submit'),
              ),
            ) ,
          ),
      ),
    );
  }
}