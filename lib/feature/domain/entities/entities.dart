import 'package:hive/hive.dart';
part 'entities.g.dart';

@HiveType(typeId: 0)
class Movie extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String imageName;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String time;
  @HiveField(4)
  final String description;

  Movie(
      {required this.id,
      required this.imageName,
      required this.title,
      required this.time,
      required this.description});
}

class MoviesBox {
  static Box<Movie> getTransactions() => Hive.box<Movie>('movies');
}
