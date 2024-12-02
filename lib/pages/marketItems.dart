class MarketItems {
  late String title;
  late String imageUrl;
  late double description;

  MarketItems(
  {required this.title, required this.imageUrl, required this.description,});
}


List<MarketItems> allMarkets = [
  MarketItems(
    title: 'Copperbelt Energy',
    imageUrl: 'assets/cec.png',
    description: 3.00,
  ),

  MarketItems(
    title: 'Lafarge',
    imageUrl: 'assets/laf.webp',
    description: 3.50,

  ),

  MarketItems(
    title: 'Bata',
    imageUrl: 'assets/bata.webp',
    description: 1.00,
  ),

  MarketItems(
    title: 'Zambia Sugar',
    imageUrl: 'assets/zamsugar.webp',
    description: 2.00,
  ),
];

