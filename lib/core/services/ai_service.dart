import '../models/task.dart';
import '../../shared/constants/app_constants.dart';

class AIService {
  static bool _isInitialized = false;

  static Future<void> initialize() async {
    if (_isInitialized) return;
    
    // For now, we'll use mock responses only
    // In a real implementation, you would initialize OpenAI here
    _isInitialized = true;
  }

  // Generate tasks based on user prompt
  static Future<List<Map<String, dynamic>>> generateTasks(String prompt, String projectId) async {
    await initialize();
    
    // Use mock task generation
    return await _generateTasksWithMock(prompt, projectId);
  }

  // Generate tasks using mock data
  static Future<List<Map<String, dynamic>>> _generateTasksWithMock(String prompt, String projectId) async {
    // Simulate API delay
    await Future.delayed(Duration(milliseconds: AppConstants.mockApiDelay));
    
    // Mock task generation based on prompt keywords
    final tasks = <Map<String, dynamic>>[];
    
    if (prompt.toLowerCase().contains('work')) {
      tasks.addAll([
        {
          'title': 'Review project requirements',
          'description': 'Go through the project documentation and identify key deliverables',
          'priority': 'high',
          'dueDate': DateTime.now().add(const Duration(days: 1)).toIso8601String().split('T')[0],
        },
        {
          'title': 'Schedule team meeting',
          'description': 'Coordinate with team members to set up weekly sync meeting',
          'priority': 'medium',
          'dueDate': DateTime.now().add(const Duration(days: 2)).toIso8601String().split('T')[0],
        },
        {
          'title': 'Update project timeline',
          'description': 'Review and update the project timeline with current progress',
          'priority': 'medium',
        },
      ]);
    }
    
    if (prompt.toLowerCase().contains('wellness') || prompt.toLowerCase().contains('health')) {
      tasks.addAll([
        {
          'title': '30-minute workout session',
          'description': 'Complete a full-body workout routine',
          'priority': 'high',
          'dueDate': DateTime.now().toIso8601String().split('T')[0],
        },
        {
          'title': 'Meditation practice',
          'description': 'Spend 15 minutes in mindfulness meditation',
          'priority': 'medium',
        },
      ]);
    }
    
    if (prompt.toLowerCase().contains('study') || prompt.toLowerCase().contains('exam')) {
      tasks.addAll([
        {
          'title': 'Review chapter 5-7',
          'description': 'Read and take notes on the assigned chapters',
          'priority': 'high',
          'dueDate': DateTime.now().add(const Duration(days: 1)).toIso8601String().split('T')[0],
        },
        {
          'title': 'Practice exam questions',
          'description': 'Complete practice problems from the study guide',
          'priority': 'high',
          'dueDate': DateTime.now().add(const Duration(days: 2)).toIso8601String().split('T')[0],
        },
        {
          'title': 'Create study flashcards',
          'description': 'Make flashcards for key concepts and definitions',
          'priority': 'medium',
        },
      ]);
    }
    
    // Default tasks if no specific keywords found
    if (tasks.isEmpty) {
      tasks.addAll([
        {
          'title': 'Review and plan day',
          'description': 'Take time to review your schedule and plan your day effectively',
          'priority': 'medium',
          'dueDate': DateTime.now().toIso8601String().split('T')[0],
        },
        {
          'title': 'Complete priority task',
          'description': 'Focus on completing your most important task for the day',
          'priority': 'high',
        },
        {
          'title': 'Organize workspace',
          'description': 'Clean and organize your workspace for better productivity',
          'priority': 'low',
        },
      ]);
    }
    
    return tasks;
  }

  // Suggest new time for overdue tasks
  static Future<String> suggestNewTime(Task task) async {
    await initialize();
    
    // Use mock time suggestions
    return await _suggestTimeWithMock(task);
  }

  // Suggest time using mock logic
  static Future<String> _suggestTimeWithMock(Task task) async {
    // Simulate API delay
    await Future.delayed(Duration(milliseconds: AppConstants.mockApiDelay));
    
    // Suggest based on priority
    switch (task.priority) {
      case TaskPriority.high:
        return 'Tomorrow at 9:00 AM';
      case TaskPriority.medium:
        return 'Tomorrow at 2:00 PM';
      case TaskPriority.low:
        return 'This Friday at 3:00 PM';
    }
  }
} 