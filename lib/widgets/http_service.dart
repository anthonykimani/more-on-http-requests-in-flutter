import 'dart:convert';

import 'package:http/http.dart';
import 'package:http_requests_in_flutter/models/property_model.dart';

class HttpService {
  final propertyUrl = Uri.parse('https://arasaka.onrender.com/properties');

  Future<List<Property>> getProperties() async {
    Response response = await get(propertyUrl);

    if(response.statusCode == 200){
      List<dynamic> body = jsonDecode(response.body);

      List<Property> properties = body.map(
          (dynamic element) => Property.fromJson(element),
      ).toList();

      return properties;
    }else{
      throw "Properties not found";
    }
  }
}
