// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_kind_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$mealKindNotifierHash() => r'ae3f0254e0f3cbae635cb6bf1dfd0f2154b091c6';

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

abstract class _$MealKindNotifier
    extends BuildlessAutoDisposeNotifier<MealKind> {
  late final MealKind initValue;

  MealKind build(
    MealKind initValue,
  );
}

/// 食事の種類を状態管理
///
/// Copied from [MealKindNotifier].
@ProviderFor(MealKindNotifier)
const mealKindNotifierProvider = MealKindNotifierFamily();

/// 食事の種類を状態管理
///
/// Copied from [MealKindNotifier].
class MealKindNotifierFamily extends Family<MealKind> {
  /// 食事の種類を状態管理
  ///
  /// Copied from [MealKindNotifier].
  const MealKindNotifierFamily();

  /// 食事の種類を状態管理
  ///
  /// Copied from [MealKindNotifier].
  MealKindNotifierProvider call(
    MealKind initValue,
  ) {
    return MealKindNotifierProvider(
      initValue,
    );
  }

  @override
  MealKindNotifierProvider getProviderOverride(
    covariant MealKindNotifierProvider provider,
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
  String? get name => r'mealKindNotifierProvider';
}

/// 食事の種類を状態管理
///
/// Copied from [MealKindNotifier].
class MealKindNotifierProvider
    extends AutoDisposeNotifierProviderImpl<MealKindNotifier, MealKind> {
  /// 食事の種類を状態管理
  ///
  /// Copied from [MealKindNotifier].
  MealKindNotifierProvider(
    MealKind initValue,
  ) : this._internal(
          () => MealKindNotifier()..initValue = initValue,
          from: mealKindNotifierProvider,
          name: r'mealKindNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$mealKindNotifierHash,
          dependencies: MealKindNotifierFamily._dependencies,
          allTransitiveDependencies:
              MealKindNotifierFamily._allTransitiveDependencies,
          initValue: initValue,
        );

  MealKindNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.initValue,
  }) : super.internal();

  final MealKind initValue;

  @override
  MealKind runNotifierBuild(
    covariant MealKindNotifier notifier,
  ) {
    return notifier.build(
      initValue,
    );
  }

  @override
  Override overrideWith(MealKindNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: MealKindNotifierProvider._internal(
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
  AutoDisposeNotifierProviderElement<MealKindNotifier, MealKind>
      createElement() {
    return _MealKindNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MealKindNotifierProvider && other.initValue == initValue;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, initValue.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MealKindNotifierRef on AutoDisposeNotifierProviderRef<MealKind> {
  /// The parameter `initValue` of this provider.
  MealKind get initValue;
}

class _MealKindNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<MealKindNotifier, MealKind>
    with MealKindNotifierRef {
  _MealKindNotifierProviderElement(super.provider);

  @override
  MealKind get initValue => (origin as MealKindNotifierProvider).initValue;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
