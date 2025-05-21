class Book {
  final String id;
  final String title;
  final String author;

  Book({
    required this.id,
    required this.title,
    required this.author,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    final volumeInfo = json['volumeInfo'];
    return Book(
      id: json['id'],
      title: volumeInfo['title'] ?? 'No Title',
      author: (volumeInfo['authors'] != null && volumeInfo['authors'].isNotEmpty)
          ? volumeInfo['authors'][0]
          : 'No Author',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'author': author,
    };
  }
}
