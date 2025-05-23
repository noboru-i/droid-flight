import 'package:droid_flight/pages/input/input_page.dart';
import 'package:flutter/material.dart';

class BetaAppData {
  final String image;
  final String name;
  final String? section;
  const BetaAppData({required this.image, required this.name, this.section});
}

const List<BetaAppData> yourBetaPrograms = [
  BetaAppData(
    image:
        'https://raw.githubusercontent.com/noboru-i/droid-flight/main/assets/taskmaster.png',
    name: 'TaskMaster',
    section: 'Your beta programs',
  ),
];

const List<BetaAppData> communicationApps = [
  BetaAppData(
    image:
        'https://raw.githubusercontent.com/noboru-i/droid-flight/main/assets/chatterbox.png',
    name: 'ChatterBox',
    section: 'Communication',
  ),
  BetaAppData(
    image:
        'https://raw.githubusercontent.com/noboru-i/droid-flight/main/assets/connectnow.png',
    name: 'ConnectNow',
    section: 'Communication',
  ),
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        title: const Text(
          'Beta programs',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: ListView.builder(
          itemCount: 2 + yourBetaPrograms.length + 1 + communicationApps.length,
          itemBuilder: (context, index) {
            // 0: フィルターチップ, 1: Your beta programsタイトル, 2..: yourBetaPrograms, ...
            if (index == 0) {
              return Column(
                children: [
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      _FilterChip(label: 'All', selected: true),
                      const SizedBox(width: 12),
                      _FilterChip(label: 'Productivity'),
                    ],
                  ),
                  const SizedBox(height: 24),
                ],
              );
            } else if (index == 1) {
              return const Text(
                'Your beta programs',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              );
            } else if (index < 2 + yourBetaPrograms.length) {
              final app = yourBetaPrograms[index - 2];
              return Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 32),
                child: _BetaAppTile(image: app.image, name: app.name),
              );
            } else if (index == 2 + yourBetaPrograms.length) {
              return const Text(
                'Communication',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              );
            } else {
              final app =
                  communicationApps[index - (3 + yourBetaPrograms.length)];
              return Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 16),
                child: _BetaAppTile(image: app.image, name: app.name),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _moveToInputPage(context),
        backgroundColor: const Color(0xFF339CFF),
        child: const Icon(Icons.add, color: Colors.white),
        shape: const CircleBorder(),
      ),
    );
  }

  void _moveToInputPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const InputPage(),
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool selected;
  const _FilterChip({required this.label, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: selected ? const Color(0xE6EAF3FF) : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
    );
  }
}

class _BetaAppTile extends StatelessWidget {
  final String image;
  final String name;
  const _BetaAppTile({required this.image, required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            image,
            width: 64,
            height: 64,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              width: 64,
              height: 64,
              color: Colors.grey[300],
              child: const Icon(Icons.image, color: Colors.grey),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Beta',
              style: TextStyle(
                color: Color(0xFF7B93AF),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
