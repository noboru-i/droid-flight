// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeState {
  Map<String, List<BetaAppData>> get betaApps =>
      throw _privateConstructorUsedError;
  String get selectedFilter => throw _privateConstructorUsedError;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call({Map<String, List<BetaAppData>> betaApps, String selectedFilter});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? betaApps = null,
    Object? selectedFilter = null,
  }) {
    return _then(_value.copyWith(
      betaApps: null == betaApps
          ? _value.betaApps
          : betaApps // ignore: cast_nullable_to_non_nullable
              as Map<String, List<BetaAppData>>,
      selectedFilter: null == selectedFilter
          ? _value.selectedFilter
          : selectedFilter // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeStateImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$HomeStateImplCopyWith(
          _$HomeStateImpl value, $Res Function(_$HomeStateImpl) then) =
      __$$HomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, List<BetaAppData>> betaApps, String selectedFilter});
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
      _$HomeStateImpl _value, $Res Function(_$HomeStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? betaApps = null,
    Object? selectedFilter = null,
  }) {
    return _then(_$HomeStateImpl(
      betaApps: null == betaApps
          ? _value._betaApps
          : betaApps // ignore: cast_nullable_to_non_nullable
              as Map<String, List<BetaAppData>>,
      selectedFilter: null == selectedFilter
          ? _value.selectedFilter
          : selectedFilter // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$HomeStateImpl implements _HomeState {
  const _$HomeStateImpl(
      {final Map<String, List<BetaAppData>> betaApps =
          const <String, List<BetaAppData>>{},
      this.selectedFilter = 'All'})
      : _betaApps = betaApps;

  final Map<String, List<BetaAppData>> _betaApps;
  @override
  @JsonKey()
  Map<String, List<BetaAppData>> get betaApps {
    if (_betaApps is EqualUnmodifiableMapView) return _betaApps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_betaApps);
  }

  @override
  @JsonKey()
  final String selectedFilter;

  @override
  String toString() {
    return 'HomeState(betaApps: $betaApps, selectedFilter: $selectedFilter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateImpl &&
            const DeepCollectionEquality().equals(other._betaApps, _betaApps) &&
            (identical(other.selectedFilter, selectedFilter) ||
                other.selectedFilter == selectedFilter));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_betaApps), selectedFilter);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      __$$HomeStateImplCopyWithImpl<_$HomeStateImpl>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState(
      {final Map<String, List<BetaAppData>> betaApps,
      final String selectedFilter}) = _$HomeStateImpl;

  @override
  Map<String, List<BetaAppData>> get betaApps;
  @override
  String get selectedFilter;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BetaAppData {
  String get applicationId => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  String? get section => throw _privateConstructorUsedError;

  /// Create a copy of BetaAppData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BetaAppDataCopyWith<BetaAppData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BetaAppDataCopyWith<$Res> {
  factory $BetaAppDataCopyWith(
          BetaAppData value, $Res Function(BetaAppData) then) =
      _$BetaAppDataCopyWithImpl<$Res, BetaAppData>;
  @useResult
  $Res call(
      {String applicationId,
      String image,
      String name,
      List<String> tags,
      String? section});
}

/// @nodoc
class _$BetaAppDataCopyWithImpl<$Res, $Val extends BetaAppData>
    implements $BetaAppDataCopyWith<$Res> {
  _$BetaAppDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BetaAppData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? applicationId = null,
    Object? image = null,
    Object? name = null,
    Object? tags = null,
    Object? section = freezed,
  }) {
    return _then(_value.copyWith(
      applicationId: null == applicationId
          ? _value.applicationId
          : applicationId // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      section: freezed == section
          ? _value.section
          : section // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BetaAppDataImplCopyWith<$Res>
    implements $BetaAppDataCopyWith<$Res> {
  factory _$$BetaAppDataImplCopyWith(
          _$BetaAppDataImpl value, $Res Function(_$BetaAppDataImpl) then) =
      __$$BetaAppDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String applicationId,
      String image,
      String name,
      List<String> tags,
      String? section});
}

/// @nodoc
class __$$BetaAppDataImplCopyWithImpl<$Res>
    extends _$BetaAppDataCopyWithImpl<$Res, _$BetaAppDataImpl>
    implements _$$BetaAppDataImplCopyWith<$Res> {
  __$$BetaAppDataImplCopyWithImpl(
      _$BetaAppDataImpl _value, $Res Function(_$BetaAppDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of BetaAppData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? applicationId = null,
    Object? image = null,
    Object? name = null,
    Object? tags = null,
    Object? section = freezed,
  }) {
    return _then(_$BetaAppDataImpl(
      applicationId: null == applicationId
          ? _value.applicationId
          : applicationId // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      section: freezed == section
          ? _value.section
          : section // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$BetaAppDataImpl implements _BetaAppData {
  const _$BetaAppDataImpl(
      {required this.applicationId,
      required this.image,
      required this.name,
      required final List<String> tags,
      this.section})
      : _tags = tags;

  @override
  final String applicationId;
  @override
  final String image;
  @override
  final String name;
  final List<String> _tags;
  @override
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  final String? section;

  @override
  String toString() {
    return 'BetaAppData(applicationId: $applicationId, image: $image, name: $name, tags: $tags, section: $section)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BetaAppDataImpl &&
            (identical(other.applicationId, applicationId) ||
                other.applicationId == applicationId) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.section, section) || other.section == section));
  }

  @override
  int get hashCode => Object.hash(runtimeType, applicationId, image, name,
      const DeepCollectionEquality().hash(_tags), section);

  /// Create a copy of BetaAppData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BetaAppDataImplCopyWith<_$BetaAppDataImpl> get copyWith =>
      __$$BetaAppDataImplCopyWithImpl<_$BetaAppDataImpl>(this, _$identity);
}

abstract class _BetaAppData implements BetaAppData {
  const factory _BetaAppData(
      {required final String applicationId,
      required final String image,
      required final String name,
      required final List<String> tags,
      final String? section}) = _$BetaAppDataImpl;

  @override
  String get applicationId;
  @override
  String get image;
  @override
  String get name;
  @override
  List<String> get tags;
  @override
  String? get section;

  /// Create a copy of BetaAppData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BetaAppDataImplCopyWith<_$BetaAppDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
