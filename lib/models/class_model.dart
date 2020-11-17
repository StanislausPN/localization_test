import 'dart:convert';

class HomeProvider {
  final int id;
  final String key;
  final String translation;

  HomeProvider({this.id, this.key, this.translation});

  factory HomeProvider.fromJson(Map<String, dynamic> map) {
    return HomeProvider(
      id: map['id'],
      key: map['key'],
      translation: map['translation'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'key': key,
      'translation': translation,
    };
  }

  @override
  String toString() {
    return 'HomeProvider{id: $id, key: $key, translation: $translation,}';
  }
}

List<HomeProvider> homeProviderFromJson(String jsonData) {
  Map<String, dynamic> map = json.decode(jsonData);
  List<dynamic> data = map['data'];
  // final data = json.decode(jsonData);
  return List<HomeProvider>.from(
      data.map((item) => HomeProvider.fromJson(item)));
  // try {
  // } catch (e) {
  //   print('This is Catch ERROR : $e');
  // }
}

String homeProviderToJson(HomeProvider data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
