import 'dart:convert';

import 'package:api_post/core/constants.dart';
import 'package:api_post/post_model/post_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static Future<List<PostModel>?> getPosts() async {
    try {
      var url = Uri.parse(apiconstant.baseurl + apiconstant.baseend);
      var res = await http.get(url);
      if (res.statusCode == 200) {
        List data = jsonDecode(res.body) as List;
        List<PostModel> Posts = data.map((e) => PostModel.fromJson(e)).toList();
        return Posts;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

}
