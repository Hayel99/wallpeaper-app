class Photos {
  int? id;
  int? width;
  int? height;
  String? url;
  String? photographer;
  int? photographerId;
  String? alt;

  Photos(
      {this.id,
      this.width,
      this.height,
      this.url,
      this.photographer,
      this.photographerId,
      this.alt});

  Photos.fromJson(Map<String, dynamic> data) {
    id = data['id'];
    width = data['width'];
    height = data['height'];
    url = data['url'];
    photographer = data['photographer'];

    photographerId = data['photographer_id'];

    alt = data['alt'];
  }
}
