import 'package:uuid/uuid.dart';
import '../models/user.dart';
import 'storage_service.dart';
import '../../shared/constants/app_constants.dart';

class AuthService {
  static const _uuid = Uuid();

  // Mock login
  static Future<User> login(String email, String password) async {
    // Simulate API delay
    await Future.delayed(Duration(milliseconds: AppConstants.mockApiDelay));
    
    // Mock validation
    if (email.isEmpty || password.isEmpty) {
      throw Exception('Email and password are required');
    }
    
    if (password.length < AppConstants.minPasswordLength) {
      throw Exception('Password must be at least ${AppConstants.minPasswordLength} characters');
    }
    
    // Mock user creation/login
    final userId = _uuid.v4();
    final sessionToken = _uuid.v4();
    final now = DateTime.now();
    
    final user = User(
      id: userId,
      email: email,
      name: email.split('@')[0], // Use email prefix as name
      createdAt: now,
      updatedAt: now,
      sessionToken: sessionToken,
    );
    
    // Save user and session data
    await StorageService.saveUser(user);
    await StorageService.saveAuthToken(sessionToken);
    await StorageService.saveUserId(userId);
    
    return user;
  }

  // Mock registration
  static Future<User> register(String email, String password, String name) async {
    // Simulate API delay
    await Future.delayed(Duration(milliseconds: AppConstants.mockApiDelay));
    
    // Mock validation
    if (email.isEmpty || password.isEmpty || name.isEmpty) {
      throw Exception('All fields are required');
    }
    
    if (password.length < AppConstants.minPasswordLength) {
      throw Exception('Password must be at least ${AppConstants.minPasswordLength} characters');
    }
    
    if (!_isValidEmail(email)) {
      throw Exception('Please enter a valid email address');
    }
    
    // Check if user already exists (mock)
    final existingUser = StorageService.getUser(email);
    if (existingUser != null) {
      throw Exception('User with this email already exists');
    }
    
    // Create new user
    final userId = _uuid.v4();
    final sessionToken = _uuid.v4();
    final now = DateTime.now();
    
    final user = User(
      id: userId,
      email: email,
      name: name,
      createdAt: now,
      updatedAt: now,
      sessionToken: sessionToken,
    );
    
    // Save user and session data
    await StorageService.saveUser(user);
    await StorageService.saveAuthToken(sessionToken);
    await StorageService.saveUserId(userId);
    
    return user;
  }

  // Logout
  static Future<void> logout() async {
    await StorageService.clearAuthData();
  }

  // Check if user is authenticated
  static bool isAuthenticated() {
    final token = StorageService.getAuthToken();
    final userId = StorageService.getUserId();
    return token != null && userId != null;
  }

  // Get current user
  static User? getCurrentUser() {
    final userId = StorageService.getUserId();
    if (userId != null) {
      return StorageService.getUser(userId);
    }
    return null;
  }

  // Validate email format
  static bool _isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  // Refresh session (mock)
  static Future<void> refreshSession() async {
    final userId = StorageService.getUserId();
    if (userId != null) {
      final user = StorageService.getUser(userId);
      if (user != null) {
        final newToken = _uuid.v4();
        final updatedUser = user.copyWith(
          sessionToken: newToken,
          updatedAt: DateTime.now(),
        );
        await StorageService.saveUser(updatedUser);
        await StorageService.saveAuthToken(newToken);
      }
    }
  }
} 