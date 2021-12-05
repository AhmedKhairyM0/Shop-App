class LoginModel {
  bool? status;
  String? message;
  UserModel? data;

  LoginModel({
    this.status,
    this.message,
    this.data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null ? UserModel.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.toJson(),
      };
  @override
  String toString() {
    return 'LoginModel{status: $status, message: $message, data: $data}';
  }
}

class UserModel {
  int? id;
  String? name; // required
  String? email; // required
  String? phone; // required
  String? image;
  dynamic points;
  dynamic credit;
  String? token;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.image,
    this.points,
    this.credit,
    this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      image: json['image'],
      points: json['points'],
      credit: json['credit'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id, 
        'name': name,
        'email': email,
        'phone': phone,
        'image': image,
        'points': points,
        'credit': credit,
        'token': token
      };

  @override
  String toString() {
    return 'UserData{id: $id, name: $name, email: $email, phone: $phone, image: $image, points: $points, credit: $credit, token: $token}';
  }
}