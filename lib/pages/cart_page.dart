import 'package:flutter/material.dart';
import '../models/game_model.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late List<Game> addedGames;
  bool isInitialized = false;

  @override
  Widget build(BuildContext context) {
    if (!isInitialized) {
      addedGames = ModalRoute.of(context)!.settings.arguments as List<Game>;
      isInitialized = true;
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF3F5F6),
      appBar: AppBar(
        title: const Text('Kütüphanem', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF2B323B),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: addedGames.isEmpty
          ? const Center(
              child: Text(
                'Kütüphaneniz henüz boş.\nOyun inceleyip eklemeye başlayın!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: addedGames.length,
              itemBuilder: (context, index) {
                final game = addedGames[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  clipBehavior: Clip.antiAlias,
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    leading: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF3F5F6),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.all(2),
                      child: Image.asset(
                        game.assetPath,
                        fit: BoxFit.contain, 
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.gamepad, color: Color(0xFF5A7295));
                        },
                      ),
                    ),
                    title: Text(game.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(game.platform),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('${game.price.toStringAsFixed(0)} TL', style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF5A7295))),
                        const SizedBox(width: 4),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.redAccent),
                          onPressed: () {
                            setState(() {
                              addedGames.removeAt(index);
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('${game.title} kütüphaneden kaldırıldı.')),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
