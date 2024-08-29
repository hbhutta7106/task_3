
class Location {
  final Street? street;
  final String? city;
  final String? state;
  final String? country;
  final dynamic postcode;
  final Coordinates? coordinates;
  final TimeZone ?timezone;

  Location({
     this.street,
     this.city,
     this.state,
     this.country,
     this.postcode,
     this.coordinates,
     this.timezone,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      street: json['street'] != null ?  Street.fromJson(json['street']) : null,
      city: json['city'],
      state: json['state'],
      country: json['country'],
      postcode: json['postcode'],
      coordinates: json['coordinates'] != null
        ?  Coordinates.fromJson(json['coordinates'])
        : null,
      timezone: json['timezone'] != null
        ?  TimeZone.fromJson(json['timezone'])
        : null,
    );
  }
}


class Street {
  final dynamic number;
  final String? name;

  Street({
     this.number,
     this.name,
  });

  factory Street.fromJson(Map<String, dynamic> json) {
    return Street(
      number: json['number'],
      name: json['name'],
    );
  }
}
class Coordinates {
  final double? latitude;
  final double? longitude;

  Coordinates({
    required this.latitude,
    required this.longitude,
  });

  factory Coordinates.fromJson(Map<String, dynamic> json) {
    return Coordinates(
      latitude: json['latitude'] != null ? double.tryParse(json['latitude']) : null,
      longitude:json['longitude'] != null ? double.tryParse(json['longitude']) : null,
    );
  }
}
class TimeZone {
  final String? offset;
  final String? description;

  TimeZone({
     this.offset,
     this.description,
  });

  factory TimeZone.fromJson(Map<String, dynamic> json) {
    return TimeZone(
      offset: json['offset'],
      description: json['description'],
    );
  }
}
