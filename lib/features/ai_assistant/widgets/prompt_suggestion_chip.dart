import 'package:flutter/material.dart';

class PromptSuggestionChip extends StatelessWidget {
  final String prompt;
  final VoidCallback onTap;

  const PromptSuggestionChip({
    super.key,
    required this.prompt,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      label: Text(
        prompt,
        style: Theme.of(context).textTheme.bodySmall,
      ),
      onPressed: onTap,
      backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
      side: BorderSide(
        color: Theme.of(context).colorScheme.outline.withOpacity(0.3),
      ),
      elevation: 0,
      pressElevation: 2,
    );
  }
} 