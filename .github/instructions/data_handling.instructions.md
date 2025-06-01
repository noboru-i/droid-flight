---
applyTo: "**/*.dart"
---
# データ処理とベストプラクティス

このプロジェクトでのデータ処理、JSON変換、エラーハンドリングのパターンです。

## JSON データの処理

### SharedPreferences との連携
```dart
Future<void> _saveToPrefs(Map<String, List<DataModel>> data) async {
  final prefs = await SharedPreferences.getInstance();
  final Map<String, dynamic> jsonMap = {};
  
  data.forEach((key, list) {
    jsonMap[key] = list.map((e) => {
      'field1': e.field1,
      'field2': e.field2,
      'field3': e.field3,
    }).toList();
  });
  
  await prefs.setString('data_key', json.encode(jsonMap));
}

Future<void> loadFromPrefs() async {
  final prefs = await SharedPreferences.getInstance();
  final jsonString = prefs.getString('data_key');
  if (jsonString == null) return;
  
  final decoded = json.decode(jsonString) as Map<String, dynamic>;
  final Map<String, List<DataModel>> loaded = {};
  
  decoded.forEach((key, value) {
    loaded[key] = (value as List).map((e) => DataModel(
      field1: e['field1'],
      field2: e['field2'],
      field3: List<String>.from(e['field3']),
    )).toList();
  });
  
  value = value.copyWith(data: loaded);
}
```

## リストの操作

### 安全なリスト操作
```dart
// 新しい要素の追加
final newItems = Map<String, List<Item>>.from(value.items);
final section = item.section ?? 'Other';

if (newItems.containsKey(section)) {
  newItems[section] = [...newItems[section]!, item];
} else {
  newItems[section] = [item];
}

value = value.copyWith(items: newItems);
```

### フィルタリング
```dart
// 空の文字列を除外
final cleanTags = inputText
    .split(',')
    .map((e) => e.trim())
    .where((e) => e.isNotEmpty)
    .toList();
```

## null安全性

### null演算子の活用
```dart
// null合体演算子
final section = item.section ?? 'Other';

// null対応三項演算子
final title = data?.title ?? 'デフォルトタイトル';

// null aware アクセス
final length = items?.length ?? 0;
```

### 配列の安全なアクセス
```dart
// 非nullアサーション（確実にnullでない場合のみ）
final apps = betaApps[category]!;

// 安全なアクセス
final apps = betaApps[category] ?? <AppData>[];
```

## 非同期処理のパターン

### Future の適切な使用
```dart
Future<void> performAsyncAction() async {
  try {
    // 複数の非同期処理
    await loadData();
    await processData();
    await saveData();
  } catch (e) {
    // エラーハンドリング
    handleError(e);
  }
}
```

### UI更新を伴う非同期処理
```dart
Future<void> updateData() async {
  // ローディング状態を設定
  value = value.copyWith(isLoading: true);
  
  try {
    final newData = await fetchData();
    value = value.copyWith(
      data: newData,
      isLoading: false,
    );
  } catch (e) {
    value = value.copyWith(
      isLoading: false,
      hasError: true,
    );
  }
}
```

## フォーム処理

### TextEditingController の管理
```dart
class _InputPageState extends State<InputPage> {
  late final TextEditingController _nameController;
  late final TextEditingController _categoryController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _categoryController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _categoryController.dispose();
    super.dispose();
  }
}
```

### バリデーション
```dart
bool _validateForm() {
  if (_nameController.text.trim().isEmpty) {
    _showError('名前を入力してください');
    return false;
  }
  
  if (_categoryController.text.trim().isEmpty) {
    _showError('カテゴリを選択してください');
    return false;
  }
  
  return true;
}
```

## エラーハンドリング

### ネットワークエラー
```dart
errorBuilder: (context, error, stackTrace) => Container(
  width: 64,
  height: 64,
  color: Colors.grey[300],
  child: const Icon(Icons.image, color: Colors.grey),
)
```

### 一般的なエラー処理
```dart
try {
  await performAction();
} catch (e) {
  if (mounted) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('エラーが発生しました: ${e.toString()}')),
    );
  }
}
```

## パフォーマンス最適化

### const の効果的な使用
```dart
// Widget で const を使用
const SizedBox(height: 16)
const EdgeInsets.symmetric(horizontal: 16, vertical: 8)

// リスト内でのconst
children: const [
  Icon(Icons.star),
  SizedBox(width: 8),
]
```

### 効率的なリスト更新
```dart
// copyWith を使った効率的な状態更新
value = value.copyWith(selectedFilter: filter);

// スプレッド演算子でのリスト更新
newItems[section] = [...existingItems, newItem];
```

## コード品質

### 型の明示
```dart
// Map型の明示
final Map<String, List<AppData>> betaApps = {};

// List型の明示  
final List<String> tags = [];
```

### メソッドの分離
```dart
// 複雑な計算は別メソッドに分離
int _calculateTotalItems(Map<String, List<BetaAppData>> betaApps) {
  int count = 1; // フィルターチップ用
  
  for (var category in betaApps.keys) {
    count += 1; // カテゴリータイトル
    count += betaApps[category]!.length; // アプリ数
  }
  
  return count;
}
```