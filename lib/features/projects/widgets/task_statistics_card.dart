import 'package:flutter/material.dart';

class TaskStatisticsCard extends StatelessWidget {
  final int totalTasks;
  final int completedTasks;
  final int todaysTasks;
  final int overdueTasks;

  const TaskStatisticsCard({
    super.key,
    required this.totalTasks,
    required this.completedTasks,
    required this.todaysTasks,
    required this.overdueTasks,
  });

  @override
  Widget build(BuildContext context) {
    final completionRate = totalTasks > 0 ? (completedTasks / totalTasks) : 0.0;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Task Overview',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            // Progress Circle
            Row(
              children: [
                SizedBox(
                  width: 80,
                  height: 80,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CircularProgressIndicator(
                        value: completionRate,
                        strokeWidth: 8,
                        backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '${(completionRate * 100).toInt()}%',
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          Text(
                            'Done',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context).colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 24),

                // Statistics
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildStatItem(
                        context,
                        'Total Tasks',
                        totalTasks.toString(),
                        Icons.task_alt,
                        Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(height: 12),
                      _buildStatItem(
                        context,
                        "Today's Tasks",
                        todaysTasks.toString(),
                        Icons.today,
                        Colors.orange,
                      ),
                      const SizedBox(height: 12),
                      _buildStatItem(
                        context,
                        'Overdue',
                        overdueTasks.toString(),
                        Icons.warning,
                        Colors.red,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(
    BuildContext context,
    String label,
    String value,
    IconData icon,
    Color color,
  ) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            size: 20,
            color: color,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              Text(
                value,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
} 