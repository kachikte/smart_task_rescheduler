// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$filteredTasksHash() => r'e8f5274786c58dee22ffb1e6383ed6c16941a7bf';

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

/// See also [filteredTasks].
@ProviderFor(filteredTasks)
const filteredTasksProvider = FilteredTasksFamily();

/// See also [filteredTasks].
class FilteredTasksFamily extends Family<List<Task>> {
  /// See also [filteredTasks].
  const FilteredTasksFamily();

  /// See also [filteredTasks].
  FilteredTasksProvider call({
    String? projectId,
    bool? isCompleted,
  }) {
    return FilteredTasksProvider(
      projectId: projectId,
      isCompleted: isCompleted,
    );
  }

  @override
  FilteredTasksProvider getProviderOverride(
    covariant FilteredTasksProvider provider,
  ) {
    return call(
      projectId: provider.projectId,
      isCompleted: provider.isCompleted,
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
  String? get name => r'filteredTasksProvider';
}

/// See also [filteredTasks].
class FilteredTasksProvider extends AutoDisposeProvider<List<Task>> {
  /// See also [filteredTasks].
  FilteredTasksProvider({
    String? projectId,
    bool? isCompleted,
  }) : this._internal(
          (ref) => filteredTasks(
            ref as FilteredTasksRef,
            projectId: projectId,
            isCompleted: isCompleted,
          ),
          from: filteredTasksProvider,
          name: r'filteredTasksProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$filteredTasksHash,
          dependencies: FilteredTasksFamily._dependencies,
          allTransitiveDependencies:
              FilteredTasksFamily._allTransitiveDependencies,
          projectId: projectId,
          isCompleted: isCompleted,
        );

  FilteredTasksProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.projectId,
    required this.isCompleted,
  }) : super.internal();

  final String? projectId;
  final bool? isCompleted;

  @override
  Override overrideWith(
    List<Task> Function(FilteredTasksRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FilteredTasksProvider._internal(
        (ref) => create(ref as FilteredTasksRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        projectId: projectId,
        isCompleted: isCompleted,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<List<Task>> createElement() {
    return _FilteredTasksProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FilteredTasksProvider &&
        other.projectId == projectId &&
        other.isCompleted == isCompleted;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, projectId.hashCode);
    hash = _SystemHash.combine(hash, isCompleted.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FilteredTasksRef on AutoDisposeProviderRef<List<Task>> {
  /// The parameter `projectId` of this provider.
  String? get projectId;

  /// The parameter `isCompleted` of this provider.
  bool? get isCompleted;
}

class _FilteredTasksProviderElement
    extends AutoDisposeProviderElement<List<Task>> with FilteredTasksRef {
  _FilteredTasksProviderElement(super.provider);

  @override
  String? get projectId => (origin as FilteredTasksProvider).projectId;
  @override
  bool? get isCompleted => (origin as FilteredTasksProvider).isCompleted;
}

String _$overdueTasksHash() => r'27690a468c6a0dff3e732bc3ae4947e4a7f5a572';

/// See also [overdueTasks].
@ProviderFor(overdueTasks)
final overdueTasksProvider = AutoDisposeProvider<List<Task>>.internal(
  overdueTasks,
  name: r'overdueTasksProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$overdueTasksHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef OverdueTasksRef = AutoDisposeProviderRef<List<Task>>;
String _$todaysTasksHash() => r'3be7a16b41e75ddae1ea6aa40ad007a93e1f2c74';

/// See also [todaysTasks].
@ProviderFor(todaysTasks)
final todaysTasksProvider = AutoDisposeProvider<List<Task>>.internal(
  todaysTasks,
  name: r'todaysTasksProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$todaysTasksHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TodaysTasksRef = AutoDisposeProviderRef<List<Task>>;
String _$authNotifierHash() => r'f4b7beec0ba7bb4b5a7da72351f54a610337a056';

/// See also [AuthNotifier].
@ProviderFor(AuthNotifier)
final authNotifierProvider =
    AutoDisposeNotifierProvider<AuthNotifier, AsyncValue<User?>>.internal(
  AuthNotifier.new,
  name: r'authNotifierProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$authNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AuthNotifier = AutoDisposeNotifier<AsyncValue<User?>>;
String _$projectsNotifierHash() => r'ac450edf046e0feedbbc89a3d31298714e5fcafe';

/// See also [ProjectsNotifier].
@ProviderFor(ProjectsNotifier)
final projectsNotifierProvider =
    AutoDisposeNotifierProvider<ProjectsNotifier, List<Project>>.internal(
  ProjectsNotifier.new,
  name: r'projectsNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$projectsNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ProjectsNotifier = AutoDisposeNotifier<List<Project>>;
String _$tasksNotifierHash() => r'c21488183c1574384bc9c424d20ef4b32ee33335';

/// See also [TasksNotifier].
@ProviderFor(TasksNotifier)
final tasksNotifierProvider =
    AutoDisposeNotifierProvider<TasksNotifier, List<Task>>.internal(
  TasksNotifier.new,
  name: r'tasksNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$tasksNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TasksNotifier = AutoDisposeNotifier<List<Task>>;
String _$aIServiceNotifierHash() => r'8d3a07adc7640f24ad655dcaab9917ca8ac72327';

/// See also [AIServiceNotifier].
@ProviderFor(AIServiceNotifier)
final aIServiceNotifierProvider = AutoDisposeAsyncNotifierProvider<
    AIServiceNotifier, List<Map<String, dynamic>>>.internal(
  AIServiceNotifier.new,
  name: r'aIServiceNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$aIServiceNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AIServiceNotifier
    = AutoDisposeAsyncNotifier<List<Map<String, dynamic>>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
