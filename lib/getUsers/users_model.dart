class UsersModel {
  int? id;
  String? email;
  String? username;
  String? password;
  Name? name;
  String? phone;
  int? iV;

  UsersModel(
      {this.id,
      this.email,
      this.username,
      this.password,
      this.name,
      this.phone,
      this.iV});

  UsersModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    username = json['username'];
    password = json['password'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    phone = json['phone'];
    iV = json['__v'];
  }
}

class Name {
  String? firstname;
  String? lastname;

  Name({this.firstname, this.lastname});

  Name.fromJson(Map<String, dynamic> json) {
    firstname = json['firstname'];
    lastname = json['lastname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    return data;
  }
}

// class Address {
//   Geolocation? geolocation;
//   String? city;
//   String? street;
//   int? number;
//   String? zipcode;

//   Address(
//       {this.geolocation, this.city, this.street, this.number, this.zipcode});

//   Address.fromJson(Map<String, dynamic> json) {
//     geolocation = json['geolocation'] != null
//         ? Geolocation.fromJson(json['geolocation'])
//         : null;
//     city = json['city'];
//     street = json['street'];
//     number = json['number'];
//     zipcode = json['zipcode'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (geolocation != null) {
//       data['geolocation'] = geolocation!.toJson();
//     }
//     data['city'] = city;
//     data['street'] = street;
//     data['number'] = number;
//     data['zipcode'] = zipcode;
//     return data;
//   }
// }

// class Geolocation {
//   String? lat;
//   String? long;

//   Geolocation({this.lat, this.long});

//   Geolocation.fromJson(Map<String, dynamic> json) {
//     lat = json['lat'];
//     long = json['long'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['lat'] = lat;
//     data['long'] = long;
//     return data;
//   }
// }

