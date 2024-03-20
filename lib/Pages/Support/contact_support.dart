import 'package:flutter/material.dart';

import '../../Common/Widgets/button_widget.dart';

class ContactSupport extends StatefulWidget {
  @override
  _ContactSupportState createState() => _ContactSupportState();
}

class _ContactSupportState extends State<ContactSupport> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Support'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title for the problem you are facing';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(labelText: 'Video URL'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the video URL';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please describe the problem you are facing';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              CustomButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Process data.
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}