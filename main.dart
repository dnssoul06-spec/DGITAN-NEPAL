import 'package:flutter/material.dart';

void main() {
  runApp(const DigitalNepalApp());
}

class DigitalNepalApp extends StatelessWidget {
  const DigitalNepalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Digital Nepal',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1268E8)),
        scaffoldBackgroundColor: const Color(0xFFF7F9FC),
        fontFamily: 'Roboto',
      ),
      home: const WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 112,
                height: 112,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  gradient: const LinearGradient(colors: [Color(0xFF1268E8), Color(0xFFE92D58)]),
                ),
                child: const Center(child: Text('DN', style: TextStyle(color: Colors.white, fontSize: 42, fontWeight: FontWeight.w900))),
              ),
              const SizedBox(height: 22),
              const Text('Digital Nepal', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800)),
              const SizedBox(height: 6),
              const Text('Connect • Share • Grow', style: TextStyle(color: Colors.black54, fontSize: 15)),
              const SizedBox(height: 50),
              SizedBox(
                width: double.infinity,
                height: 54,
                child: FilledButton(
                  onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const MainShell())),
                  child: const Text('Get Started', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700)),
                ),
              ),
              const SizedBox(height: 14),
              const Text('Nepali Super App • V1 MVP', style: TextStyle(color: Colors.black45)),
            ],
          ),
        ),
      ),
    );
  }
}

class MainShell extends StatefulWidget {
  const MainShell({super.key});
  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int index = 0;
  final pages = const [HomeScreen(), ChatScreen(), VideoScreen(), MarketplaceScreen(), ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: index, children: pages),
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (v) => setState(() => index = v),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.chat_bubble_outline), selectedIcon: Icon(Icons.chat_bubble), label: 'Chat'),
          NavigationDestination(icon: Icon(Icons.play_circle_outline), selectedIcon: Icon(Icons.play_circle), label: 'Video'),
          NavigationDestination(icon: Icon(Icons.storefront_outlined), selectedIcon: Icon(Icons.storefront), label: 'Market'),
          NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Digital Nepal', style: TextStyle(fontWeight: FontWeight.w800)), actions: const [Icon(Icons.search), SizedBox(width: 18), Icon(Icons.notifications_none), SizedBox(width: 12)]),
      body: ListView(padding: const EdgeInsets.all(16), children: [
        Card(child: Padding(padding: const EdgeInsets.all(14), child: Row(children: [const CircleAvatar(radius: 23, child: Icon(Icons.person)), const SizedBox(width: 12), const Expanded(child: Text("What's on your mind?", style: TextStyle(color: Colors.black45))), IconButton(onPressed: () {}, icon: const Icon(Icons.photo_library_outlined)), IconButton(onPressed: () {}, icon: const Icon(Icons.videocam_outlined))]))),
        const SizedBox(height: 12),
        const StoryRow(),
        const SizedBox(height: 12),
        const PostCard(name: 'Rajan Gurung', text: 'नमस्ते नेपाल 🇳🇵 हाम्रो संस्कृति, हाम्रो पहिचान ❤️'),
        const PostCard(name: 'Priya Sharma', text: 'Digital Nepal मा भेटौं है! ✨'),
      ]),
    );
  }
}

class StoryRow extends StatelessWidget {
  const StoryRow({super.key});
  @override
  Widget build(BuildContext context) => SizedBox(height: 96, child: ListView.separated(scrollDirection: Axis.horizontal, itemCount: 6, separatorBuilder: (_, __) => const SizedBox(width: 12), itemBuilder: (_, i) => Column(children: [CircleAvatar(radius: 30, backgroundColor: i == 0 ? const Color(0xFF1268E8) : Colors.white, child: Icon(i == 0 ? Icons.add : Icons.person, color: i == 0 ? Colors.white : Colors.black54)), const SizedBox(height: 6), Text(i == 0 ? 'Your Story' : 'Friend ${i}', style: const TextStyle(fontSize: 12))])));
}

