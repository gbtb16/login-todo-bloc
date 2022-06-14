import 'package:flutter/material.dart';

import '../../../packages/todos_repository/todos_repository.dart';

class TodoListTile extends StatelessWidget {
  final Todo todo;
  final ValueChanged<bool>? onToggledCompleted;
  final DismissDirectionCallback? onDismissed;
  final VoidCallback? onTap;

  const TodoListTile({
    Key? key,
    required this.todo,
    required this.onToggledCompleted,
    required this.onDismissed,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Dismissible(
      key: Key('todoListTile_dismissible_${todo.id}'),
      onDismissed: onDismissed,
      background: Container(
        alignment: Alignment.centerRight,
        color: theme.colorScheme.error,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      child: ListTile(
        onTap: onTap,
        title: Text(
          todo.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: !todo.isCompleted
              ? null
              : TextStyle(
                  color: theme.colorScheme.secondary,
                  decoration: TextDecoration.lineThrough,
                ),
        ),
        subtitle: Text(
          todo.description,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        leading: Checkbox(
          shape: const ContinuousRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(0)),
          ),
          value: todo.isCompleted,
          onChanged: onToggledCompleted == null
              ? null
              : (value) => onToggledCompleted!(value!),
        ),
        trailing: onTap == null
            ? null
            : const Icon(
                Icons.chevron_right_rounded,
              ),
      ),
    );
  }
}
