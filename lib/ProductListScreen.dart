import 'package:assessment/model/TodoModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_data/flutter_data.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'main.data.dart';

class ProductListScreen extends HookConsumerWidget {
  //const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
   // final _newNameController=useTextEditingController();
   // final _newDesController=useTextEditingController();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Todo List'),
        backgroundColor: Colors.purple.shade200,
        ),

        body: Center(
          child: ref.watch(repositoryInitializerProvider).when(
            error: (error, _) => Text(error.toString()),
            loading: () => const CircularProgressIndicator(),
            data: (_) {
               final _newNameController=useTextEditingController();
               final _newDesController=useTextEditingController();
              final state = ref.todoModels.watchAll();
              if (state.isLoading) {
                return CircularProgressIndicator();
              }
              return ListView(
                children: [
              //   TextField(
              //   controller: _newNameController,
              //   onSubmitted: (value) async {
              //     // TodoModel(name: value.toString(),description: ,).save();
              //     _newNameController.clear();
              //   },
              // ),
              // TextField(
              //   controller: _newDesController,
              //   onSubmitted: (value) async {
              //     // TodoModel(description: value.toString()).save();
              //     _newDesController.clear();
              //   },
              // ),
              // ElevatedButton(
              //   onPressed: () async {
              //     TodoModel(name: _newNameController.text.toString(),description: _newDesController.text.toString(),isAvailable: false).save();
              //   },
              //   child: Text('Save'),
              // ),
                  for (final todo in state.model)
                    ListTile(
                      leading: Checkbox(
                        value: todo.isAvailable,
                        onChanged: (value) => todo.save(),
                      ),
                      title: Text('${todo.name} '),
                      subtitle: Text('${todo.description} '),
                    ),
                ],
              );
            },
          ),
        ),
        // floatingActionButton: FloatingActionButton(
        //
        //   onPressed: (){
        //     TextField(
        //       controller: _newNameController,
        //       onSubmitted: (value) async {
        //        // TodoModel(name: value.toString(),description: ,).save();
        //         _newNameController.clear();
        //       },
        //     );
        //     TextField(
        //       controller: _newDesController,
        //       onSubmitted: (value) async {
        //        // TodoModel(description: value.toString()).save();
        //         _newDesController.clear();
        //       },
        //     );
        //     ElevatedButton(
        //       onPressed: () async {
        //         TodoModel(name: _newNameController.text.toString(),description: _newDesController.text.toString(),isAvailable: false).toggleCompleted().save();
        //       },
        //       child: Text('Save'),
        //     );
        //   },
        // ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}




// import 'package:assessment/adapters/Todo_adapter.dart';
// import 'package:assessment/main.data.dart';
// import 'package:assessment/model/AuthenticationModel.dart';
// import 'package:assessment/model/TodoModel.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_data/flutter_data.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
//
// // final todoProvider = FutureProvider.autoDispose<List<TodoModel>>((ref) async {
// //   return ref.todoModels.todoAdapter.fetchAll();
// // });
//
// class ProductListScreen extends HookConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//    // final todosAsyncValue = ref.watch(todoProvider);
//
//    // final _newTodoController= useTextEditingController();
//     final state=ref.authenticationModels.watchOne(1,
//     params: {'_embed':'todoModels'},
//       alsoWatch: (user)=>[user.todoModels],
//     );
//
//     if(state.isLoading){
//       return CircularProgressIndicator();
//     }
//     final user=state.model!;
//     final todos=user.todoModels.toList()..sort();
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Product List'),
//       ),
//       body: RefreshIndicator(
//         //onRefresh: ()=> ref.todoModels.findOne(1,params: {'_embed':'todoModels'}),
//         onRefresh: ()=> ref.todoModels.todoAdapter.fetchAll(),
//         child: ListView(
//           children: [
//             for(final todo in todos )
//               Dismissible(
//                   key: ValueKey(todo),
//                   direction: DismissDirection.endToStart,
//                   onDismissed: (_)=>todo.delete(),
//                   child: ListTile(
//                     leading: Checkbox(
//                       value: todo.isAvailable,
//                       onChanged: (value)async{
//                        // final save=await todo.save();
//                        // value=save as bool?;
//                       },
//                     ),
//                     title: Text('title: ${todo.name} \n description: ${todo.description} [id: ${todo.id}${DataModel.keyFor(todo).detypify()}'),
//                    // subtitle: Text('${todo.description}'),
//                   ),
//               )
//           ],
//         ),
//       ),
//       // todosAsyncValue.when(
//       //   data: (todos) {
//       //     return ListView.builder(
//       //       itemCount: todos.length,
//       //       itemBuilder: (context, index) {
//       //         final todo = todos[index];
//       //         return ListTile(
//       //           title: Text(todo.name),
//       //           subtitle: Text(todo.description),
//       //           trailing: Checkbox(
//       //             value: todo.isAvailable,
//       //             onChanged: (newValue) {
//       //               newValue=true;
//       //             },
//       //           ),
//       //         );
//       //       },
//       //     );
//       //   },
//       //   loading: () => Center(child: CircularProgressIndicator()),
//       //   error: (err, stack) => Center(child: Text('Error: $err')),
//       // ),
//     );
//   }
// }
