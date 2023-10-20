import 'package:assessment/main.data.dart';
import 'package:assessment/model/TodoModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_data/flutter_data.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'LoginScreen.dart';
import 'model/AuthenticationResponse.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(
    overrides: [configureRepositoryLocalStorage(
        clear: LocalStorageClearStrategy.never
    )],
      child:  MyApp()));
}

class MyApp extends HookConsumerWidget {
 // const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToDos Assessment',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: RefreshIndicator(
          onRefresh: () async{
            ref.refresh(repositoryInitializerProvider);
          },
          child: Center(
            child: ref.watch(repositoryInitializerProvider).when(
                data: (_){
                  ref.authenticationResponses.logLevel=2;
                  ref.todoModels.logLevel=2;
                  //  final label=DataRequestLabel('findAll',type: 'other',requestId: 'ee4dd2',);
                  //  ref.todoModels.log(label,'testing nested labels', logLevel: 2);
                  return LoginScreen();
                },
                error: (error,stack)=> Text(error.toString()),
                loading: ()=> Center(child: CircularProgressIndicator())),
          ),
        ),
      ),
    );
  }
}
