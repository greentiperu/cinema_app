class CastModel {
  final String name;
  final String imageUrl;

  CastModel({
    required this.name,
    required this.imageUrl,
  });
}

List<CastModel> casts = [
  CastModel(
    name: "Benedict Gumberbatch",
    imageUrl: "assets/cast_1.jpeg",
  ),
  CastModel(
    name: "Elizabeth Oisen",
    imageUrl: "assets/cast_2.jpeg",
  ),
  CastModel(
    name: "Chiwetel Ejiofor",
    imageUrl: "assets/cast_3.jpeg",
  ),
  CastModel(
    name: "Xochilt Ji Thoms",
    imageUrl: "assets/cast_4.jpeg",
  ),
  CastModel(
    name: "Rachel McAdams",
    imageUrl: "assets/cast_5.jpeg",
  ),
];
