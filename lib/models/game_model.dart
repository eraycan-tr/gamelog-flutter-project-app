class Game {
  final int id;
  final String title;
  final String platform;
  final double price;
  final String description;
  final String assetPath;

  Game({
    required this.id,
    required this.title,
    required this.platform,
    required this.price,
    required this.description,
    required this.assetPath,
  });

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      id: json['id'],
      title: json['title'],
      platform: json['platform'],
      price: (json['price'] as num).toDouble(),
      description: json['description'],
      assetPath: json['asset_path'],
    );
  }
}

final List<Map<String, dynamic>> dummyGamesJson = [
  {
    "id": 1,
    "title": "Elden Ring",
    "platform": "PS5 / PC",
    "price": 1450.0,
    "description": "Lands Between dünyasının kasvetli ve büyüleyici atmosferinde geçen, açık dünya formülünü yeniden tanımlayan bir souls-borne başyapıtı. Kusursuz boss tasarımları, derin lore elementleri ve büyü odaklı buildler için sunduğu 75 Intelligence gereksinimli özel yetenekleriyle her saniyesi saf bir keşif duygusu sunuyor. Kaybolmaya ve meydan okumaya hazır olun.",
    "asset_path": "assets/eldenring.jpg"
  },
  {
    "id": 2,
    "title": "EA Sports FC 24",
    "platform": "PC / Konsol",
    "price": 1200.0,
    "description": "Yeşil sahalardaki rekabet ruhunu, devrimsel HyperMotionV teknolojisiyle buluşturan en üst düzey futbol simülasyonu. Gerçek hayattaki oyuncu hareketlerinin birebir animasyonlara aktarıldığı yapımda, taktiksel derinlik ve Ultimate Team / Kariyer modu geliştirmeleri zirve yapıyor. Arkadaşlarınızla yapacağınız rekabet dolu akşamların vazgeçilmez lideri.",
    "asset_path": "assets/fc24.png"
  },
  {
    "id": 3,
    "title": "Red Dead Redemption 2",
    "platform": "PC / Xbox",
    "price": 850.0,
    "description": "Vahşi Batı'nın altın çağının kapanışını, Arthur Morgan ve Van der Linde çetesinin trajik hikayesi üzerinden anlatan interaktif bir sinema deneyimi. Yaşayan, nefes alan devasa açık dünyası, avcılık mekanikleri, kamp hayatı ve her bir NPC ile kurabildiğiniz gerçekçi etkileşimler sayesinde oyun dünyasının gördüğü en detaylı ve duygusal olarak en ağır hikayelerinden biri.",
    "asset_path": "assets/rdr2.png"
  },
  {
    "id": 4,
    "title": "Cyberpunk 2077",
    "platform": "PS5 / PC",
    "price": 990.0,
    "description": "Güç, ihtişam ve amansız vücut modifikasyonlarının esir aldığı distopik megakent Night City'de geçen birinci şahıs açık dünya RPG deneyimi. V karakteriyle çıktığınız bu yolda, beyninize kazınan Keanu Reeves (Johnny Silverhand) ile birlikte siber-geliştirmelerin sınırlarını zorlayacak, neon ışıklı sokaklarda kendi kaderinizi çizeceksiniz.",
    "asset_path": "assets/cyberpunk2077.png"
  },
  {
    "id": 5,
    "title": "Hades II",
    "platform": "PC",
    "price": 600.0,
    "description": "Zamanın Titanı Kronos'a karşı amansız bir intikam savaşı açan yer altı dünyasının büyücü prensesi Melinoë'nin hikayesi. Mitolojik ögelerin, büyü temelli rogue-like mekaniklerinin ve akıcı kombo zincirlerinin birleştiği bu yapımda, her ölüm yepyeni bir başlangıcı, yeni tanrı kutsamalarını ve derinleşen karakter ilişkilerini beraberinde getiriyor.",
    "asset_path": "assets/hades2.png"
  },
  {
    "id": 6,
    "title": "Hollow Knight",
    "platform": "Nintendo / PC",
    "price": 350.0,
    "description": "Unutulmuş bir böcek krallığının derinliklerinde geçen, melankolik müzikleri ve el çizimi görselleriyle büyüleyen efsanevi bir metroidvania. Kusursuz mekaniklere sahip 2D aksiyon şeması, zorlu platform ögeleri ve birbirine organik olarak bağlanan devasa haritasıyla, küçük bir şövalyenin başından geçen devasa bir destanı anlatıyor.",
    "asset_path": "assets/hollownight.png"
  }
];
