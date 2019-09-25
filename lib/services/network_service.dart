import 'package:homebrands/model/Product.dart';
import 'package:homebrands/model/category.dart';
import 'package:homebrands/model/shop.dart';
import 'package:homebrands/model/user.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class Api {
  Future<List<Shop>> getTrendingShops();

  Future<List<Product>> getFeaturedProducts();

  Future<List<Shop>> getShops();

  Future<List<Product>> getProductByShopID(int shopID);

  Future<AuthResponse> validateLoginCredentials(
      String username, String password);

  Future<List<CategoryList>> getCatergories();
}

class NetworkService extends Api {
  String baseURL = "https://homebrands.herokuapp.com/";

  Future<Map<String, String>> _getBearerToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String bearerToken = prefs.get('bearerToken');
    return {'Authorization': 'Bearer $bearerToken'};
  }

  @override
  Future<List<Shop>> getTrendingShops() {
    // TODO: implement getFeaturedShops
    return null;
  }

  @override
  Future<List<Product>> getProductByShopID(int shopID) {
    // TODO: implement getProductByShopID
    return null;
  }

  @override
  Future<List<Shop>> getShops() {
    // TODO: implement getShops
    return null;
  }

  @override
  Future<List<Product>> getFeaturedProducts() {
    // TODO: implement getTrendingProducts
    return null;
  }

  @override
  Future<AuthResponse> validateLoginCredentials(
      String username, String password) async {
    var url = '$baseURL/auth/signin';
    var response = await http.post(
      url,
      body: {'username': username, 'password': password},
    );
    if (response.statusCode == 200) {
      return AuthResponse.fromJson(response.body.toString());
    } else {
      throw NetworkException(response.body);
    }
  }

  @override
  Future<List<CategoryList>> getCatergories() async {
    var url = '$baseURL/category';
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return CategoryList.fromJson(response.body.toString());
    } else {
      throw NetworkException(response.body);
    }
  }
}

class NetworkException implements Exception {
  String cause;

  NetworkException(this.cause);
}
