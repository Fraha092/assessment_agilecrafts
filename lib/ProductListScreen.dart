import 'package:assessment/adapters/Todo_adapter.dart';
import 'package:assessment/main.data.dart';
import 'package:assessment/model/TodoModel.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final todoProvider = FutureProvider.autoDispose<List<TodoModel>>((ref) async {
  return ref.todoModels.todoAdapter.fetchAll();
});

class ProductListScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todosAsyncValue = ref.watch(todoProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: todosAsyncValue.when(
        data: (todos) {
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];
              return ListTile(
                title: Text(todo.name),
                subtitle: Text(todo.description),
                trailing: Checkbox(
                  value: todo.isAvailable,
                  onChanged: (newValue) {
                    newValue=true;
                  },
                ),
              );
            },
          );
        },
        loading: () => Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }
}
