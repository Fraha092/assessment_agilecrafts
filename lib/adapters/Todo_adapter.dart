import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter_data/flutter_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/TodoModel.dart';


mixin TodoAdapter<TodoModel extends DataModel<TodoModel>> on RemoteAdapter<TodoModel>{
  @override
  String get baseUrl => 'https://stg-zero.propertyproplus.com.au/api/services/app/ProductSync/';

  @override
  String urlForFindAll(Map<String, dynamic> params) => 'GetAllproduct';

  @override
  DataRequestMethod methodForFindAll(Map<String, dynamic> params) => DataRequestMethod.GET;

  @override
  FutureOr<Map<String, String>> get defaultHeaders async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('accessToken');

    return await super.defaultHeaders..addAll({
      'TenantId': '10',
      'Authorization': 'Bearer $token',
    });
  }


}
//
// final todoAdapterProvider = Provider<TodoAdapter>((ref) => TodoAdapter());
//
// final productProvider = FutureProvider<List<TodoModel>>((ref) {
//   return ref.watch(todoAdapterProvider).findAll();
// });


//   Future<TodoModel?> fetchAll() async{
//   SharedPreferences prefs=await SharedPreferences.getInstance();
//   final token=prefs.getString('accessToken');
//   //final payload=body.toMap();
//    print('token:::$token');
//
//   return sendRequest(
//    // '$baseUrl$urlForFindAll'.asUri,
//     '${baseUrl}services/app/ProductSync/GetAllproduct'.asUri,
//     method: DataRequestMethod.GET,
//       headers: {
//         'TenantId': '10',
//         'Authorization': 'Bearer $token',
//   },
//       //body: json.encode(),
//       onSuccess: (data, label) async{
//         final sc=await deserialize((data.body as Map<String, dynamic>));
//         return sc.model;
//       },
//       onError: (e, label){
//         print(e.toString());
//         return null;
//       }
//
//   );
// }



// Future<List<TodoModel>> fetchAll() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   String? token = prefs.getString('accessToken');
//   final response = await sendRequest(
//     '${baseUrl}services/app/ProductSync/GetAllproduct'.asUri,
//     //'$baseUrl$urlForFindAll'.asUri,
//     method: DataRequestMethod.GET,
//     headers: {
//       'TenantId': '10',
//       'Authorization': 'Bearer $token',
//     },
//     // onSuccess: (data, label)async {
//     //   final sc=await deserialize((data.body as Map<String, dynamic>));
//     //   return sc.model;
//     // },
//     // onError: (e, label) {
//     //   return null;
//     // }
//   );
//
//   // final data =await deserialize((response.body as List));
//   // final x=data.model;
//   final data = response.body as List;
//   List<TodoModel> todoList = [];
//   for (var item in data) {
//     final deserializedData = await deserialize(item);
//     todoList.add(deserializedData.model as TodoModel);
//   }
//   return todoList;
// }
