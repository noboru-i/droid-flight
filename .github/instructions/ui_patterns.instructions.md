---
applyTo: "lib/pages/**/*.dart"
---
# UI/UX パターンガイド

このプロジェクトで使用するUI/UXパターンと一貫性を保つためのガイドラインです。

## ページ構造

### 基本的なScaffold構成
```dart
Scaffold(
  appBar: AppBar(
    leading: IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => Navigator.of(context).pop(),
    ),
    title: const Text('ページタイトル'),
    centerTitle: true,
  ),
  body: SafeArea(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: // コンテンツ
    ),
  ),
)
```

### FloatingActionButton
```dart
FloatingActionButton(
  onPressed: () => _moveToInputPage(context),
  backgroundColor: const Color(0xFF339CFF),
  shape: const CircleBorder(),
  child: const Icon(Icons.add, color: Colors.white),
)
```

## 色の定義

### プライマリカラー
- `Color(0xFF359EFF)` - メインブランドカラー
- `Color(0xFF339CFF)` - アクションボタン

### グレースケール
- `Colors.grey[300]` - プレースホルダー背景
- `Color(0xFFF2F2F2)` - タグ背景

## 間隔・サイズ

### 標準的な間隔
```dart
const SizedBox(height: 8)   // 小さい間隔
const SizedBox(height: 16)  // 標準間隔
const SizedBox(height: 24)  // 大きい間隔
const SizedBox(height: 32)  // セクション間隔
```

### パディング
```dart
EdgeInsets.symmetric(horizontal: 24, vertical: 16)  // ページ全体
EdgeInsets.symmetric(horizontal: 16, vertical: 8)   // コンポーネント内
EdgeInsets.symmetric(horizontal: 12, vertical: 4)   // 小さなコンポーネント
```

## タイポグラフィ

### 見出し
```dart
TextStyle(
  fontSize: 22,
  fontWeight: FontWeight.bold,
)

TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
)

TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
)
```

### 本文
```dart
TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w500,
)

TextStyle(fontSize: 14)        // 補助テキスト
TextStyle(fontSize: 14, color: Colors.grey)  // サブテキスト
```

## コンポーネントパターン

### 画像表示
```dart
ClipRRect(
  borderRadius: BorderRadius.circular(12),
  child: Image.network(
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
  ),
)
```

### タグコンポーネント
```dart
Container(
  padding: const EdgeInsets.symmetric(
    horizontal: 12,
    vertical: 4,
  ),
  decoration: BoxDecoration(
    color: const Color(0xFFF2F2F2),
    borderRadius: BorderRadius.circular(12),
  ),
  child: Text(
    label,
    style: const TextStyle(fontSize: 14),
  ),
)
```

### 入力フィールド
```dart
TextField(
  controller: controller,
  decoration: InputDecoration(
    hintText: hint,
    filled: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide.none,
    ),
  ),
)
```

### フィルターチップ
```dart
GestureDetector(
  onTap: onTap,
  child: Container(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    decoration: BoxDecoration(
      color: selected ? Colors.blue : Colors.grey[200],
      borderRadius: BorderRadius.circular(20),
    ),
    child: Text(
      label,
      style: TextStyle(
        color: selected ? Colors.white : Colors.black,
        fontWeight: FontWeight.w500,
      ),
    ),
  ),
)
```

## ナビゲーション

### ページ遷移
```dart
await Navigator.of(context).push(
  MaterialPageRoute(
    builder: (context) => const TargetPage(),
  ),
)
```

### 戻るボタン
```dart
IconButton(
  icon: const Icon(Icons.arrow_back),
  onPressed: () => Navigator.of(context).pop(),
)
```

## リスト表示

### ListView.builder の使用
動的なリストには `ListView.builder` を使用：

```dart
ListView.builder(
  itemCount: items.length,
  itemBuilder: (context, index) {
    return ItemWidget(item: items[index]);
  },
)
```

### Wrapの使用
タグなどの動的な要素には `Wrap` を使用：

```dart
Wrap(
  spacing: 8,
  children: tags.map((tag) => BetaTag(label: tag)).toList(),
)
```