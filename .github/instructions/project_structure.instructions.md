---
applyTo: "lib/**/*.dart"
---
# プロジェクト構造ガイド

このプロジェクトのファイル構成とアーキテクチャパターンです。

## ディレクトリ構造

```
lib/
├── main.dart                    # アプリのエントリーポイント
├── components/                  # 再利用可能なUIコンポーネント
│   └── component_name.dart
└── pages/                       # 画面ごとの機能
    └── feature/                 # 機能ごとのディレクトリ
        ├── feature_page.dart    # UI層
        ├── feature_notifier.dart # 状態管理層
        ├── feature_state.dart   # データモデル層
        └── feature_state.freezed.dart # 生成ファイル
```

## ファイル命名規則

### ページファイル
- `feature_page.dart` - メインのUIファイル
- `feature_notifier.dart` - 状態管理ロジック
- `feature_state.dart` - 状態とデータモデル定義

### コンポーネントファイル
- `component_name.dart` - 再利用可能なUIコンポーネント

## インポート順序

```dart
// 1. Dart標準ライブラリ
import 'dart:convert';

// 2. Flutter公式パッケージ
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

// 3. サードパーティパッケージ
import 'package:shared_preferences/shared_preferences.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// 4. 相対インポート（同一機能内）
import 'feature_state.dart';
import 'feature_notifier.dart';

// 5. 絶対インポート（他機能・共通コンポーネント）
import 'package:droid_flight/components/beta_tag.dart';
import 'package:droid_flight/pages/detail/detail_page.dart';
```

## 機能の分離

### ページクラス
```dart
class FeaturePage extends StatefulWidget {
  const FeaturePage({super.key});

  @override
  State<FeaturePage> createState() => _FeaturePageState();
}

class _FeaturePageState extends State<FeaturePage> {
  late final FeatureNotifier _notifier;

  @override
  void initState() {
    super.initState();
    _notifier = FeatureNotifier();
  }

  @override
  void dispose() {
    _notifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<FeatureState>(
      valueListenable: _notifier,
      builder: (context, state, _) {
        return Scaffold(
          // UI implementation
        );
      },
    );
  }
}
```

### プライベートWidget
大きなWidgetは小さなプライベートWidgetに分割：

```dart
class _FeatureItem extends StatelessWidget {
  final ItemData item;
  final VoidCallback? onTap;
  
  const _FeatureItem({
    required this.item,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: // item UI
    );
  }
}
```

## データ永続化

### SharedPreferencesの使用パターン
```dart
class FeatureNotifier extends ValueNotifier<FeatureState> {
  Future<void> loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString('feature_data');
    if (jsonString == null) return;
    
    final decoded = json.decode(jsonString) as Map<String, dynamic>;
    // データの復元処理
  }

  Future<void> _saveToPrefs(DataType data) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonMap = data.toMap(); // またはtoJson()
    await prefs.setString('feature_data', json.encode(jsonMap));
  }
}
```

## 非同期処理

### コンストラクタでの初期化
```dart
class FeatureNotifier extends ValueNotifier<FeatureState> {
  FeatureNotifier() : super(const FeatureState()) {
    loadFromPrefs(); // 非同期初期化は別メソッドで
  }
}
```

### UI更新のタイミング
```dart
Future<void> performAction() async {
  // アクション実行
  await someAsyncOperation();
  
  // 状態更新（必要に応じて）
  await loadFromPrefs();
}
```

## ナビゲーション後の処理

### 画面復帰時のリロード
```dart
onTap: () async {
  await Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => const DetailPage(),
    ),
  );
  // ナビゲーション後にデータをリロード
  _notifier.loadFromPrefs();
}
```

## エラーハンドリング

### Notifierでのエラー処理
```dart
Future<void> performAction() async {
  try {
    // 処理
  } catch (e) {
    // エラー状態の設定
    value = value.copyWith(hasError: true, errorMessage: e.toString());
  }
}
```

## 建設的な機能追加

### 新しいページの追加手順
1. `lib/pages/new_feature/` ディレクトリを作成
2. `new_feature_state.dart` でデータモデルを定義
3. `new_feature_notifier.dart` で状態管理を実装
4. `new_feature_page.dart` でUIを実装
5. 必要に応じて `build_runner` でコード生成

### 新しいコンポーネントの追加
1. `lib/components/` 内に新しいファイルを作成
2. 再利用可能な設計にする
3. 必要なパラメータを `required` で明示
4. const constructor を使用