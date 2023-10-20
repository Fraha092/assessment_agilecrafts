import 'package:assessment/main.data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'adapters/Todo_adapter.dart';
import 'model/TodoModel.dart';

class ProductListScreen extends HookConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: ref.watch(repositoryInitializerProvider).when(
          error: (error, _) => Text(error.toString()),
          loading: () => const CircularProgressIndicator(),
          data: (_) =>TodoList()
        ),
      ),
    );
  }
}

class TodoList extends HookConsumerWidget {
 // const TodoList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.todoModels.watchAll();
    // if (state.hasModel) {
    //   return CircularProgressIndicator();
    // }
    return ListView(
      children: [
        for (final task in state.model)
          Text(task.name),
      ],
    );
  }
}
