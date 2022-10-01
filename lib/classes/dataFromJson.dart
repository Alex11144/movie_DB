class Users {
  final int userId;
  final int id;
  final String title;
  final String body;
  Users(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});

  static Users fromJson(json) => Users(
        userId: json['userId'] as int,
        id: json['id'] as int,
        title: json['title'] as String,
        body: json['body'] as String,
      );
}
