import 'package:hnflutter_challenge/data/model/product_model.dart';
import 'package:hnflutter_challenge/domain/entity/Bakery.dart';
import 'package:hnflutter_challenge/domain/entity/item.dart';
import 'package:hnflutter_challenge/domain/entity/order.dart';
import 'package:hnflutter_challenge/utils/mapper/mapper.dart';

import '../data/model/bakery_model.dart';
import '../domain/entity/product.dart';

var listOfBakeries = [
  BakeryResponse(
      id: 1,
      name: 'Bakery1',
      lat: 31.26,
      lon: 30.16,
      rate: 5,
      type: 'cake',
      products: [
        ProductResponse(
            id: 1, name: 'Product1', ingredients: [], type: 'cake1', image: ''),
        ProductResponse(
            id: 2, name: 'Product2', ingredients: [], type: 'cake2', image: ''),
      ],
      logo: ''),
  BakeryResponse(
      id: 1,
      name: 'Bakery2',
      lat: 31.26,
      lon: 30.16,
      rate: 5,
      type: 'pies',
      products: [
        ProductResponse(
            id: 5, name: 'Product5', ingredients: [], type: 'pie', image: ''),
        ProductResponse(
            id: 6, name: 'Product6', ingredients: [], type: 'pie', image: ''),
      ],
      logo: ''),
  BakeryResponse(
      id: 1,
      name: 'Bakery3',
      lat: 31.26,
      lon: 30.16,
      rate: 5,
      type: 'pies',
      products: [
        ProductResponse(
            id: 5, name: 'Product5', ingredients: [], type: 'pie', image: ''),
        ProductResponse(
            id: 6, name: 'Product6', ingredients: [], type: 'pie', image: ''),
      ],
      logo: ''),
  BakeryResponse(
      id: 1,
      name: 'Bakery4',
      lat: 31.26,
      lon: 30.16,
      rate: 5,
      type: 'bread',
      products: [
        ProductResponse(
            id: 3, name: 'Product3', ingredients: [], type: 'bread', image: ''),
        ProductResponse(
            id: 4, name: 'Product4', ingredients: [], type: 'bread', image: ''),
      ],
      logo: ''),
  BakeryResponse(
      id: 1,
      name: 'Bakery5',
      lat: 31.26,
      lon: 30.16,
      rate: 5,
      type: 'bread',
      products: [
        ProductResponse(
            id: 3, name: 'Product3', ingredients: [], type: 'bread', image: ''),
        ProductResponse(
            id: 4, name: 'Product4', ingredients: [], type: 'bread', image: ''),
      ],
      logo: ''),
];
var listOfProducts = [
  ProductResponse(
      id: 1, name: 'Product1', ingredients: [], type: 'cake1', image: ''),
  ProductResponse(
      id: 2, name: 'Product2', ingredients: [], type: 'cake2', image: ''),
  ProductResponse(
      id: 3, name: 'Product3', ingredients: [], type: 'bread', image: ''),
  ProductResponse(
      id: 4, name: 'Product4', ingredients: [], type: 'bread', image: ''),
  ProductResponse(
      id: 5, name: 'Product5', ingredients: [], type: 'pie', image: ''),
  ProductResponse(
      id: 6, name: 'Product6', ingredients: [], type: 'pie', image: ''),
];

BakeryResponse? viewProfile(int id) {
  for (var element in listOfBakeries) {
    if (element.id == id) {
      return element;
    }
  }
  return null;
}

List<Product> getListOfProducts(int bakeryId) {
  var list = <Product>[];
  listOfBakeries.forEach((element) {
    if(element.id == bakeryId){
      list = element.products.map((e) => e.toDomain()).toList();
    }
  });
  return list;
}

List<Order> getOrderList() {
  var list = <Order>[Order(orderId:1, orderDate:'1/1/2023',items: [],status: 'Done',paymentMethod: 'cash',price: 200),Order(orderId:1, orderDate:'1/1/2023',items: [],status: 'Cancelled',paymentMethod: 'cash',price: 200)];
  return list;
}

List<BakeryResponse> useTypeFilter(String type) {
  var list = <BakeryResponse>[];
  listOfBakeries.forEach((element) {
    if (element.type == type) {
      list.add(element);
    }
  });
  return list;
}
