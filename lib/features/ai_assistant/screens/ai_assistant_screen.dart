import 'package:flutter/material.dart';
import '../../../shared/constants/app_constants.dart';
import '../widgets/generated_task_card.dart';
import '../widgets/prompt_suggestion_chip.dart';

class AIAssistantScreen extends StatefulWidget {
  const AIAssistantScreen({super.key});

  @override
  State<AIAssistantScreen> createState() => _AIAssistantScreenState();
}

class _AIAssistantScreenState extends State<AIAssistantScreen> {
  final _promptController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  List<Map<String, dynamic>> _generatedTasks = [];

  @override
  void dispose() {
    _promptController.dispose();
    super.dispose();
  }

  Future<void> _generateTasks() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      // Simulate AI task generation
      await Future.delayed(const Duration(seconds: 2));

      // Mock generated tasks
      final tasks = <Map<String, dynamic>>[];
      
      if (_promptController.text.toLowerCase().contains('work')) {
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
        ]);
      } else {
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
        ]);
      }

      setState(() {
        _isLoading = false;
        _generatedTasks = tasks;
      });
    }
  }



  void _importTask(Map<String, dynamic> taskData) {
    // For now, just show a success message
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Task imported successfully!'),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _importAllTasks(List<Map<String, dynamic>> tasks) {
    // For now, just show a success message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Imported ${tasks.length} tasks successfully!'),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Assistant'),
        elevation: 0,
      ),
      body: Column(
        children: [
          // Input Section
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Prompt Input
                Form(
                  key: _formKey,
                  child: TextFormField(
                    controller: _promptController,
                    maxLines: 3,
                    decoration: const InputDecoration(
                      labelText: 'Describe what you want to accomplish',
                      hintText: 'e.g., Plan my week with 3 work tasks and 2 wellness tasks',
                      prefixIcon: Icon(Icons.psychology),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter a prompt';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 16),

                // Generate Button
                ElevatedButton.icon(
                  onPressed: _isLoading ? null : _generateTasks,
                  icon: _isLoading
                      ? const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Icon(Icons.auto_awesome),
                  label: Text(_isLoading ? 'Generating...' : 'Generate Tasks'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ],
            ),
          ),

          // Prompt Suggestions
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Try these prompts:',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: AppConstants.samplePrompts.map((prompt) {
                    return PromptSuggestionChip(
                      prompt: prompt,
                      onTap: () {
                        _promptController.text = prompt;
                      },
                    );
                  }).toList(),
                ),
              ],
            ),
          ),

          // Generated Tasks
          Expanded(
            child: _isLoading
                ? const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 16),
                        Text('Generating tasks...'),
                      ],
                    ),
                  )
                : _generatedTasks.isEmpty
                    ? const Center(
                        child: Text('Enter a prompt to generate tasks'),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: _generatedTasks.length + 1, // +1 for import all button
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: ElevatedButton.icon(
                                onPressed: () => _importAllTasks(_generatedTasks),
                                icon: const Icon(Icons.download),
                                label: const Text('Import All Tasks'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  foregroundColor: Colors.white,
                                ),
                              ),
                            );
                          }

                          final taskData = _generatedTasks[index - 1];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: GeneratedTaskCard(
                              taskData: taskData,
                              onImport: () => _importTask(taskData),
                            ),
                          );
                        },
                      ),
          ),
        ],
      ),
    );
  }
} 