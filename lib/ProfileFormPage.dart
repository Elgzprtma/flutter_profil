import 'package:flutter/material.dart';

class ProfileFormPage extends StatefulWidget {
  final String currentName;
  final String currentClass;
  final String currentSchool;

  ProfileFormPage({
    required this.currentName,
    required this.currentClass,
    required this.currentSchool,
  });

  @override
  _ProfileFormPageState createState() => _ProfileFormPageState();
}

class _ProfileFormPageState extends State<ProfileFormPage> {
  late TextEditingController _nameController;
  late TextEditingController _classController;
  late TextEditingController _schoolController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.currentName);
    _classController = TextEditingController(text: widget.currentClass);
    _schoolController = TextEditingController(text: widget.currentSchool);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _classController.dispose();
    _schoolController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        backgroundColor: Color.fromRGBO(252, 219, 141, 1),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _classController,
              decoration: InputDecoration(labelText: 'Class'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _schoolController,
              decoration: InputDecoration(labelText: 'School'),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, {
                  'name': _nameController.text,
                  'class': _classController.text,
                  'school': _schoolController.text,
                });
              },
              child: Text('Save'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xF9916B0D),
              ),
            ),
          ],
        ),
      ),
    );
  }
}