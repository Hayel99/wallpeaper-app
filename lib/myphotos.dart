class MyPhotos {
  int id;
  String src;
  String photographer;
  MyPhotos({required this.id, required this.src, required this.photographer});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'src': src,
      'photographer': photographer,
    };
  }

  @override
  String toString() {
    return 'MyPhotos{id: $id, src: $src, photographer: $photographer}';
  }
}
