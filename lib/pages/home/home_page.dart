import 'package:droid_flight/pages/input/input_page.dart';
import 'package:flutter/material.dart';
import 'package:droid_flight/pages/detail/detail_page.dart';
import 'home_notifier.dart';
import 'home_state.dart';
import 'package:droid_flight/components/beta_tag.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeNotifier _notifier;

  @override
  void initState() {
    super.initState();
    _notifier = HomeNotifier();
  }

  @override
  void dispose() {
    _notifier.dispose();
    super.dispose();
  }

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
      body: ValueListenableBuilder<HomeState>(
          valueListenable: _notifier,
          builder: (context, state, _) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ListView.builder(
                itemCount: _calculateTotalItems(state.betaApps),
                itemBuilder: (context, index) {
                  // 0: フィルターチップ
                  if (index == 0) {
                    return Column(
                      children: [
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            _FilterChip(
                              label: 'All',
                              selected: state.selectedFilter == 'All',
                              onTap: () => _notifier.updateFilter('All'),
                            ),
                            const SizedBox(width: 12),
                            _FilterChip(
                              label: 'Productivity',
                              selected: state.selectedFilter == 'Productivity',
                              onTap: () =>
                                  _notifier.updateFilter('Productivity'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                      ],
                    );
                  }

                  // カテゴリーとアプリのリストを表示
                  return _buildCategoryOrApp(index, state.betaApps);
                },
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _moveToInputPage(context),
        backgroundColor: const Color(0xFF339CFF),
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white),
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

  int _calculateTotalItems(Map<String, List<BetaAppData>> betaApps) {
    // フィルターチップ(1) + 各カテゴリーごとに (カテゴリータイトル(1) + そのカテゴリーのアプリリスト数)
    int count = 1; // フィルターチップ用

    for (var category in betaApps.keys) {
      count += 1; // カテゴリータイトル
      count += betaApps[category]!.length; // そのカテゴリーのアプリ数
    }

    return count;
  }

  Widget _buildCategoryOrApp(
      int index, Map<String, List<BetaAppData>> betaApps) {
    int currentIndex = 1; // フィルターチップの次から開始

    // 各カテゴリーを処理
    for (var category in betaApps.keys) {
      // カテゴリータイトル
      if (index == currentIndex) {
        return Text(
          category,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        );
      }
      currentIndex++;

      // カテゴリー内のアプリリスト
      final apps = betaApps[category]!;
      for (int i = 0; i < apps.length; i++) {
        if (index == currentIndex) {
          final app = apps[i];
          final bool isYourBetaProgram = category == 'Your beta programs';
          return Padding(
            padding:
                EdgeInsets.only(top: 16, bottom: isYourBetaProgram ? 32 : 16),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        DetailPage(applicationId: app.applicationId),
                  ),
                );
              },
              child: _BetaAppTile(
                image: app.image,
                name: app.name,
                tags: app.tags,
              ),
            ),
          );
        }
        currentIndex++;
      }
    }

    return const SizedBox(); // インデックスが範囲外の場合
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback? onTap;

  const _FilterChip({
    required this.label,
    this.selected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
      ),
    );
  }
}

class _BetaAppTile extends StatelessWidget {
  final String image;
  final String name;
  final List<String> tags;
  const _BetaAppTile({
    required this.image,
    required this.name,
    required this.tags,
  });

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
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),
            Wrap(
              spacing: 8,
              children: tags
                  .map(
                    (tag) => BetaTag(label: tag),
                  )
                  .toList(),
            ),
          ],
        ),
      ],
    );
  }
}
