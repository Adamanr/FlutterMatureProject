class News {
  final String id;
  final String newsImage; // url

  const News({required this.id, required this.newsImage});

  static News fromJson(Map<String, dynamic> json) => News(
    id: json['id'] as String,
    newsImage: json['newsImage'] as String? ?? '',
  );
}

class NewsListResponse {
  final List<News> items;
  final int totalItems;

  const NewsListResponse({required this.items, required this.totalItems});

  static NewsListResponse fromJson(Map<String, dynamic> json) => NewsListResponse(
    items: (json['items'] as List).map((e) => News.fromJson(e)).toList(),
    totalItems: json['totalItems'] as int,
  );
}