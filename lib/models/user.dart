class User {

  final String id;
  final String fullName;
  final String email;
  final String location;

  User({this.id, this.fullName, this.email, this.location,});

  User.fromData(Map<String, dynamic> data)
      : id = data['id'],
        fullName = data['fullName'],
        email = data['email'],
        location = data['location'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      'location': location,
    };
  }

}