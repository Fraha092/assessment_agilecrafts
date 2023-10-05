import 'dart:convert';

import 'package:flutter_data/flutter_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

mixin TodoAdapter<TodoModel extends DataModel<TodoModel>> on RemoteAdapter<TodoModel>{
  @override
  String get baseUrl=>'https://stg-zero.propertyproplus.com.au/api/';

  @override
  String urlForFindAll(Map<String, dynamic> params)=>'services/app/ProductSync/GetAllproduct';


  Future<TodoModel?> fetchAll() async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    final token=prefs.getString('accessToken');
    //final payload=body.toMap();
     print('token:::$token');

    return sendRequest(
     // '$baseUrl$urlForFindAll'.asUri,
      '${baseUrl}services/app/ProductSync/GetAllproduct'.asUri,
      method: DataRequestMethod.GET,
        headers: {
          'TenantId': '10',
          'Authorization': 'Bearer $token',
    },
        //body: json.encode(),
        onSuccess: (data, label) async{
          final sc=await deserialize((data.body as Map<String, dynamic>));
          return sc.model;
        },
        onError: (e, label){
          print(e.toString());
          return null;
        }

    );
  }



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
}
