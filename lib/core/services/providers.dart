import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user.dart';
import '../models/project.dart';
import '../models/task.dart';
import 'auth_service.dart';
import 'storage_service.dart';
import 'ai_service.dart';

part 'providers.g.dart';

// Auth Provider
@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  AsyncValue<User?> build() {
    return AsyncValue<User?>.data(AuthService.getCurrentUser());
  }

  Future<void> login(String email, String password) async {
    state = const AsyncValue<User?>.loading();
    try {
      final user = await AuthService.login(email, password);
      state = AsyncValue<User?>.data(user);
    } catch (e) {
      state = AsyncValue<User?>.error(e, StackTrace.current);
    }
  }

  Future<void> register(String email, String password, String name) async {
    state = const AsyncValue<User?>.loading();
    try {
      final user = await AuthService.register(email, password, name);
      state = AsyncValue<User?>.data(user);
    } catch (e) {
      state = AsyncValue<User?>.error(e, StackTrace.current);
    }
  }

  Future<void> logout() async {
    await AuthService.logout();
    state = const AsyncValue<User?>.data(null);
  }

  bool get isAuthenticated => state.value != null;
}

// Projects Provider
@riverpod
class ProjectsNotifier extends _$ProjectsNotifier {
  @override
  List<Project> build() {
    final user = ref.watch(authNotifierProvider).value;
    if (user != null) {
      return StorageService.getProjectsByUser(user.id);
    }
    return [];
  }

  Future<void> createProject(String name, String description, String color) async {
    final user = ref.read(authNotifierProvider).value;
    if (user == null) return;

    final project = Project(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      description: description,
      color: color,
      userId: user.id,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    await StorageService.saveProject(project);
    ref.invalidateSelf();
  }

  Future<void> updateProject(Project project) async {
    final updatedProject = project.copyWith(updatedAt: DateTime.now());
    await StorageService.saveProject(updatedProject);
    ref.invalidateSelf();
  }

  Future<void> deleteProject(String projectId) async {
    await StorageService.deleteProject(projectId);
    ref.invalidateSelf();
  }

  Future<void> archiveProject(String projectId) async {
    final project = StorageService.getProject(projectId);
    if (project != null) {
      final updatedProject = project.copyWith(isArchived: true);
      await StorageService.saveProject(updatedProject);
      ref.invalidateSelf();
    }
  }
}

// Tasks Provider
@riverpod
class TasksNotifier extends _$TasksNotifier {
  @override
  List<Task> build() {
    final user = ref.watch(authNotifierProvider).value;
    if (user != null) {
      return StorageService.getTasksByUser(user.id);
    }
    return [];
  }

  Future<void> createTask(String title, String description, TaskPriority priority, DateTime? dueDate, String projectId) async {
    final user = ref.read(authNotifierProvider).value;
    if (user == null) return;

    final task = Task(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      description: description,
      priority: priority,
      dueDate: dueDate,
      projectId: projectId,
      userId: user.id,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    await StorageService.saveTask(task);
    ref.invalidateSelf();
  }

  Future<void> updateTask(Task task) async {
    final updatedTask = task.copyWith(updatedAt: DateTime.now());
    await StorageService.saveTask(updatedTask);
    ref.invalidateSelf();
  }

  Future<void> deleteTask(String taskId) async {
    await StorageService.deleteTask(taskId);
    ref.invalidateSelf();
  }

  Future<void> toggleTaskCompletion(String taskId) async {
    final task = StorageService.getTask(taskId);
    if (task != null) {
      final updatedTask = task.copyWith(
        isCompleted: !task.isCompleted,
        completedAt: !task.isCompleted ? DateTime.now() : null,
        updatedAt: DateTime.now(),
      );
      await StorageService.saveTask(updatedTask);
      ref.invalidateSelf();
    }
  }

  Future<void> updateTaskPriority(String taskId, TaskPriority priority) async {
    final task = StorageService.getTask(taskId);
    if (task != null) {
      final updatedTask = task.copyWith(
        priority: priority,
        updatedAt: DateTime.now(),
      );
      await StorageService.saveTask(updatedTask);
      ref.invalidateSelf();
    }
  }

  Future<void> updateTaskDueDate(String taskId, DateTime? dueDate) async {
    final task = StorageService.getTask(taskId);
    if (task != null) {
      final updatedTask = task.copyWith(
        dueDate: dueDate,
        updatedAt: DateTime.now(),
      );
      await StorageService.saveTask(updatedTask);
      ref.invalidateSelf();
    }
  }
}

// AI Service Provider
@riverpod
class AIServiceNotifier extends _$AIServiceNotifier {
  @override
  Future<List<Map<String, dynamic>>> build() async {
    return [];
  }

  Future<void> generateTasks(String prompt, String projectId) async {
    state = const AsyncValue.loading();
    try {
      final tasks = await AIService.generateTasks(prompt, projectId);
      state = AsyncValue.data(tasks);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<String> suggestNewTime(Task task) async {
    try {
      return await AIService.suggestNewTime(task);
    } catch (e) {
      return 'Tomorrow at 10:00 AM';
    }
  }
}

// Filtered Tasks Provider
@riverpod
List<Task> filteredTasks(Ref ref, {String? projectId, bool? isCompleted}) {
  final tasks = ref.watch(tasksNotifierProvider);
  
  return tasks.where((task) {
    if (projectId != null && task.projectId != projectId) return false;
    if (isCompleted != null && task.isCompleted != isCompleted) return false;
    return true;
  }).toList();
}

// Overdue Tasks Provider
@riverpod
List<Task> overdueTasks(Ref ref) {
  final tasks = ref.watch(tasksNotifierProvider);
  
  return tasks.where((task) => task.isOverdue).toList();
}

// Today's Tasks Provider
@riverpod
List<Task> todaysTasks(Ref ref) {
  final tasks = ref.watch(tasksNotifierProvider);
  final today = DateTime.now();
  
  return tasks.where((task) {
    if (task.dueDate == null) return false;
    final taskDate = DateTime(task.dueDate!.year, task.dueDate!.month, task.dueDate!.day);
    final todayDate = DateTime(today.year, today.month, today.day);
    return taskDate.isAtSameMomentAs(todayDate);
  }).toList();
} 