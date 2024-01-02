// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_kind_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$trainingKindNotifierHash() =>
    r'6f7314b4b2cbb9a10638b0ea276f8f44676fd94b';

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

abstract class _$TrainingKindNotifier
    extends BuildlessAutoDisposeNotifier<TrainingKind> {
  late final TrainingKind initValue;

  TrainingKind build(
    TrainingKind initValue,
  );
}

/// トレーニング種類を状態管理
///
/// Copied from [TrainingKindNotifier].
@ProviderFor(TrainingKindNotifier)
const trainingKindNotifierProvider = TrainingKindNotifierFamily();

/// トレーニング種類を状態管理
///
/// Copied from [TrainingKindNotifier].
class TrainingKindNotifierFamily extends Family<TrainingKind> {
  /// トレーニング種類を状態管理
  ///
  /// Copied from [TrainingKindNotifier].
  const TrainingKindNotifierFamily();

  /// トレーニング種類を状態管理
  ///
  /// Copied from [TrainingKindNotifier].
  TrainingKindNotifierProvider call(
    TrainingKind initValue,
  ) {
    return TrainingKindNotifierProvider(
      initValue,
    );
  }

  @override
  TrainingKindNotifierProvider getProviderOverride(
    covariant TrainingKindNotifierProvider provider,
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
  String? get name => r'trainingKindNotifierProvider';
}

/// トレーニング種類を状態管理
///
/// Copied from [TrainingKindNotifier].
class TrainingKindNotifierProvider extends AutoDisposeNotifierProviderImpl<
    TrainingKindNotifier, TrainingKind> {
  /// トレーニング種類を状態管理
  ///
  /// Copied from [TrainingKindNotifier].
  TrainingKindNotifierProvider(
    TrainingKind initValue,
  ) : this._internal(
          () => TrainingKindNotifier()..initValue = initValue,
          from: trainingKindNotifierProvider,
          name: r'trainingKindNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$trainingKindNotifierHash,
          dependencies: TrainingKindNotifierFamily._dependencies,
          allTransitiveDependencies:
              TrainingKindNotifierFamily._allTransitiveDependencies,
          initValue: initValue,
        );

  TrainingKindNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.initValue,
  }) : super.internal();

  final TrainingKind initValue;

  @override
  TrainingKind runNotifierBuild(
    covariant TrainingKindNotifier notifier,
  ) {
    return notifier.build(
      initValue,
    );
  }

  @override
  Override overrideWith(TrainingKindNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: TrainingKindNotifierProvider._internal(
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
  AutoDisposeNotifierProviderElement<TrainingKindNotifier, TrainingKind>
      createElement() {
    return _TrainingKindNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TrainingKindNotifierProvider &&
        other.initValue == initValue;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, initValue.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TrainingKindNotifierRef on AutoDisposeNotifierProviderRef<TrainingKind> {
  /// The parameter `initValue` of this provider.
  TrainingKind get initValue;
}

class _TrainingKindNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<TrainingKindNotifier,
        TrainingKind> with TrainingKindNotifierRef {
  _TrainingKindNotifierProviderElement(super.provider);

  @override
  TrainingKind get initValue =>
      (origin as TrainingKindNotifierProvider).initValue;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
