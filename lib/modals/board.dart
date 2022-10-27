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
    description:
        'Explore Mars with us.\nGet all the information you need about mars',
    imageUrl: 'images/mars.jpg',
  ),
  BoardScreen(
    title2: 'UPDATES',
    title1: 'GET LATEST',
    description: 'Lauren Epsum/Lauren Epsum\nLauren Epsum',
    imageUrl: 'images/mars.jpg',
  ),
  BoardScreen(
    title2: 'VERIFIED',
    title1: 'RESEARCH PAPERS',
    description: 'Lauren Epsum/Lauren Epsum\nLauren Epsum',
    imageUrl: 'images/mars.jpg',
  ),
];
