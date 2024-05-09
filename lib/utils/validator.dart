class FormValidator {
  static String? validateNotEmpty(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    } else if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
      return 'Enter a valid phone number';
    }
    return null;
  }

  // Add more validators as needed for different types of input fields
}
