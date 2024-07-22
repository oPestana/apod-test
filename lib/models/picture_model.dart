class PictureModel {
  final String url;
  final String title;
  final String date;
  final String? explanation;

  PictureModel({
    required this.url,
    required this.title,
    required this.date,
    this.explanation,
  });

  factory PictureModel.fromJson(Map<String, dynamic> json) {
    return PictureModel(
      url: json['url'],
      title: json['title'],
      date: json['date'],
      explanation: json['explanation'],
    );
  }
}
