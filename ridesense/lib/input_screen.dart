import 'package:flutter/material.dart';
import 'map_screen.dart';

class LocationInputScreen extends StatefulWidget {
  @override
  _LocationInputScreenState createState() => _LocationInputScreenState();
}

class _LocationInputScreenState extends State<LocationInputScreen> {
  final TextEditingController _controller = TextEditingController();
  String _errorMessage = '';

  void _navigateToMap() {
    final input = _controller.text;
    if (input.isEmpty) {
      setState(() {
        _errorMessage = 'Please enter a location';
      });
    } else {
      setState(() {
        _errorMessage = '';  // Clear the error message
      });
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MapScreen(location: input),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
        home: Scaffold(
      appBar: AppBar(title: Text('Enter Location')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Location',
                errorText: _errorMessage.isEmpty ? null : _errorMessage,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _navigateToMap,
              child: Text('Show on Map'),
            ),
          ],
        ),
      ),
    ));
  }
}
