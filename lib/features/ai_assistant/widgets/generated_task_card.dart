import 'package:flutter/material.dart';

class GeneratedTaskCard extends StatelessWidget {
  final Map<String, dynamic> taskData;
  final VoidCallback onImport;

  const GeneratedTaskCard({
    super.key,
    required this.taskData,
    required this.onImport,
  });

  @override
  Widget build(BuildContext context) {
    final priority = taskData['priority'] ?? 'medium';
    final priorityColor = _getPriorityColor(priority);
    final dueDate = taskData['dueDate'];

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Task Title and Priority
            Row(
              children: [
                Expanded(
                  child: Text(
                    taskData['title'] ?? 'Untitled Task',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: priorityColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    priority.toUpperCase(),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: priorityColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Task Description
            if (taskData['description'] != null && taskData['description'].isNotEmpty) ...[
              Text(
                taskData['description'],
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 12),
            ],

            // Due Date (if available)
            if (dueDate != null) ...[
              Row(
                children: [
                  Icon(
                    Icons.calendar_today,
                    size: 16,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Due: ${_formatDate(dueDate)}',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
            ],

            // Import Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: onImport,
                icon: const Icon(Icons.download, size: 18),
                label: const Text('Import Task'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getPriorityColor(String priority) {
    switch (priority.toLowerCase()) {
      case 'high':
        return Colors.red;
      case 'low':
        return Colors.green;
      default:
        return Colors.orange;
    }
  }

  String _formatDate(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      return '${date.month}/${date.day}/${date.year}';
    } catch (e) {
      return dateString;
    }
  }
} 