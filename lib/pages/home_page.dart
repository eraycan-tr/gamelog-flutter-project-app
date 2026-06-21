import 'package:flutter/material.dart';
import '../models/game_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Game> allGames = [];
  List<Game> displayedGames = [];
  List<Game> myLibrary = [];

  @override
  void initState() {
    super.initState();
    allGames = dummyGamesJson.map((json) => Game.fromJson(json)).toList();
    displayedGames = allGames;
  }

  void filterGames(String query) {
    setState(() {
      if (query.isEmpty) {
        displayedGames = allGames;
      } else {
        displayedGames = allGames
            .where((game) => game.title.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F5F6),
      appBar: AppBar(
        title: const Text('GamerLog Kataloğu', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: const Color(0xFF2B323B),
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.sports_esports, color: Colors.white),
                onPressed: () async {
                  await Navigator.pushNamed(context, '/cart', arguments: myLibrary);
                  setState(() {});
                },
              ),
              if (myLibrary.isNotEmpty)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                    constraints: const BoxConstraints(minWidth: 14, minHeight: 14),
                    child: Text('${myLibrary.length}', style: const TextStyle(color: Colors.white, fontSize: 8), textAlign: TextAlign.center),
                  ),
                )
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          // Üst Banner (Yönergede zorunlu tutulan url kuralı)
          Container(
            width: double.infinity,
            height: 0,
            margin: const EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: const DecorationImage(
                image: NetworkImage('https://wantapi.com/assets/banner.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 4.0),
            child: TextField(
              onChanged: filterGames,
              decoration: InputDecoration(
                hintText: 'Oyun adı ara...',
                prefixIcon: const Icon(Icons.search, color: Color(0xFF5A7295)),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: displayedGames.isEmpty
                ? const Center(child: Text('Aradığınız oyun bulunamadı.'))
                : GridView.builder(
                    padding: const EdgeInsets.all(12),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.55, // Görsellerin sığması için en-boy oranı biraz esnetildi
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                    itemCount: displayedGames.length,
                    itemBuilder: (context, index) {
                      final game = displayedGames[index];
                      return GestureDetector(
                        onTap: () async {
                          final result = await Navigator.pushNamed(
                            context,
                            '/detail',
                            arguments: game,
                          );
                          if (result == true) {
                            setState(() {
                              if (!myLibrary.any((item) => item.id == game.id)) {
                                myLibrary.add(game);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('${game.title} zaten kütüphanenizde var!')),
                                );
                              }
                            });
                          }
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          elevation: 2,
                          color: Colors.white,
                          clipBehavior: Clip.antiAlias, // Görselin kenar yuvarlatmalarından taşmasını engeller
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // GÜN 4 İSTERİ: Image.asset ile Yerel Görsel Kullanımı
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  color: const Color(0xFFE0E7FF),
                                  child: Image.asset(
                                    game.assetPath,
                                    fit: BoxFit.cover,
                                    // Eğer yüklenirken bir sorun oluşursa hata vermemesi için koruma:
                                    errorBuilder: (context, error, stackTrace) {
                                      return const Icon(Icons.gamepad, size: 50, color: Color(0xFF5A7295));
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(game.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14), maxLines: 1, overflow: TextOverflow.ellipsis),
                                    const SizedBox(height: 4),
                                    Text(game.platform, style: TextStyle(color: Colors.grey.shade600, fontSize: 12, fontWeight: FontWeight.w600)),
                                    const SizedBox(height: 6),
                                    Text('${game.price.toStringAsFixed(0)} TL', style: const TextStyle(color: Color(0xFF5A7295), fontWeight: FontWeight.bold, fontSize: 13)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}