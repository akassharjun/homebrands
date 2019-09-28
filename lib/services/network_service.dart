import 'package:homebrands/model/category.dart';
import 'package:homebrands/model/product.dart';
import 'package:homebrands/model/shop.dart';
import 'package:homebrands/model/user.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class Api {
  Future<ShopList> getTrendingShops();

  Future<ProductList> getFeaturedProducts();

  Future<ShopList> getShops();

  Future<ProductList> getProductByShopID(String shopID);

  Future<AuthResponse> validateLoginCredentials(
      String username, String password);

  Future<CategoryList> getCatergories();

  Future<ShopList> getShopsByCategoryName(String categoryName);

  Future<NewUser> registerUser(User user);
}

class NetworkService extends Api {
  String baseURL = "https://homebrands.herokuapp.com";

  Future<Map<String, String>> _getBearerToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String bearerToken = prefs.get('bearerToken');
    return {'Authorization': 'Bearer $bearerToken'};
  }

  @override
  Future<ShopList> getTrendingShops() {
    // TODO: implement getFeaturedShops
    return null;
  }

  @override
  Future<AuthResponse> validateLoginCredentials(
      String username, String password) async {
    print(username + " " + password);
    print('$baseURL/auth/signin');
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
  Future<CategoryList> getCatergories() async {
    var url = '$baseURL/categories';
    var response = await http.get(
      url,
      headers: await _getBearerToken(),
    );
    print(response.body);
    if (response.statusCode == 200) {
      return CategoryList.fromJson(response.body.toString());
    } else {
      throw NetworkException(response.body);
    }
  }

  @override
  Future<ShopList> getShopsByCategoryName(String categoryName) async {
    var url = '$baseURL/categories/$categoryName';
    var response = await http.get(
      url,
      headers: await _getBearerToken(),
    );
    print("SHOP LIST");
    print(response.body);
    if (response.statusCode == 200) {
      print("SHOP LIST NOW");
      print(ShopList.fromJson(response.body.toString()).shopList);
      print(ShopList.fromJson(response.body.toString()).shopList.toString());
      return ShopList.fromJson(response.body.toString());
    } else {
      throw NetworkException(response.body);
    }
  }

  @override
  Future<ProductList> getFeaturedProducts() {
    // TODO: implement getFeaturedProducts
    return null;
  }

  @override
  Future<ShopList> getShops() {
    // TODO: implement getShops
    return null;
  }

  @override
  Future<NewUser> registerUser(User user) async {
    var url = '$baseURL/auth/signup';
    var response = await http.post(url, body: user.toJson());
    if (response.statusCode == 200) {
      return NewUser.fromJson(response.body.toString());
    } else {
      throw NetworkException(response.body);
    }
  }

  @override
  Future<ProductList> getProductByShopID(String shopID) async {
    var url = '$baseURL/shops/$shopID/items';
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return ProductList.fromJson(response.body.toString());
    } else {
      throw NetworkException(response.body);
    }
  }
}

class NetworkException implements Exception {
  String cause;

  NetworkException(this.cause);
}
