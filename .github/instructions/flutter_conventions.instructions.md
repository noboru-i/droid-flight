---
applyTo: "**/*.dart"
---
# Flutter コーディング規約

このプロジェクトのFlutter/Dartコーディング規約とベストプラクティスです。

## 命名規則

### ファイル名
- `snake_case` を使用
- ページ: `feature_page.dart`
- 状態管理: `feature_notifier.dart`, `feature_state.dart`
- コンポーネント: `component_name.dart`

### クラス名
- `PascalCase` を使用
- ページ: `FeaturePage`
- Notifier: `FeatureNotifier`
- 状態クラス: `FeatureState`
- データクラス: `DataModelName`

### 変数・メソッド名
- `camelCase` を使用
- プライベートメンバーは `_` で開始
- bool値は `is`, `has`, `can` などで開始

## Widget 構成

### StatelessWidget の基本形
```dart
class FeaturePage extends StatelessWidget {
  const FeaturePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // implementation
    );
  }
}
```

### プライベートWidgetの使用
大きなWidgetは責任を分割してプライベートWidgetに分ける：

```dart
class _FeatureTile extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  
  const _FeatureTile({
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: onTap,
    );
  }
}
```

## const の活用

### Widget で const を積極的に使用
```dart
const Text('固定テキスト')
const SizedBox(height: 16)
const EdgeInsets.symmetric(horizontal: 16, vertical: 8)
```

### const constructor
```dart
class CustomWidget extends StatelessWidget {
  final String title;
  
  const CustomWidget({
    required this.title,
    super.key,
  });
}
```

## エラーハンドリング

### 画像の読み込み
```dart
Image.network(
  imageUrl,
  width: 64,
  height: 64,
  fit: BoxFit.cover,
  errorBuilder: (context, error, stackTrace) => Container(
    width: 64,
    height: 64,
    color: Colors.grey[300],
    child: const Icon(Icons.image, color: Colors.grey),
  ),
)
```

### 非同期処理
```dart
Future<void> performAction() async {
  try {
    // 処理
  } catch (e) {
    // エラーハンドリング
  }
}
```

## Material Design 3 の使用

### 推奨するWidget
- `FilledButton` (従来のRaisedButtonの代わり)
- `OutlinedButton`
- Material 3 カラーシステムの活用

### テーマの一貫性
```dart
TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w500,
)

EdgeInsets.symmetric(horizontal: 16, vertical: 8)
BorderRadius.circular(12)
```

## コメント

### 日本語コメントの使用
```dart
// フィルターチップ(1) + 各カテゴリーごとに (カテゴリータイトル(1) + そのカテゴリーのアプリリスト数)
int count = 1; // フィルターチップ用

// カテゴリー内のアプリリスト
final apps = betaApps[category]!;
```

### 複雑なロジックの説明
計算やアルゴリズムが複雑な場合は、処理の意図を日本語で説明する。