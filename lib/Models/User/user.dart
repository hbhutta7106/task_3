import 'package:task_3/Models/User/location.dart';
import 'package:task_3/Models/User/login.dart';
import 'package:task_3/Models/User/name.dart';

class UserProfile {
  final String? gender;
  final Name? name;
  final Location? location;
  final String? email;
  final Login? login;
  final DOB? dob;
  final Registered? registered;
  final String? phone;
  final String? cell;
  final Id? id;
  final Picture? picture;
  final String? nat;

  UserProfile({
    this.gender,
    this.name,
    this.location,
    this.email,
    this.login,
    this.dob,
    this.registered,
    this.phone,
    this.cell,
    this.id,
    this.picture,
    this.nat,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      gender: json['gender'],
      email: json['email'],
      phone: json['phone'],
      cell: json['cell'],
      nat: json['nat'],
      name: json['name'] != null ? Name.fromJson(json['name']) : null,
      location:
          json['location'] != null ? Location.fromJson(json['location']) : null,
      login: json['login'] != null ? Login.fromJson(json['login']) : null,
      dob: json['dob'] != null ? DOB.fromJson(json['dob']) : null,
      registered: json['registered'] != null
          ? Registered.fromJson(json['registered'])
          : null,
      id: json['id'] != null ? Id.fromJson(json['id']) : null,
      picture:
          json['picture'] != null ? Picture.fromJson(json['picture']) : null,
    );
  }
}

class Id {
  final String? name;
  final String? value;

  Id({
    this.name,
    this.value,
  });

  factory Id.fromJson(Map<String, dynamic> json) {
    return Id(
      name: json['name'],
      value: json['value'],
    );
  }
}

class Picture {
  final String? large;
  final String? medium;
  final String? thumbnail;

  Picture({
    this.large,
    this.medium,
    this.thumbnail,
  });

  factory Picture.fromJson(Map<String, dynamic> json) {
    return Picture(
      large: json['large'],
      medium: json['medium'],
      thumbnail: json['thumbnail'],
    );
  }
}

class DOB {
  final String? date;
  final dynamic age;

  DOB({
    this.date,
    this.age,
  });
  factory DOB.fromJson(Map<String, dynamic> json) {
    return DOB(
      date: json['date'],
      age: json['age'],
    );
  }
}

class Registered {
  final String? date;
  final dynamic age;

  Registered({
    this.date,
    this.age,
  });

  factory Registered.fromJson(Map<String, dynamic> json) {
    return Registered(
      date: json['date'],
      age: json['age'],
    );
  }
}
