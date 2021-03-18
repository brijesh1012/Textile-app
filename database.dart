
import 'package:flutter/cupertino.dart';
import 'package:flutter_course/app/home/Models/cart.dart';
import 'package:flutter_course/app/services/APIPath.dart';
import 'package:flutter_course/app/services/firestore_service.dart';

import 'package:flutter_course/app/home/Models/product.dart';

abstract class Database {
  Future<void> createProduct(Product product);
  Stream<List<Product>> productStream();
  Stream<List<Product>> myProduct();
  Stream<List<Product>> myFav(List l);
}
String documentIdFromCurrentDate() => DateTime.now().toIso8601String();
class FirestoreDatabase implements Database {
  FirestoreDatabase({@required this.uid}) : assert(uid != null);
  final String uid;
  final _service = FirestoreService.instance;
  Future<void> createProduct(Product product ) async => await _service.setData(
        path: APIPath.pro(documentIdFromCurrentDate()),
        data: product.toMap(),
      );
/*
  Future<void> addFavorite(Fav fav)async => _service.updateData(
    path: APIPath.addToFavorite(uid),
    data: fav.
    //data: {'name' : product.name,}
  );
*/

  Stream<List<Product>> productStream() => _service.collectionStream(path: APIPath.pros(), builder: (data) => Product.fromMap(data));
  Stream<List<Product>> myProduct() => _service.myProductStream(path: APIPath.pros(), builder: (data) => Product.fromMap(data));
  Stream<List<Product>> myFav(l) => _service.myFavoriteStream(path: APIPath.pros(),list: l,builder: (data) => Product.fromMap(data));
}
