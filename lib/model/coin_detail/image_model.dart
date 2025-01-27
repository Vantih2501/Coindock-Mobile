class ImageModel {
  String thumb;
  String small;
  String large;

  ImageModel({
    required this.thumb,
    required this.small,
    required this.large
  });

  factory ImageModel.fromJson(Map<String, dynamic> data) {
    return ImageModel(
      thumb: data['thumb'] ?? '',
      small: data['small'] ?? '',
      large: data['large'] ?? '',
    );
  }
}