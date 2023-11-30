class MovieModel {
  final String name;
  final String type;
  final String start;
  final String time;
  final String pg;
  final String price;
  final String description;
  final String imageUrl;
  final String movieUrl;

  MovieModel({
    required this.name,
    required this.type,
    required this.start,
    required this.time,
    required this.pg,
    required this.price,
    required this.description,
    required this.imageUrl,
    required this.movieUrl,
  });
}

final List<MovieModel> movies = [
  MovieModel(
    name: 'Shang-Chi',
    type: "Action - Marvel Universe",
    start: "4.5",
    time: "2h 35m",
    pg: "13+",
    price: "\$7,00",
    description:
        "A renowned criminal sired a child who he raised as his heir to an insidious secret society and named him Shang-Chi, the “rising and advancing of the spirit.” In a hidden, ancient fortress in China, the boy became adept at both a multitude of martial arts and philosophical disciplines, completely unaware of his father’s evil pursuits.",
    imageUrl: 'assets/movie_1.jpeg',
    movieUrl: 'assets/videos/movie_1.mp4',
  ),
  MovieModel(
    name: 'Raya and the Last Dragon',
    type: "Fantasy - Disney animated",
    start: "4.8",
    time: "1h 58m",
    pg: "6+",
    price: "\$5,00",
    description:
        "Walt Disney Animation Studios' Raya and the Last Dragon travels to the fantasy world of Kumandra, where humans and dragons lived together in harmony long ago. But when an evil force threatened the land, the dragons sacrificed themselves to save humanity.",
    imageUrl: 'assets/movie_2.jpeg',
    movieUrl: 'assets/videos/movie_2.mp4',
  ),
  MovieModel(
    name: 'The Christmas Chronicles',
    type: "Family - Comedy Cinema Adventure",
    start: "4.9",
    time: "2h 12m",
    pg: "4+",
    price: "\$8,50",
    description:
        "Kate Pierce and her brother Teddy intend to film Santa Claus on Christmas Eve. After they secretly get on their sleigh, they cause an accident that could ruin Christmas. From that moment on, the brothers will live with Santa Claus and his faithful elves on a series of adventures to save Christmas before it is too late.",
    imageUrl: 'assets/movie_3.jpeg',
    movieUrl: 'assets/videos/movie_3.mp4',
  ),
  MovieModel(
    name: 'Atrapa la bandera',
    type: "Animación, aventura, comedia, ciencia",
    start: "5.0",
    time: "2h 00m",
    pg: "11+",
    price: "\$11,00",
    description:
        "Atrapa la bandera es una fantasía sobre el regreso del hombre a la Luna y una historia de reconciliación familiar del director de la exitosa película Las Aventuras de Tadeo Jones.",
    imageUrl: 'assets/movie_4.jpeg',
    movieUrl: 'assets/videos/movie_1.mp4',
  ),
];