class PostCard extends StatelessWidget {
  final String name, text;
  const PostCard({super.key, required this.name, required this.text});
  @override
  Widget build(BuildContext context) => Card(margin: const EdgeInsets.only(bottom: 12), child: Padding(padding: const EdgeInsets.all(14), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Row(children: [const CircleAvatar(child: Icon(Icons.person)), const SizedBox(width: 10), Expanded(child: Text(name, style: const TextStyle(fontWeight: FontWeight.bold))), const Icon(Icons.more_horiz)]), const SizedBox(height: 12), Text(text, style: const TextStyle(fontSize: 15)), const SizedBox(height: 14), Container(height: 150, decoration: BoxDecoration(borderRadius: BorderRadius.circular(14), gradient: const LinearGradient(colors: [Color(0xFFDBEAFE), Color(0xFFEFF6FF)])), child: const Center(child: Icon(Icons.landscape, size: 58, color: Color(0xFF1268E8)))), const SizedBox(height: 8), const Row(children: [Icon(Icons.favorite_border), SizedBox(width: 6), Text('Like'), SizedBox(width: 28), Icon(Icons.comment_outlined), SizedBox(width: 6), Text('Comment'), Spacer(), Icon(Icons.share_outlined)] )])));
}

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('Chat', style: TextStyle(fontWeight: FontWeight.w800)), actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.edit_outlined)), IconButton(onPressed: () {}, icon: const Icon(Icons.group_add_outlined))]), body: ListView(children: [for (final n in ['Sita Bista', 'Ramesh Thapa', 'Priya Sharma', 'Bikash Rai', 'Family Group']) ListTile(contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4), leading: Stack(children: [const CircleAvatar(radius: 27, child: Icon(Icons.person)), if (n != 'Family Group') const Positioned(right: 0, bottom: 0, child: CircleAvatar(radius: 7, backgroundColor: Colors.green))]), title: Text(n, style: const TextStyle(fontWeight: FontWeight.w700)), subtitle: const Text('Tap to open conversation'), trailing: const Text('12:30 PM', style: TextStyle(fontSize: 11)) , onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ChatDetailScreen(name: n))))]));
}

class ChatDetailScreen extends StatelessWidget {
  final String name;
  const ChatDetailScreen({super.key, required this.name});
  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: Row(children: [const CircleAvatar(radius: 18, child: Icon(Icons.person, size: 19)), const SizedBox(width: 10), Expanded(child: Text(name, style: const TextStyle(fontWeight: FontWeight.w700))) ]), actions: [IconButton(onPressed: () => _call(context, false), icon: const Icon(Icons.call)), IconButton(onPressed: () => _call(context, true), icon: const Icon(Icons.videocam))]), body: Column(children: [const Expanded(child: ListView(padding: EdgeInsets.all(16), children: [Align(alignment: Alignment.centerLeft, child: _Bubble(text: 'Hi! Kasto cha?', mine: false)), Align(alignment: Alignment.centerRight, child: _Bubble(text: 'Ramro cha 😊 Timro kasto cha?', mine: true)), Align(alignment: Alignment.centerLeft, child: _Bubble(text: 'Ma pani ramro.', mine: false))])), SafeArea(child: Padding(padding: const EdgeInsets.all(10), child: Row(children: [IconButton(onPressed: () {}, icon: const Icon(Icons.add_circle_outline)), const Expanded(child: TextField(decoration: InputDecoration(hintText: 'Type a message...', border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(24))), contentPadding: EdgeInsets.symmetric(horizontal: 18, vertical: 10)))), IconButton(onPressed: () {}, icon: const Icon(Icons.mic)), IconButton(onPressed: () {}, icon: const Icon(Icons.send))])))]));

  void _call(BuildContext context, bool video) => Navigator.push(context, MaterialPageRoute(builder: (_) => CallScreen(name: name, video: video)));
}

class _Bubble extends StatelessWidget { final String text; final bool mine; const _Bubble({required this.text, required this.mine}); @override Widget build(BuildContext context) => Container(margin: const EdgeInsets.only(bottom: 10), padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10), decoration: BoxDecoration(color: mine ? const Color(0xFF1268E8) : Colors.white, borderRadius: BorderRadius.circular(18)), child: Text(text, style: TextStyle(color: mine ? Colors.white : Colors.black87))); }

