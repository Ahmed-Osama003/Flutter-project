class myValidation{

  String? validateName(String? name){
<<<<<<< HEAD
    if (name == null) {
=======
    if (name == null ) {
>>>>>>> 131c7cf2059cc85149fc6f34dd2d3cd9fee7ec03
      return "Not match";
    }
    RegExp regex = RegExp(r'^[a-zA-Z]+([ -][a-zA-Z]+)*$');
    if (regex.hasMatch(name)){
      return null;
    } else {
      return "Not match";
    }
  }

  String? validateEmail(String? email){
    if (email == null) {
      return "Not match";
    }
    RegExp regex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    if (regex.hasMatch(email)) {
      return null;
    } else {
      return "Not match";
    }
  }

  String? validateNumber(String? phoneNumber){
    if (phoneNumber == null) {
      return "Not match";
    }
    RegExp regex = RegExp(r'^01[0-2]\d{8}$');
    if (regex.hasMatch(phoneNumber)) {
      return null;
    } else {
      return "Not match";
    }
  }


  String? validatePassword(String? password){
    if (password == null) {
      return "Not match";
    }
    RegExp regex = RegExp(r'^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{8,}$');
    if (regex.hasMatch(password)) {
      return null;
    } else {
      return "Not match";
    }
  }

<<<<<<< HEAD
  String? validateResetCode(String? code) {
    if (code == null) {
      return "Not match";
    }
    RegExp regex = RegExp(r'^[1-9]\d{5}$');
    if (regex.hasMatch(code)) {
      return null;
    } else {
      return "Not match";
    }
  }
=======

>>>>>>> 131c7cf2059cc85149fc6f34dd2d3cd9fee7ec03

}