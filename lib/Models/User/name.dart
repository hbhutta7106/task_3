class Name {
  final String? title;
  final String? first;
  final String? last;

  Name({
     this.title,
     this.first,
     this.last,
  });

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(
      title: json['title'],
      first: json['first'],
      last: json['last'],
    );
  }
}
