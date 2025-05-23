---
applyTo: "**/*.dart"
---
# ValueNotifier + Freezed パターンガイド

Flutter プロジェクトで ValueNotifier と Freezed を使った状態管理パターンの実装方法です。

## ファイル構成

1. **XXX_state.dart**: Freezed で状態クラスを定義
2. **XXX_notifier.dart**: ValueNotifier を継承した状態管理クラス
3. **XXX_state.freezed.dart**: 自動生成ファイル

## 状態クラスの定義

```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'feature_state.freezed.dart';

@freezed
class FeatureState with _$FeatureState {
  const factory FeatureState({
    @Default([]) List<Item> items,
    @Default('') String filter,
    @Default(false) bool isLoading,
  }) = _FeatureState;
}

@freezed
class Item with _$Item {
  const factory Item({
    required String id,
    required String name,
  }) = _Item;
}
```

## Notifier の実装

```dart
import 'package:flutter/foundation.dart';
import 'feature_state.dart';

class FeatureNotifier extends ValueNotifier<FeatureState> {
  FeatureNotifier() : super(const FeatureState());
  
  void setLoading(bool isLoading) {
    value = value.copyWith(isLoading: isLoading);
  }
  
  void setFilter(String filter) {
    value = value.copyWith(filter: filter);
  }
  
  void addItem(Item item) {
    value = value.copyWith(items: [...value.items, item]);
  }
}
```

## UI での利用方法

```dart
ValueListenableBuilder<FeatureState>(
  valueListenable: notifier,
  builder: (context, state, _) {
    if (state.isLoading) {
      return const CircularProgressIndicator();
    }
    return ListView(
      children: state.items.map((item) => ItemWidget(item: item)).toList(),
    );
  },
)
```
