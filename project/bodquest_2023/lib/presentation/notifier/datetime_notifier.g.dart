// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datetime_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dateTimeNotifierHash() => r'345b82fc2e865ba75bb7bac9f65cd2c35e19b842';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$DateTimeNotifier
    extends BuildlessAutoDisposeNotifier<DateTime> {
  late final DateTime initValue;

  DateTime build(
    DateTime initValue,
  );
}

/// -----------------------------------------------------------
/// ノティファイヤー & 自動で作られるプロバイダー - 文字を保存しておく
/// -----------------------------------------------------------
///
/// Copied from [DateTimeNotifier].
@ProviderFor(DateTimeNotifier)
const dateTimeNotifierProvider = DateTimeNotifierFamily();

/// -----------------------------------------------------------
/// ノティファイヤー & 自動で作られるプロバイダー - 文字を保存しておく
/// -----------------------------------------------------------
///
/// Copied from [DateTimeNotifier].
class DateTimeNotifierFamily extends Family<DateTime> {
  /// -----------------------------------------------------------
  /// ノティファイヤー & 自動で作られるプロバイダー - 文字を保存しておく
  /// -----------------------------------------------------------
  ///
  /// Copied from [DateTimeNotifier].
  const DateTimeNotifierFamily();

  /// -----------------------------------------------------------
  /// ノティファイヤー & 自動で作られるプロバイダー - 文字を保存しておく
  /// -----------------------------------------------------------
  ///
  /// Copied from [DateTimeNotifier].
  DateTimeNotifierProvider call(
    DateTime initValue,
  ) {
    return DateTimeNotifierProvider(
      initValue,
    );
  }

  @override
  DateTimeNotifierProvider getProviderOverride(
    covariant DateTimeNotifierProvider provider,
  ) {
    return call(
      provider.initValue,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'dateTimeNotifierProvider';
}

/// -----------------------------------------------------------
/// ノティファイヤー & 自動で作られるプロバイダー - 文字を保存しておく
/// -----------------------------------------------------------
///
/// Copied from [DateTimeNotifier].
class DateTimeNotifierProvider
    extends AutoDisposeNotifierProviderImpl<DateTimeNotifier, DateTime> {
  /// -----------------------------------------------------------
  /// ノティファイヤー & 自動で作られるプロバイダー - 文字を保存しておく
  /// -----------------------------------------------------------
  ///
  /// Copied from [DateTimeNotifier].
  DateTimeNotifierProvider(
    DateTime initValue,
  ) : this._internal(
          () => DateTimeNotifier()..initValue = initValue,
          from: dateTimeNotifierProvider,
          name: r'dateTimeNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$dateTimeNotifierHash,
          dependencies: DateTimeNotifierFamily._dependencies,
          allTransitiveDependencies:
              DateTimeNotifierFamily._allTransitiveDependencies,
          initValue: initValue,
        );

  DateTimeNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.initValue,
  }) : super.internal();

  final DateTime initValue;

  @override
  DateTime runNotifierBuild(
    covariant DateTimeNotifier notifier,
  ) {
    return notifier.build(
      initValue,
    );
  }

  @override
  Override overrideWith(DateTimeNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: DateTimeNotifierProvider._internal(
        () => create()..initValue = initValue,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        initValue: initValue,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<DateTimeNotifier, DateTime>
      createElement() {
    return _DateTimeNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DateTimeNotifierProvider && other.initValue == initValue;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, initValue.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DateTimeNotifierRef on AutoDisposeNotifierProviderRef<DateTime> {
  /// The parameter `initValue` of this provider.
  DateTime get initValue;
}

class _DateTimeNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<DateTimeNotifier, DateTime>
    with DateTimeNotifierRef {
  _DateTimeNotifierProviderElement(super.provider);

  @override
  DateTime get initValue => (origin as DateTimeNotifierProvider).initValue;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