class CallScreen extends StatelessWidget {
  final String name; final bool video;
  const CallScreen({super.key, required this.name, required this.video});
  @override
  Widget build(BuildContext context) => Scaffold(backgroundColor: Colors.black, body: SafeArea(child: Stack(children: [if (video) Positioned.fill(child: Container(decoration: const BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color(0xFF1B3154), Color(0xFF05070B)])), child: const Center(child: Icon(Icons.person, size: 110, color: Colors.white24)))) else const Center(child: CircleAvatar(radius: 64, child: Icon(Icons.person, size: 64))), Positioned(top: 32, left: 0, right: 0, child: Column(children: [Text(name, style: const TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.w700)), const SizedBox(height: 6), Text(video ? 'Video calling…' : 'Audio calling…', style: const TextStyle(color: Colors.white70))])), Positioned(bottom: 40, left: 30, right: 30, child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [CircleAvatar(radius: 27, backgroundColor: Colors.white24, child: Icon(video ? Icons.cameraswitch : Icons.volume_up, color: Colors.white)), CircleAvatar(radius: 32, backgroundColor: Colors.red, child: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.call_end, color: Colors.white))), CircleAvatar(radius: 27, backgroundColor: Colors.white24, child: Icon(video ? Icons.mic_off : Icons.mic, color: Colors.white))]))]));
}

class VideoScreen extends StatelessWidget { const VideoScreen({super.key}); @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('Short Video', style: TextStyle(fontWeight: FontWeight.w800))), body: PageView.builder(scrollDirection: Axis.vertical, itemCount: 5, itemBuilder: (_, i) => Container(color: Colors.black, child: Stack(children: [const Center(child: Icon(Icons.play_circle_outline, color: Colors.white, size: 72)), Positioned(left: 18, bottom: 28, child: Text('@nepal_creator_${i + 1}\nBeautiful Nepal 🇳🇵', style: const TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w700))), const Positioned(right: 18, bottom: 45, child: Column(children: [Icon(Icons.favorite_border, color: Colors.white, size: 34), SizedBox(height: 22), Icon(Icons.comment_outlined, color: Colors.white, size: 34), SizedBox(height: 22), Icon(Icons.share_outlined, color: Colors.white, size: 34)]))]))); }

class MarketplaceScreen extends StatelessWidget { const MarketplaceScreen({super.key}); @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('Marketplace', style: TextStyle(fontWeight: FontWeight.w800)), actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))]), body: GridView.builder(padding: const EdgeInsets.all(12), gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 12, crossAxisSpacing: 12, childAspectRatio: .78), itemCount: 6, itemBuilder: (_, i) => Card(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Expanded(child: Container(decoration: BoxDecoration(borderRadius: const BorderRadius.vertical(top: Radius.circular(12)), gradient: LinearGradient(colors: [Colors.blue.shade50, Colors.grey.shade100])), child: const Center(child: Icon(Icons.shopping_bag_outlined, size: 52)))), const Padding(padding: EdgeInsets.fromLTRB(10, 8, 10, 2), child: Text('Nepali Product', style: TextStyle(fontWeight: FontWeight.w700))), const Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 10), child: Text('Rs. 1,499', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF1268E8))))]))); }

class ProfileScreen extends StatelessWidget { const ProfileScreen({super.key}); @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('Profile', style: TextStyle(fontWeight: FontWeight.w800)), actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.settings_outlined))]), body: ListView(padding: const EdgeInsets.all(18), children: [const CircleAvatar(radius: 52, child: Icon(Icons.person, size: 55)), const SizedBox(height: 12), const Center(child: Text('Digital Nepal User', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800))), const Center(child: Text('@digitalnepal_user', style: TextStyle(color: Colors.black54))), const SizedBox(height: 20), Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: const [Stat(label: 'Posts', value: '0'), Stat(label: 'Followers', value: '0'), Stat(label: 'Following', value: '0')]), const SizedBox(height: 20), FilledButton(onPressed: () {}, child: const Text('Edit Profile')), const SizedBox(height: 8), const ListTile(leading: Icon(Icons.security_outlined), title: Text('Privacy & Security')), const ListTile(leading: Icon(Icons.help_outline), title: Text('Help & Support'))]); }
class Stat extends StatelessWidget { final String label, value; const Stat({super.key, required this.label, required this.value}); @override Widget build(BuildContext context) => Column(children: [Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)), Text(label, style: const TextStyle(color: Colors.black54))]); }
