import 'package:json_annotation/json_annotation.dart';

part 'image_model.g.dart';

@JsonSerializable()
class PixelfordImage {
  final String id;

  @JsonKey(name: 'download_url')
  final String urlFullSize;

  PixelfordImage({
    required this.id,
    required this.urlFullSize,
  });

  factory PixelfordImage.fromJson(Map<String, dynamic> json) =>
      _$PixelfordImageFromJson(json);

  Map<String, dynamic> toJson() => _$PixelfordImageToJson(this);
}
