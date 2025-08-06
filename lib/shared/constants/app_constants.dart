class AppConstants {
  // App Info
  static const String appName = 'Smart Task Rescheduler';
  static const String appVersion = '1.0.0';
  
  // Storage Keys
  static const String userBoxName = 'user_box';
  static const String projectBoxName = 'project_box';
  static const String taskBoxName = 'task_box';
  static const String authTokenKey = 'auth_token';
  static const String userIdKey = 'user_id';
  
  // API Configuration
  static const String mockApiBaseUrl = 'https://api.example.com';
  static const int mockApiDelay = 1000; // milliseconds
  
  // Task Priorities
  static const Map<String, String> priorityLabels = {
    'low': 'Low',
    'medium': 'Medium',
    'high': 'High',
  };
  
  // Project Colors
  static const List<String> projectColors = [
    '#FF6B6B', // Red
    '#4ECDC4', // Teal
    '#45B7D1', // Blue
    '#96CEB4', // Green
    '#FFEAA7', // Yellow
    '#DDA0DD', // Plum
    '#98D8C8', // Mint
    '#F7DC6F', // Gold
    '#BB8FCE', // Purple
    '#85C1E9', // Light Blue
  ];
  
  // AI Assistant Prompts
  static const List<String> samplePrompts = [
    'Plan my week with 3 work tasks and 2 wellness tasks',
    'Create a project plan for launching a new product',
    'Generate daily tasks for improving productivity',
    'Plan a weekend trip with all necessary tasks',
    'Create a study schedule for exam preparation',
  ];
  
  // Validation Rules
  static const int minPasswordLength = 6;
  static const int maxTaskTitleLength = 100;
  static const int maxProjectNameLength = 50;
  
  // Animation Durations
  static const Duration shortAnimation = Duration(milliseconds: 200);
  static const Duration mediumAnimation = Duration(milliseconds: 300);
  static const Duration longAnimation = Duration(milliseconds: 500);
} 