import 'package:catflix/games/popcat_game.dart';
import 'package:catflix/models/games_model.dart';
import 'package:catflix/pages/catgpt_page.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  final List<GamesModel> games = const [
    GamesModel(
        name: 'PopCat',
        description: 'A Funny Clicking Game',
        navigatingTo: PopcatGame(),
        image:
            'https://assets.coingecko.com/coins/images/33760/large/image.jpg?1702964227'),
    GamesModel(
        name: 'CatGPT',
        description: 'A CatBot that can talk to you',
        navigatingTo: CatgptPage(),
        image:
            'https://symfonycasts.com/static/media/cache/blog_image/uploads/blog/cat-gpt.png'),
  ];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Center(
            child: GridView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              itemCount: games.length,
              itemBuilder: (ctx, i) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => games[i].navigatingTo,
                      ),
                    );
                  },
                  child: Card(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(5),
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                child: Image.network(
                                  games[i].image,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Text(
                                games[i].name,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              FittedBox(
                                fit: BoxFit.contain,
                                child: Text(
                                  games[i].description,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.0,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 50,
                mainAxisExtent: 264,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
