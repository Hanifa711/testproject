class UserModel {
   String? name;
   String? phone;
   String? password;
   List<String>? addresses;
   String? image;

  UserModel({
     this.name,
     this.phone,
     this.password,
    this.addresses,
    this.image,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'phone': phone,
        'password': password,
        'addresses': addresses,
        'image': image,
      };

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json['name'],
        phone: json['phone'],
        password: json['password'],
        addresses: List<String>.from(json['addresses'] ?? []),
        image: json['image'],
      );
}
