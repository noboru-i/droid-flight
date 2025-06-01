---
applyTo: "**/*.dart"
---
# 日本語対応とローカライゼーション

このプロジェクトでの日本語テキスト、コメント、ユーザビリティのガイドラインです。

## コメントの方針

### 日本語コメントの使用
複雑なロジックや計算には日本語でコメントを記述：

```dart
// フィルターチップ(1) + 各カテゴリーごとに (カテゴリータイトル(1) + そのカテゴリーのアプリリスト数)
int count = 1; // フィルターチップ用

for (var category in betaApps.keys) {
  count += 1; // カテゴリータイトル
  count += betaApps[category]!.length; // そのカテゴリーのアプリ数
}
```

### 処理の意図説明
```dart
// カテゴリー内のアプリリスト
final apps = betaApps[category]!;

// reload the notifier to reflect any changes
_notifier.loadFromPrefs();

// 必要に応じて画像URLを追加
image: '',
```

## UI テキスト

### 画面タイトル
```dart
// AppBar のタイトル
title: const Text(
  'Beta programs',
  style: TextStyle(fontWeight: FontWeight.bold),
)

title: const Text('App details')
title: const Text('Add beta program')
```

### ボタンテキスト
```dart
// アクションボタン
child: const Text('Join beta')
child: const Text('Open app')
child: const Text('Open link')
```

### 入力フィールド
```dart
// ヒントテキスト
hintText: 'Invitation link'
hintText: 'App name'
hintText: 'Category'
hintText: 'Tags (split by comma)'
```

### 説明テキスト
```dart
// 入力説明
const Text(
  'Enter your app details',
  style: TextStyle(fontWeight: FontWeight.bold),
)
```

## カテゴリとセクション

### 標準カテゴリ名
```dart
// デフォルトカテゴリ
final section = app.section ?? 'Other';

// 特別なカテゴリ
category == 'Your beta programs'
category == 'Productivity'
```

### フィルター選択肢
```dart
// フィルターオプション
'All'
'Productivity'
```

## エラーメッセージとフィードバック

### バリデーションメッセージ
```dart
// 日本語エラーメッセージの例
'名前を入力してください'
'カテゴリを選択してください'
'招待リンクが必要です'
```

### SnackBar メッセージ
```dart
ScaffoldMessenger.of(context).showSnackBar(
  const SnackBar(
    content: Text('アプリを追加しました'),
  ),
);

ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
    content: Text('エラーが発生しました: ${error.toString()}'),
  ),
);
```

## 一貫性のあるテキストパターン

### 動詞の統一
- 'Join beta' (参加)
- 'Open app' (開く)
- 'Add beta program' (追加)
- 'Enter your app details' (入力)

### 名詞の統一
- 'Beta programs' (ベータプログラム)
- 'App details' (アプリ詳細)
- 'Invitation link' (招待リンク)
- 'Tags' (タグ)
- 'Category' (カテゴリ)

## ユーザビリティの考慮

### アクセシビリティ
```dart
// 明確なラベル
Semantics(
  label: 'アプリを追加',
  child: FloatingActionButton(
    onPressed: () => _moveToInputPage(context),
    child: const Icon(Icons.add),
  ),
)
```

### フォントの配慮
```dart
// 日本語に適したフォントサイズ
TextStyle(fontSize: 16)  // 本文
TextStyle(fontSize: 14)  // 補助テキスト
TextStyle(fontSize: 18)  // 見出し
```

## 入力処理

### 日本語入力の考慮
```dart
// トリミング処理
final cleanInput = controller.text.trim();

// カンマ区切りの処理（全角・半角対応）
final tags = tagsController.text
    .split(RegExp(r'[,、]'))  // 全角・半角カンマ対応
    .map((e) => e.trim())
    .where((e) => e.isNotEmpty)
    .toList();
```

### デフォルト値の設定
```dart
// 空の場合のデフォルト
section: categoryController.text.isEmpty 
    ? null 
    : categoryController.text,

// デフォルトカテゴリ
final section = app.section ?? 'その他';
```

## 文字列の処理

### 安全な文字列操作
```dart
// null安全な文字列処理
final displayName = name?.isNotEmpty == true ? name : 'アプリ名なし';

// 長いテキストの省略
String truncateText(String text, int maxLength) {
  return text.length > maxLength 
      ? '${text.substring(0, maxLength)}...'
      : text;
}
```

### 文字列比較
```dart
// 大文字小文字を無視した比較
if (filter.toLowerCase() == 'all') {
  // 処理
}
```

## データ表示

### 日付・時刻の表示
```dart
// 日本語ロケールでの日付表示
final formatter = DateFormat('yyyy年MM月dd日', 'ja_JP');
final dateText = formatter.format(DateTime.now());
```

### 数値の表示
```dart
// 日本語での数値表示
final countText = '${items.length}個のアプリ';
```