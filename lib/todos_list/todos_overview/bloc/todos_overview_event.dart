part of 'todos_overview_bloc.dart';

abstract class TodosOverviewEvent extends Equatable {
  const TodosOverviewEvent();

  @override
  List<Object> get props => [];
}

class TodosOverviewSubscrtionRequested extends TodosOverviewEvent {
  const TodosOverviewSubscrtionRequested();
}

class TodosOverviewTodoCompletionToggled extends TodosOverviewEvent {
  final Todo todo;
  final bool isCompleted;

  const TodosOverviewTodoCompletionToggled({
    required this.todo,
    required this.isCompleted,
  });

  @override
  List<Object> get props => [todo, isCompleted];
}

class TodosOverviewTodoDeleted extends TodosOverviewEvent {
  final Todo todo;

  const TodosOverviewTodoDeleted({required this.todo});

  @override
  List<Object> get props => [todo];
}

class TodosOverviewUndoDeletionRequested extends TodosOverviewEvent {
  const TodosOverviewUndoDeletionRequested();
}

class TodosOverviewFilterChanged extends TodosOverviewEvent {
  final TodosViewFilter filter;

  const TodosOverviewFilterChanged({required this.filter});

  @override
  List<Object> get props => [filter];
}

class TodosOverviewToggleCompleteAllRequested extends TodosOverviewEvent {
  const TodosOverviewToggleCompleteAllRequested();
}

class TodosOverviewClearCompletedRequested extends TodosOverviewEvent {
  const TodosOverviewClearCompletedRequested();
}
