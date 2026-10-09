

class DataValidation{
  // static String? nameValidation(String value){
  //   if (value.isEmpty) {
  //     return "Name is required";
  //   } else if (!RegExp(r'^(?=.{3,}$)[A-Za-z\u0600-\u06FF ]+$').hasMatch(value)) {
  //     return "Please, enter valid name";
  //   }
  //   return null;
  // }

  static String? emailValidation(String value){
    if (value.isEmpty) {
      return "Email is required";
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
        .hasMatch(value)) {
      return "Please, enter valid email";
    }
    return null;
  }

  static String? rePasswordValidation(String value,String password){
    if (value.isEmpty) {
      return "Confirmation password is required";
    } else if (value != password) {
      return "The confirmation password does not match";
    }
    return null;
  }
}