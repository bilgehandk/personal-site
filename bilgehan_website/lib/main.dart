import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'card_portfolio_game.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:html' as html;
import 'package:flutter/foundation.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      initialRoute: '/',
      routes: {
        '/': (_) => Scaffold(
          appBar: AppBar(title: const Text('Welcome Bilgehan Demirkaya Portfolio Website')),
          body: GameWidget(game: CardPortfolioGame()),
        ),
        '/info': (_) => const InfoScreen(),
        '/projects': (_) => const ProjectsScreen(),
        '/download_cv': (_) => const DownloadCVScreen(),
      },
    );
  }
}

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Info')),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orangeAccent, Colors.deepOrangeAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'About Me',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "Hello! I'm Bilgehan Demirkaya, a passionate Mobile Game Engineer with a strong foundation in Information Systems and Technologies, currently completing my education at Bilkent University. Over the years, I've developed expertise in Unity, C#, and game monetization platforms such as AdMob and Unity Ads.",
                          style: TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'My Journey',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "My professional experience spans internships at companies like Zynga Inc., MobileAction, and Easy Clap Games, where I honed my skills in game development, full-stack development, and software engineering. I’ve worked on various projects, from integrating localization systems into games like 101 Okey Plus, to creating hyper-casual games with innovative mechanics.",
                          style: TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "As a leader, I’ve had the privilege of serving as the Chairman of the Board at Bilkent University Young Entrepreneurs Society, where I led initiatives like hackathons, managed sponsorships, and organized summits that connected startups with the ecosystem.",
                          style: TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Skills & Expertise',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "Game Development: Unity, C#, Blender, Plastic SCM\nSoftware Development: React Native, Node.js, SQL, Vue.js, Java Spring\nTeam Management: Project leadership, event coordination, community building\nVersion Control Systems: Git, Plastic SCM",
                          style: TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'What Drives Me',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "I thrive at the intersection of creativity and technology. From developing games to designing immersive user experiences, my goal is to push boundaries and deliver impactful solutions that resonate with users.",
                          style: TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "Feel free to explore my GitHub for a closer look at my projects or connect with me on LinkedIn.",
                          style: TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () => launchUrl(Uri.parse('https://github.com/bilgehandk')),
                              child: Image.asset('assets/images/github.png', width: 50, height: 50),
                            ),
                            const SizedBox(width: 16),
                            GestureDetector(
                              onTap: () => launchUrl(Uri.parse('https://www.linkedin.com/in/bilgehan-demirkaya-32210b193/')),
                              child: Image.asset('assets/images/linkedin.png', width: 50, height: 50),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 25.0, bottom: 25.0),
                    child: Image.asset('assets/images/bilgehan.png', width: 800, height: 800), // Adjusted size
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Portfolio')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          // 1. Okey 101 Plus
          ProjectItem(
            title: 'Okey 101 Plus',
            image: 'assets/images/101plus.png',
            link: 'https://www.zynga.com/games/101-okey-plus/',
            description: 'During my 5.5-month internship period, I touched a lot of ground at the production level in 101 Okey Plus and Backgammon Plus, like a junior. The most important of these is the integration of the new Localization system into the prefabs in the game, I did a lot of bug fixing in both games. I did a lot of client-based work such as Intersitial AD or Store Sale pop-up development, and new feature development.',
          ),
          SizedBox(height: 16),
          // 2. Backgammon Plus
          ProjectItem(
            title: 'Backgammon Plus',
            image: 'assets/images/backgammon.png',
            link: 'https://www.zynga.com/games/backgammon-plus/',
            description: 'During my 5.5-month internship period, I touched a lot of ground at the production level in 101 Okey Plus and Backgammon Plus, like a junior. The most important of these is the integration of the new Localization system into the prefabs in the game, I did a lot of bug fixing in both games. I did a lot of client-based work such as Intersitial AD or Store Sale pop-up development, and new feature development.',
          ),
          SizedBox(height: 16),
          // 3. Playing Fortune (with two images, no link)
          ProjectItemMultiple(
            title: 'Playing Fortune',
            images: ['assets/images/iskambilfali.png', 'assets/images/iskambilfali2.png'],
            description: 'Playing Fortune is a unique fortune-telling card game developed with Unity. Players draw cards in pairs, attempting to find matches. When a pair matches, the cards are retained; otherwise, they are discarded. This process continues until the deck is empty.\n\nAfter the deck is cleared, the game uses AI to provide a fortune-telling experience based on the cards you matched. The app supports six languages, making it accessible to users worldwide.\n\nDiscover your fortune through the elegance of playing cards with Playing Fortune!',
          ),
          SizedBox(height: 16),
          // 4. Extreme Stunts 3D
          ProjectItem(
            title: 'Extreme Stunts 3D',
            image: 'assets/images/extremestunts.png',
            link: 'https://play.google.com/store/apps/details?id=com.bariskaplan.extremehillclimbing3d&hl=tr',
            description: '-Old game was renewed and updated (Physics and some new cars, new features).\n-Created new levels and designed UI.\n-Add Google Mobile Ads in some parts of the game.\n-Add Store and connected to Google Play.',
          ),
          SizedBox(height: 16),
          // 5. Hyper Casual Runner (with two images and a link)
          ProjectItemMultiple(
            title: 'Hyper Casual Runner',
            images: ['assets/images/hypercasual.png', 'assets/images/hypercasual2.png'],
            link: 'https://github.com/bilgehandk/Runner-Hyper-Casual-Game',
            description: 'A hyper-casual runner game developed with Unity. Players navigate through various obstacles and challenges to reach the finish line.',
          ),
        ],
      ),
    );
  }
}

class ProjectItem extends StatelessWidget {
  final String title;
  final String image;
  final String link;
  final String description;
  const ProjectItem({
    super.key,
    required this.title,
    required this.image,
    required this.link,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: () async {
              if (await canLaunch(link)) {
                await launch(link);
              }
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(image, fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 8),
          Text(description, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}

class ProjectItemMultiple extends StatelessWidget {
  final String title;
  final List<String> images;
  final String? link;
  final String description;
  const ProjectItemMultiple({
    super.key,
    required this.title,
    required this.images,
    this.link,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    Widget content = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: images.map((img) => Expanded(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(img, fit: BoxFit.cover),
          ),
        ),
      )).toList(),
    );
    if (link != null) {
      content = GestureDetector(
        onTap: () async {
          if (await canLaunch(link!)) {
            await launch(link!);
          }
        },
        child: content,
      );
    }
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          content,
          const SizedBox(height: 8),
          Text(description, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}

class DownloadCVScreen extends StatelessWidget {
  const DownloadCVScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Download CV'),
        actions: [
          IconButton(
            icon: const Icon(Icons.download),
            onPressed: () => _downloadCV(),
          ),
        ],
      ),
      body: Column(
          children: [
            Expanded(
              child: kIsWeb ? SfPdfViewer.asset('assets/CV.pdf') : Container(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () => _downloadCV(),
                child: const Text('Download CV'),
              ),
            ),
          ],
      ),
    );
  }
  
  void _downloadCV() {
    // Use web-specific download approach
    html.AnchorElement(href: 'assets/CV.pdf')
      ..download = 'Bilgehan_Demirkaya_CV.pdf'
      ..click();
  }
}