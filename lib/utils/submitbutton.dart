import 'package:flutter/material.dart';

class SubmitButton extends StatefulWidget {
  final Function() onPressed;

  const SubmitButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  _SubmitButtonState createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? CircularProgressIndicator() // Show loading indicator
        : ElevatedButton(
            onPressed: () async {
              setState(() {
                _isLoading = true; // Show loading indicator when clicked
              });
              await widget.onPressed(); // Await the async operation
              setState(() {
                _isLoading =
                    false; // Hide loading indicator when operation is completed
              });
            },
            child: Text('Submit'),
          );
  }
}
