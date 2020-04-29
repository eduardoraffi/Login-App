class UserInfo{
  final String name;
  final String intrested;
  final String email;
  final String phone;
  final int age;

  UserInfo({this.name, this.intrested, this.email, this.phone, this.age});

  ///TODO: To future json server response
  @override
  String toString() {
    return '[name: $name\nintrested: $intrested\nemail: $email\ncounterTitle: $phone\nage: $age]';
  }

  factory UserInfo.fromJSON(Map<String, Object> data) => UserInfo(
    name: data['name'] as String,
    intrested: data['intrested'] as String,
    email: data['email'] as String,
    phone: data['phone'] as String,
    age: data['age'] as int,
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'intrested': intrested,
    'email': email,
    'phone': phone,
    'age': age,
  };
}
