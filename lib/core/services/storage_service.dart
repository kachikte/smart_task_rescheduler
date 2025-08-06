import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';
import '../models/project.dart';
import '../models/task.dart';
import '../../shared/constants/app_constants.dart';

class StorageService {
  static late Box<User> _userBox;
  static late Box<Project> _projectBox;
  static late Box<Task> _taskBox;
  static late SharedPreferences _prefs;

  static Future<void> initialize() async {
    await Hive.initFlutter();
    
    // Register adapters
    Hive.registerAdapter(UserAdapter());
    Hive.registerAdapter(ProjectAdapter());
    Hive.registerAdapter(TaskAdapter());
    Hive.registerAdapter(TaskPriorityAdapter());
    
    // Open boxes
    _userBox = await Hive.openBox<User>(AppConstants.userBoxName);
    _projectBox = await Hive.openBox<Project>(AppConstants.projectBoxName);
    _taskBox = await Hive.openBox<Task>(AppConstants.taskBoxName);
    
    // Initialize SharedPreferences
    _prefs = await SharedPreferences.getInstance();
  }

  // User operations
  static Future<void> saveUser(User user) async {
    await _userBox.put(user.id, user);
  }

  static User? getUser(String userId) {
    return _userBox.get(userId);
  }

  static Future<void> deleteUser(String userId) async {
    await _userBox.delete(userId);
  }

  // Project operations
  static Future<void> saveProject(Project project) async {
    await _projectBox.put(project.id, project);
  }

  static List<Project> getAllProjects() {
    return _projectBox.values.toList();
  }

  static List<Project> getProjectsByUser(String userId) {
    return _projectBox.values.where((project) => project.userId == userId).toList();
  }

  static Project? getProject(String projectId) {
    return _projectBox.get(projectId);
  }

  static Future<void> deleteProject(String projectId) async {
    await _projectBox.delete(projectId);
  }

  // Task operations
  static Future<void> saveTask(Task task) async {
    await _taskBox.put(task.id, task);
  }

  static List<Task> getAllTasks() {
    return _taskBox.values.toList();
  }

  static List<Task> getTasksByUser(String userId) {
    return _taskBox.values.where((task) => task.userId == userId).toList();
  }

  static List<Task> getTasksByProject(String projectId) {
    return _taskBox.values.where((task) => task.projectId == projectId).toList();
  }

  static Task? getTask(String taskId) {
    return _taskBox.get(taskId);
  }

  static Future<void> deleteTask(String taskId) async {
    await _taskBox.delete(taskId);
  }

  // SharedPreferences operations
  static Future<void> saveAuthToken(String token) async {
    await _prefs.setString(AppConstants.authTokenKey, token);
  }

  static String? getAuthToken() {
    return _prefs.getString(AppConstants.authTokenKey);
  }

  static Future<void> saveUserId(String userId) async {
    await _prefs.setString(AppConstants.userIdKey, userId);
  }

  static String? getUserId() {
    return _prefs.getString(AppConstants.userIdKey);
  }

  static Future<void> clearAuthData() async {
    await _prefs.remove(AppConstants.authTokenKey);
    await _prefs.remove(AppConstants.userIdKey);
  }

  static Future<void> clearAllData() async {
    await _userBox.clear();
    await _projectBox.clear();
    await _taskBox.clear();
    await clearAuthData();
  }

  // Close boxes
  static Future<void> close() async {
    await _userBox.close();
    await _projectBox.close();
    await _taskBox.close();
  }
} 