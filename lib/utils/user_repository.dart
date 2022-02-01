import 'dart:convert';
import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:cia_client/constant.dart';
import 'package:cia_client/utils/data.dart';
import 'package:cia_client/utils/storage_manager.dart';
// import 'package:cia_client/storage_manager.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  // final baseUrl = "";
  Future signin(String email, String password) async {
    // bool isExist = await APICacheManager().isAPICacheKeyExist(email);
    // if (isExist) {
    //   var cache = await APICacheManager().getCacheData(email);
    //   var user = jsonDecode(cache.syncData);
    //   if (user['password'] == password) {
    //     StorageManager.saveData("username", user['username']);
    //     StorageManager.saveData("email", email);
    //     StorageManager.saveData("userId", user['userId']);
    //     return {"message": "Login Successfull", "success": true, "data": user};
    //   } else {
    //     return {"message": "Invalid password", "success": false, "data": null};
    //   }
    // } else {
    //   return {"message": "Invalid email", "success": false, "data": null};
    // }
    var obj = {
      "email": email,
      "password": password,
    };
    // String user = jsonEncode(obj);
    var res = await http.post(Uri.parse(baseURL+"/login"),
        body: obj);
    print(res.body);
    var user = jsonDecode(res.body);
    StorageManager.saveData("username", user['username']);
    StorageManager.saveData("token", user['token']);
    StorageManager.saveData("email", email);
    StorageManager.saveData("userId", user['_id']);
    return (user);
  }

  Future signup(
      String username, String email, String password, String cPassword) async {
    var obj = {
      "username": username,
      "email": email,
      "password": password,
      "confirmPassword": cPassword,
    };
    // String user = jsonEncode(obj);
    // bool isNotExist = await APICacheManager().isAPICacheKeyExist(email);
    // if (!isNotExist) {
    //   APICacheDBModel cacheDBModel =
    //       new APICacheDBModel(key: email, syncData: user);

    //   await APICacheManager().addCacheData(cacheDBModel);
    // } else {
    //   return {"message": "Email already exist", "success": false, "data": null};
    // }
    var res = await http.post(Uri.parse(baseURL+"/signup"),
        body: obj);
    // print(res.body);
    // bool isExist = await APICacheManager().isAPICacheKeyExist(email);
    // if (isExist) {
    //   var cache = await APICacheManager().getCacheData(email);
    //   var user = jsonDecode(cache.syncData);
    //   StorageManager.saveData("username", username);
    //   StorageManager.saveData("email", email);
    //   StorageManager.saveData("userId", user['userId']);
    //   return {"message": "Signup Successfull", "success": true, "data": user};
    // } else {
    //   return {"message": "Signup Failed", "success": false, "data": null};
    // }
    return (jsonDecode(res.body));
  }

  Future addEducation(Map object) async {
    var token = await StorageManager.readData('token');
    var res = await http.put(
      Uri.parse(baseURL+"/add/education"),
      headers: {'x-access-token': token},
      body: object,
    );
    return (jsonDecode(res.body));
    // String email = await StorageManager.readData("email");
    // var cache = await APICacheManager().getCacheData(email);
    // Map user = jsonDecode(cache.syncData);

    // List edu = user['education'];
    // edu.add(object);
    // user.update("education", (value) => edu);

    // String source = jsonEncode(user);

    // bool deleted = await APICacheManager().deleteCache(email);

    // if (deleted) {
    //   APICacheDBModel cacheDBModel =
    //       new APICacheDBModel(key: email, syncData: source);

    //   bool isSaved = await APICacheManager().addCacheData(cacheDBModel);
    //   if (isSaved) {
    //     return user;
    //   }
    // }
  }

  Future getEducation() async {
    // String email = await StorageManager.readData("email");
    // var cache = await APICacheManager().getCacheData(email);
    // Map user = jsonDecode(cache.syncData);
    // return user['education'];
    var token = await StorageManager.readData('token');
    var res = await http.get(
      Uri.parse(baseURL+"/get/education"),
      headers: {'x-access-token': token},
    );
    var result = jsonDecode(res.body);
    // print(result);
    return (result['data']);
  }

  Future addExperience(Map object) async {
    var token = await StorageManager.readData('token');
    var res = await http.put(
        Uri.parse(baseURL+"/add/experience"),
        headers: {'x-access-token': token},
        body: object);
    return (jsonDecode(res.body));
    // String email = await StorageManager.readData("email");
    // var cache = await APICacheManager().getCacheData(email);
    // Map user = jsonDecode(cache.syncData);

    // List exp = [];
    // exp.add(object);
    // user.update("experience", (value) => exp);

    // String source = jsonEncode(user);

    // bool deleted = await APICacheManager().deleteCache(email);

    // if (deleted) {
    //   APICacheDBModel cacheDBModel =
    //       new APICacheDBModel(key: email, syncData: source);

    //   bool isSaved = await APICacheManager().addCacheData(cacheDBModel);
    //   if (isSaved) {
    //     return user;
    //   }
    // }
  }

  Future getExperience() async {
    // String email = await StorageManager.readData("email");
    // var cache = await APICacheManager().getCacheData(email);
    // Map user = jsonDecode(cache.syncData);
    // return user['experience'];
    var token = await StorageManager.readData('token');
    print(token);
    var res = await http.get(
      Uri.parse(baseURL+"/get/experience"),
      headers: {'x-access-token': token},
    );
    var result = jsonDecode(res.body);
    print(result);
    return (result['data']);
  }

  Future getAllPosts() async {
    var value = await StorageManager.readData("userId").then((value) async {
      if (value != null) {
        bool postExist = await APICacheManager().isAPICacheKeyExist("post");
        if (!postExist) {
          var post = jsonEncode({"post": data});
          APICacheDBModel postCacheDBModel =
              new APICacheDBModel(key: "post", syncData: post);

          await APICacheManager().addCacheData(postCacheDBModel);
          getAllPosts();
        } else {
          var res = await APICacheManager().getCacheData("post");
          Map postCache = jsonDecode(res.syncData);
          print(postCache);
          return postCache['post'];
        }
      } else {
        return [];
      }
    });
    return value;
  }

  Future getSinglePost(String postId) async {
    List value = await StorageManager.readData("userId").then((value) async {
      if (value != null) {
        var res = await APICacheManager().getCacheData("post");
        Map postCache = jsonDecode(res.syncData);
        print(postCache);
        return postCache['post'];
      } else {
        return [];
      }
    });
    value.retainWhere((post) => post['postId'] == postId);
    return value;
  }

  Future like(String postId, String userId) async {
    List allPost = await getAllPosts();
    List posts = allPost.map((post) {
      if (post['postId'] == postId) {
        List liked = post['liked'];
        liked.add(userId);
        post.update("liked", (value) => liked);
        return post;
      } else {
        return post;
      }
    }).toList();
    Map obj = {"post": posts};
    String source = jsonEncode(obj);
    APICacheDBModel cacheDBModel =
        new APICacheDBModel(key: "post", syncData: source);

    await APICacheManager().addCacheData(cacheDBModel);
  }

  Future disLike(String postId, String userId) async {
    List allPost = await getAllPosts();
    List posts = allPost.map((post) {
      if (post['postId'] == postId) {
        List liked = post['liked'];
        liked.remove(userId);
        post.update("liked", (value) => liked);
        return post;
      } else {
        return post;
      }
    }).toList();
    Map obj = {"post": posts};
    String source = jsonEncode(obj);
    APICacheDBModel cacheDBModel =
        new APICacheDBModel(key: "post", syncData: source);

    await APICacheManager().addCacheData(cacheDBModel);
  }
}
