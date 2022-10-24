class BoardScreen {
  final String title1;
  final String title2;
  final String description;
  final String imageUrl;
  BoardScreen({
    required this.title1,
    required this.title2,
    required this.description,
    required this.imageUrl,
  });
}

List<BoardScreen> boardScreens = [
  BoardScreen(
    title2: 'MARS',
    title1: 'DISCOVER',
    description: 'Lauren Epsum/Lauren Epsum\nLauren Epsum',
    imageUrl: 'images/mars.jpg',
  ),
  BoardScreen(
    title2: 'GALAXIES',
    title1: 'TRAVEL THROUGH',
    description: 'Lauren Epsum/Lauren Epsum\nLauren Epsum',
    imageUrl: 'images/mars.jpg',
  ),
  BoardScreen(
    title2: 'ABOVE CLOUDS',
    title1: 'FLY UP',
    description: 'Lauren Epsum/Lauren Epsum\nLauren Epsum',
    imageUrl: 'images/mars.jpg',
  ),
];
