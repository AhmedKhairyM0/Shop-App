class Validation {
  static String? validateEmail(String? email) {
    // regex for email
    // var regx = RegExp(
    //     r'''^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$'''); // r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    // return regx.hasMatch(email);

    if (email == null || email.isEmpty) {
      return "Email is required";
    }
  }

  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return "Password is required";
    }
  }

  static String? validateName(String? name) {
    if (name == null || name.isEmpty) {
      return "Name is required";
    }
  }

  static String? validatePhoneNumber(String? phoneNumber) {
    if (phoneNumber == null || phoneNumber.isEmpty) {
      return "Phone number is required";
    }
    var phoneRegx = RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$');
    if (!phoneRegx.hasMatch(phoneNumber)) {
      return "Invalid Phone Number";
    }
  }
}
