class UserModel {
   String uid;
   String name;
   String regNo;
   String email;
   String level;
   String department;
   String password;
   List<String> interest;
  bool isSelected;

  UserModel({
    required this.uid,
    required this.name,
    this.isSelected = false,
    required this.regNo,
    required this.email,
    required this.interest,
    required this.password,
    required this.department,
    required this.level,
  });
}
