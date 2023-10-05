import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:assessment/model/AuthenticationRequest.dart';
import 'package:flutter_data/flutter_data.dart';

mixin AuthenticationAdapter<AuthenticationResponse extends DataModel<AuthenticationResponse>> on RemoteAdapter<AuthenticationResponse>{
  @override
  String get baseUrl=>'https://stg-zero.propertyproplus.com.au/api/';

  Future<AuthenticationResponse?> LoginAuthentication(int tenantId, AuthenticationRequest body) async{
    return sendRequest(
      '${baseUrl}TokenAuth/Authenticate'.asUri,
      method: DataRequestMethod.POST,
      headers: {
        'Content-Type': 'application/json',
        'Abp.TenantId': tenantId.toString()
      },
      body: json.encode(body.toMap()),
      onSuccess: (data, label) async{
        print('body:::${data.body.toString()}');

        final token=(data.body as Map<String, dynamic>)['result']['accessToken'];
       // print('token:::$token');
        SharedPreferences prefs=await SharedPreferences.getInstance();
        prefs.setString('accessToken', token);
        final sc=await deserialize((data.body as Map<String, dynamic>));
        //print('body of sc:::$sc');
        return sc.model;
      },
      onError: (e, label){
        print(e.toString());
        return null;
      }
    );
  }
}