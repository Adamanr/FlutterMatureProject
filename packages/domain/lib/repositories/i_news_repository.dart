import '../entities/news.dart';

abstract class INewsRepository {
  Future<List<News>> getNews();
}