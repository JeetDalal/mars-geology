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
    description: 'Get latest updates about Mars Programs',
    imageUrl: 'images/mars.jpg',
  ),
  BoardScreen(
    title2: 'VERIFIED',
    title1: 'RESEARCH PAPERS',
    description: 'Explore various research papers on Mars',
    imageUrl: 'images/mars.jpg',
  ),
];
