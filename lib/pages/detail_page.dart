import 'package:flutter/material.dart';
import '../models/game_model.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final game = ModalRoute.of(context)!.settings.arguments as Game;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(game.title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF2B323B),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 230,
              color: const Color(0xFFE0E7FF),
              child: Image.asset(
                game.assetPath,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.sports_esports, size: 80, color: Color(0xFF5A7295));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Chip(
                    label: Text(game.platform),
                    backgroundColor: const Color(0xFFE0E7FF),
                    labelStyle: const TextStyle(color: Color(0xFF5A7295), fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Text(game.title, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Color(0xFF2B323B))),
                  const SizedBox(height: 6),
                  Text('${game.price.toStringAsFixed(0)} TL', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: Color(0xFF5A7295))),
                  const SizedBox(height: 20),
                  const Text('Oyun Özeti ve Detayları', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(game.description, style: const TextStyle(fontSize: 14, color: Colors.black87, height: 1.6)),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2B323B),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      icon: const Icon(Icons.add_to_photos, color: Colors.white),
                      label: const Text('Kütüphaneme Ekle', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
