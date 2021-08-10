class Validator {

  String? validateEnglishName(String? value) {

    if (value!.isEmpty) {
      return "English name is Required";
    }

    else if(value.replaceFirst(RegExp(r'[^\p{L}\s]+', unicode: true), '').length < 3){
      return "Please enter valid name";
    }

    return null;
  }

  String? validateArabicName(String? value) {
    if (value!.isEmpty) {
      return "Arabic name is Required";
    } else if(value.replaceFirst(RegExp(r'[^\p{L}\s]+', unicode: true), '').length < 3){
      return "Please enter valid name";
    }
    return null;
  }

  String? validateCategory(String? value) {
    if (value!.isEmpty) {
      return 'You must provide category';
    } else {
      return null;
    }
  }

  String? validateSections(String value) {
    if (value.isEmpty) {
      return 'You must provide at least one section';
    } else {
      return null;
    }
  }

  // String? validateSection(String? value) {
  //   if (value!.isEmpty) {
  //     return 'you must provide section name';
  //   } else {
  //     return null;
  //   }
  // }

  // String? validateBanner(String? value) {
  //   if (value!.isEmpty) {
  //     return 'You must provide a name';
  //   } else if (value!.length < 3) {
  //     return 'Name must be greater than 2 letters';
  //   } else {
  //     return null;
  //   }
  // }

  String? validateCategoryName(String value) {
    if (value.isEmpty) {
      return 'you must provide category name';
    } else {
      return null;
    }
  }

  String? validatePrice(String? value) {
    var pattern = r'[.0-9-]';
    var regExp = new RegExp(pattern);
    if (value!.isEmpty) {
      return "You must provide price";
    } else if (value.length > 8) {
      return "Invalid Price";
    } else if (!regExp.hasMatch(value)) {
      return "Price must be digits";
    } else if (double.tryParse(value) == null) {
      return "Invalid Price";
    } else if (!regExp.hasMatch(value)) {
      return "Price must be digits";
    }else if (double.parse(value) < 0) {
      return "Price must be greater than 0";
    }else if (regExp.hasMatch(value) && value.isNotEmpty) {
      if (double.parse(value) < 0) {
        return "Discount price must be greater than 0";
      }
    }
    return null;
  }

  String? validateDiscountPrice(String? value) {
    var pattern = r'[.0-9-]';
    var regExp = new RegExp(pattern);
    if (value!.length > 8 && value.isNotEmpty) {
      return "Invalid price";
    } else if (!regExp.hasMatch(value) && value.isNotEmpty) {
      return "Price must be digits";
    }

    else if (regExp.hasMatch(value) && value.isNotEmpty) {
      if (double.parse(value) < 0) {
        return "Discount price must be greater than 0";
      }
    }
    return null;
  }

  String? validateQuantity(String? value) {
    var pattern = r'(^[0-9]*$)';
    var regExp = new RegExp(pattern);
    if (value!.isEmpty) {
      return "You must provide quantity";
    } else if (value.length > 8) {
      return "Invalid Quantity";
    } else if (!regExp.hasMatch(value)) {
      return "Price must be digits";
    } else if (regExp.hasMatch(value) && value.isNotEmpty) {
      if (double.parse(value) < 0) {
        return "Quantity must be greater than 0";
      }
    }
    return null;
  }

// String validateName(String value) {
//   var pattern = r'(^[a-zA-Z ]*$)';
//   var regExp = new RegExp(pattern);
//   if (value.isEmpty) {
//     return "Name is Required";
//   } else if (!regExp.hasMatch(value.trim())) {
//     return "Name must be a-z and A-Z";
//   }
//   return null;
// }
//
// String validateMobilePhone(String value) {
//   var pattern = r'(^[0-9]*$)';
//   var regExp = new RegExp(pattern);
//   if (value.isEmpty) {
//     return "Phone number is Required";
//   } else if (value.length < 10) {
//     return "Phone number must be 10 digits";
//   } else if (!regExp.hasMatch(value)) {
//     return "Phone number must be digits";
//   }
//   return null;
// }
//
// String validatePassword(String pass1) {
//   RegExp hasUpper = RegExp(r'[A-Z]');
//   RegExp hasLower = RegExp(r'[a-z]');
//   RegExp hasDigit = RegExp(r'\d');
//   // RegExp hasPunct = RegExp(r'[_!@#\$&*~-]');
//   if (!RegExp(r'.{8,}').hasMatch(pass1))
//     return 'Passwords must have at least 8 characters';
//   if (!hasUpper.hasMatch(pass1))
//     return 'Passwords must have at least one uppercase character';
//   if (!hasLower.hasMatch(pass1))
//     return 'Passwords must have at least one lowercase character';
//   if (!hasDigit.hasMatch(pass1))
//     return 'Passwords must have at least one number';
//   // if (!hasPunct.hasMatch(pass1))
//   //   return 'Passwords need at least one special character like !@#\$&*~-';
//   return null;
// }
//
// String validatePasswordConfirmation(String pass2 , String pass1) {
//   return (pass2 == pass1) ? null : "The two passwords must match";
//   // Note that _pass1 is populated when a password is entered
// }
//
// String validate6DigitCode(String value) {
//   var pattern = r'(^[0-9]*$)';
//   var regExp = new RegExp(pattern);
//   if (value.isEmpty) {
//     return "Passcode is Required";
//   } else if (value.length != 6) {
//     return "PassCode must be 6 digits";
//   } else if (!regExp.hasMatch(value)) {
//     return "PassCode must be digits";
//   }
//   return null;
// }
//
// String validate6DigitToken(String value) {
//   var pattern = r'(^[0-9]*$)';
//   var regExp = new RegExp(pattern);
//   if (value.isEmpty) {
//     return "Please enter a valid token";
//   } else if (value.length != 6) {
//     return "PassCode must be 6 digits";
//   } else if (!regExp.hasMatch(value)) {
//     return "PassCode must be digits";
//   }
//   return null;
// }
//
// String validatePassCode(String value) {
//   var pattern = r'(^[0-9]*$)';
//   var regExp = new RegExp(pattern);
//   if (value.isEmpty) {
//     return "Passcode is Required";
//   } else if (value.length != 6) {
//     return "PassCode must be 6 digits";
//   } else if (!regExp.hasMatch(value)) {
//     return "PassCode must be digits";
//   }
//   return null;
// }
//
// String passwordDoNotMatch(String value, String confirmValue) {
//   var pattern = r'(^[0-9]*$)';
//   var regExp = new RegExp(pattern);
//   if (value.isEmpty) {
//     return "PassCode is Required";
//   } else if (value.length != 6) {
//     return "PassCode must be 6 digits";
//   } else if (!regExp.hasMatch(value)) {
//     return "PasscodeCode must be digits";
//   } else if (value != confirmValue) {
//     return "Password do not match!";
//   }
//   return null;
// }
//
// String validateEmail(String value) {
//   var pattern =
//       r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
//   var regExp = new RegExp(pattern);
//   if (value.isEmpty) {
//     return "Email is Required";
//   } else if (!regExp.hasMatch(value)) {
//     return "Invalid Email";
//   } else {
//     return null;
//   }
// }
//
// String validatePinCode(String value) {
//   var pattern = r'(^[0-9]*$)';
//   var regExp = new RegExp(pattern);
//   if (value.isEmpty) {
//     return "Pincode is Required";
//   } else if (value.length != 6) {
//     return "Pincode must be 6 digits";
//   } else if (!regExp.hasMatch(value)) {
//     return "Pincode must be digits";
//   }
//   return null;
// }
//
// String validateText(String value, String text) {
//   var pattern = r'(^[a-zA-Z ]*$)';
//   var regExp = new RegExp(pattern);
//   if (value.isEmpty) {
//     return "$text is Required";
//   } else if (!regExp.hasMatch(value.trim())) {
//     return "$text must be a-z and A-Z";
//   }
//   return null;
// }
//
// String validateNumber(String value, String desc) {
//   if (value.isEmpty) {
//     return "$desc is Required";
//   }
//   return null;
// }
}
