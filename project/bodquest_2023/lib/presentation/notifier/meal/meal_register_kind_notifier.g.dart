// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_register_kind_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$mealRegisterKindNotifierHash() =>
    r'e0ae400c320a704a695fd25e9b7420a4a2c35d5c';

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

abstract class _$MealRegisterKindNotifier
    extends BuildlessAutoDisposeNotifier<MealRegisterKind> {
  late final MealRegisterKind initValue;

  MealRegisterKind build(
    MealRegisterKind initValue,
  );
}

/// 食事登録の種類を状態管理
///
/// Copied from [MealRegisterKindNotifier].
@ProviderFor(MealRegisterKindNotifier)
const mealRegisterKindNotifierProvider = MealRegisterKindNotifierFamily();

/// 食事登録の種類を状態管理
///
/// Copied from [MealRegisterKindNotifier].
class MealRegisterKindNotifierFamily extends Family<MealRegisterKind> {
  /// 食事登録の種類を状態管理
  ///
  /// Copied from [MealRegisterKindNotifier].
  const MealRegisterKindNotifierFamily();

  /// 食事登録の種類を状態管理
  ///
  /// Copied from [MealRegisterKindNotifier].
  MealRegisterKindNotifierProvider call(
    MealRegisterKind initValue,
  ) {
    return MealRegisterKindNotifierProvider(
      initValue,
    );
  }

  @override
  MealRegisterKindNotifierProvider getProviderOverride(
    covariant MealRegisterKindNotifierProvider provider,
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
  String? get name => r'mealRegisterKindNotifierProvider';
}

/// 食事登録の種類を状態管理
///
/// Copied from [MealRegisterKindNotifier].
class MealRegisterKindNotifierProvider extends AutoDisposeNotifierProviderImpl<
    MealRegisterKindNotifier, MealRegisterKind> {
  /// 食事登録の種類を状態管理
  ///
  /// Copied from [MealRegisterKindNotifier].
  MealRegisterKindNotifierProvider(
    MealRegisterKind initValue,
  ) : this._internal(
          () => MealRegisterKindNotifier()..initValue = initValue,
          from: mealRegisterKindNotifierProvider,
          name: r'mealRegisterKindNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$mealRegisterKindNotifierHash,
          dependencies: MealRegisterKindNotifierFamily._dependencies,
          allTransitiveDependencies:
              MealRegisterKindNotifierFamily._allTransitiveDependencies,
          initValue: initValue,
        );

  MealRegisterKindNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.initValue,
  }) : super.internal();

  final MealRegisterKind initValue;

  @override
  MealRegisterKind runNotifierBuild(
    covariant MealRegisterKindNotifier notifier,
  ) {
    return notifier.build(
      initValue,
    );
  }

  @override
  Override overrideWith(MealRegisterKindNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: MealRegisterKindNotifierProvider._internal(
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
  AutoDisposeNotifierProviderElement<MealRegisterKindNotifier, MealRegisterKind>
      createElement() {
    return _MealRegisterKindNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MealRegisterKindNotifierProvider &&
        other.initValue == initValue;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, initValue.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MealRegisterKindNotifierRef
    on AutoDisposeNotifierProviderRef<MealRegisterKind> {
  /// The parameter `initValue` of this provider.
  MealRegisterKind get initValue;
}

class _MealRegisterKindNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<MealRegisterKindNotifier,
        MealRegisterKind> with MealRegisterKindNotifierRef {
  _MealRegisterKindNotifierProviderElement(super.provider);

  @override
  MealRegisterKind get initValue =>
      (origin as MealRegisterKindNotifierProvider).initValue;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
