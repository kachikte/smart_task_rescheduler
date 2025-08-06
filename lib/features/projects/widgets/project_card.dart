import 'package:flutter/material.dart';
import '../../../core/models/project.dart';
import '../../../shared/theme/app_theme.dart';

class ProjectCard extends StatelessWidget {
  final Project project;
  final int totalTasks;
  final int completedTasks;
  final VoidCallback onTap;

  const ProjectCard({
    super.key,
    required this.project,
    required this.totalTasks,
    required this.completedTasks,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final progress = totalTasks > 0 ? completedTasks / totalTasks : 0.0;
    final color = _parseColor(project.color);

    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Project Color Indicator
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 12),

              // Project Name
              Text(
                project.name,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),

              // Project Description
              if (project.description.isNotEmpty) ...[
                Text(
                  project.description,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
              ],

              // Progress Bar
              LinearProgressIndicator(
                value: progress,
                backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
                valueColor: AlwaysStoppedAnimation<Color>(color),
              ),
              const SizedBox(height: 8),

              // Task Count
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '$completedTasks/$totalTasks tasks',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                  Text(
                    '${(progress * 100).toInt()}%',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _parseColor(String colorString) {
    try {
      return Color(int.parse(colorString.replaceAll('#', '0xFF')));
    } catch (e) {
      return AppTheme.projectColors.first;
    }
  }
} 