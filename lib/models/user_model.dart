class UserModel {
  final String? id;
  final String BusinessName;
  final String email;

  final String contact_no;
  //final String? country;
  final String license_no;

  final String userName;
  final String password;

  const UserModel({
    required this.id,

    required this.BusinessName,
    required this.email,
    required this.contact_no,
   // required this.country,
    required this.license_no,
  required this.userName,
  required this.password,
  });
toJson(){
  return{
    "id":id,
    "bname":BusinessName,
    "contact":contact_no,
    //"country":country,
    "license":license_no,
    "username":userName,
    "password":password,
  };
}

}
