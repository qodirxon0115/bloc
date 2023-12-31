
import 'package:dio/dio.dart';

import '../model/post_model.dart';

class Network {
  static String BASE = "jsonplaceholder.typicode.com";
  static Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8'
  };

  /* Http Apis */

  static String API_LIST = "/posts";
  static String API_CREATE = "/posts";
  static String API_UPDATE = "/posts/"; //{id}
  static String API_DELETE = "/posts/"; //{id}

/* Http Requests */
  static Future<List<dynamic>?> GET(String api) async {
    try {
      var response = await Dio().get(api);

      if (response.statusCode == 200) {
        return response.data;
      } else {
        return null;
      }
    } catch (e) {
      print('Error GET :\n $e \n\n');
    }
  }

  static Future<String?> POST(String api, Map<String, dynamic> params) async {
    try {
      var response = await Dio().post(api, data: params);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data.toString();
      } else {
        return null;
      }
    } catch (e) {
      print('Error POST :\n $e \n\n');
    }
    return null;
  }


  static Future<String?> PUT(String api, Map<String, dynamic> params) async {
    try {
      var response = await Dio().put(api, data: params);
      print('PUT response : \n $response \n\n');
      if (response.statusCode == 200) {
        return response.data.toString();
      } else {
        return null;
      }
    } catch (e) {
      print('Error PUT :\n $e \n\n');
    }
  }
  static Future<String?> DEL(String api) async {
    try {
      var response = await Dio().delete(api);

      if (response.statusCode == 200) {
        return response.data.toString();
      } else {
        return null;
      }
    } catch (e) {
      print('Error DEL :\n $e \n\n');
    }
  }

  /* Http Params */

  static Map<String, dynamic> paramsCreate(Post post) {
    Map<String, dynamic> params = {};

    params.addAll({
      'userId' : post.userId,
      'title' : post.title,
      'body' : post.body
    });
    return params;
  }

  static Map<String, String> paramsUpdate(Post post) {
    Map<String, String> params = {};

    params.addAll({
      'userId' : post.userId.toString(),
      'id' : post.id.toString(),
      'title' : post.title,
      'body' : post.body
    });
    return params;
  }

  /* HTTP Parsing */
  static List<Post> parsePostList(List<dynamic> response) {
    List<Post> data = [];

    for (var element in response) {
      Post post = Post(
          userId: element['userId'],
          id: element['id'],
          title: element['title'],
          body: element['body']);
      data.add(post);
    }

    return data;
  }
}