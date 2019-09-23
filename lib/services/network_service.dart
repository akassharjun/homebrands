import 'package:homebrands/model/Product.dart';
import 'package:homebrands/model/shop.dart';

abstract class Api {
  Future<List<Shop>> getTrendingShops();

  Future<List<Product>> getFeaturedProducts();

  Future<List<Shop>> getShops();

  Future<List<Product>> getProductByShopID(int shopID);
}

class NetworkService extends Api{
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
	
}