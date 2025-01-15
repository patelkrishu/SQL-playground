class TheoryModel {
  String title;
  List<Contents> contents;

  TheoryModel({
    required this.title,
    required this.contents,
  });

  factory TheoryModel.fromJson(Map json) {
    print('************* 111 ${json}');
    String title = json['title']??'Unknown';
    print('++++++++++++>> >>  ${json['contents']}');
    List list = json['contents'];
    List<Contents> contents = list.map((e) => Contents.fromJson(e)).toList();
    print('************* 333');
    return TheoryModel(
      title: title,
      contents: contents,
    );
  }
}

class Contents {
  String title;
  List<String> descriptions;

  Contents({
    required this.title,
    required this.descriptions,
  });

  factory Contents.fromJson(Map json) {
    print('************* 222 ${json}');
    String title = json['title'];
    List<String> descriptions = json['descriptions'].cast<String>();
    return Contents(title: title, descriptions: descriptions);
  }
}